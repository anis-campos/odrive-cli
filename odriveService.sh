#!/bin/bash
exec /sbin/setuser ${USER} /usr/local/bin/odriveagent  >> /var/log/odriveagent.log 2>&1
