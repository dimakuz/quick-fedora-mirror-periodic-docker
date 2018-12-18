#!/bin/bash -xe

echo "$SCHED /sync-mirror.sh" >/etc/cron.d/sync-mirror

/usr/sbin/crond -n -m off -p
