#!/bin/bash
tinyproxy
touch /var/log/tinyproxy/tinyproxy.log
chown tinyproxy /var/log/tinyproxy/tinyproxy.log
tail -f /var/log/tinyproxy/tinyproxy.log