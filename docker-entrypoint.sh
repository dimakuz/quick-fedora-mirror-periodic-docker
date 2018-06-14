#!/bin/bash -xe

echo "$SCHED /sync-mirror.sh" > /etc/crontabs/root

/usr/sbin/crond -c /etc/crontabs -f
