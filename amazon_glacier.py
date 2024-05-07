#!/usr/bin/python

import argparse
import boto3
from botocore.utils import calculate_tree_hash
import json

import resource
import sys
import os

class Glacier:
    def __init__(self):
        self.gClient = boto3.client("glacier")

    def print_res(self, response):
        print(json.dumps(response, sort_keys= True, indent= 2))

    def get_file_size(self, file):
        file.seek(0, os.SEEK_END)
        file_size = file.tell()
        file.seek(0)
        return file_size

    def upload_archive(self, vault, filename, file):
        file_size = self.get_file_size(file) 
        if file_size >= 1024*1024*1024*4:
            print("File too large for regular upload: ", file_size)
            return

        response = self.gClient.upload_archive(
                vaultName= vault,
                body= file,
                archiveDescription= filename,
                checksum= calculate_tree_hash(file)
            )
        self.print_res(response)

    def delete_archive(self, vault, fileId):
        response = self.gClient.delete_archive(
                vaultName= vault,
                archiveId= fileId
            )
        self.print_res(response)

    def upload_multipart(self, vault, filename, file):
        part_size = 1048576

        print(" ** Initiating Upload")
        imu_response = self.gClient.initiate_multipart_upload(
                vaultName= vault,
                archiveDescription= filename,
                partSize= str(part_size)
            )
        self.print_res(imu_response)
        upload_id = imu_response['uploadId']

        file_checksum = calculate_tree_hash(file)

        file_size = self.get_file_size(file)

        range_start = 0
        range_end = part_size - 1

        checksums = []
        uploaded = 0

        while range_start < file_size:
            print(" ** Uploading {0} --> {1}".format(range_start, range_end))
            size_to_read = min(part_size, file_size - uploaded)
            file_part = file.read(size_to_read)

            ump_response = self.gClient.upload_multipart_part(
                    vaultName= vault,
                    uploadId= upload_id,
                    range= "bytes {0}-{1}/*".format(range_start, range_end),
                    body= file_part
                )
            self.print_res(ump_response)

            checksums.append(ump_response['checksum'])
            range_start = range_end + 1
            range_end += part_size
            range_end = range_end if range_end < file_size else file_size - 1
            uploaded += size_to_read

        print(" ** Completing Upload")
        cmu_response = self.gClient.complete_multipart_upload(
                    vaultName= vault,
                    uploadId= upload_id,
                    archiveSize= str(file_size),
                    checksum= file_checksum
                )
        self.print_res(cmu_response)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description= 'Amazon Glacier operations')
    parser.add_argument("--vault-name", dest= "vault_name", help="vault name (must be present)", required=True)

    group = parser.add_mutually_exclusive_group()
    group.add_argument("--filename", dest= "filename", help="file name for upload (-u or -m)")
    group.add_argument("--file-id", dest= "file_id", help="file id for deletion (-d)")

    group = parser.add_mutually_exclusive_group()
    group.add_argument("-u", action='store_true', help="Upload file")
    group.add_argument("-m", action='store_true', help="Upload file (multipart)")
    group.add_argument("-d", action='store_true', help="Delete file")

    args = parser.parse_args()

    glacier_wrapper = Glacier()

    if args.u:
        with open(args.filename, 'rb') as f:
            glacier_wrapper.upload_archive(args.vault_name, args.filename, f)
    elif args.m:
        with open(args.filename, 'rb') as f:
            glacier_wrapper.upload_multipart(args.vault_name, args.filename, f)
    elif args.d:
        glacier_wrapper.delete_archive(args.vault_name, args.file_id)
    else:
        parser.print_help()

