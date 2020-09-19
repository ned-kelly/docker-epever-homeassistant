#!/bin/bash

export PWD=/opt/epever
export HOME=/root
export TERM=xterm
export SHLVL=1
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export _=/usr/bin/env

echo "Starting MQTT Client..."
cd /opt/epever && \
    php client

#sleep 100000