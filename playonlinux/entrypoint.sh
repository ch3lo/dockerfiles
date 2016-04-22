#!/bin/bash

set -x

chown -R pol:pol /home/pol

/usr/local/bin/gosu pol playonlinux $@
