#!/bin/bash

set -x

chown -R pol:pol /home/pol/.PlayOnLinux

/usr/local/bin/gosu pol playonlinux $@
