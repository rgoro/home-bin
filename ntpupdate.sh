#!/bin/bash

/etc/init.d/ntp stop
ntpdate ntp.ubuntu.com
/etc/init.d/ntp start
