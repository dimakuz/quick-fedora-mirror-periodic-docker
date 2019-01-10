#!/usr/bin/env python3
import datetime
import logging
import subprocess
import sys
import time

LOG = logging.getLogger(__name__)
_DELTA = datetime.timedelta(days=1)
_START_TIME=dict(
    hour=0,
    minute=0,
    second=0,
    microsecond=0,
)


def setup_logging():
    LOG.addHandler(logging.StreamHandler())
    LOG.handlers[-1].setFormatter(
        logging.Formatter(
            fmt='%(asctime)s:%(levelname)-4s:%(message)s',
            datefmt='%Y-%m-%d %H:%M:%S',
        ),
    )
    LOG.setLevel(logging.INFO)


def wait_until(when):
    while True:
        now = datetime.datetime.now()
        if when < now:
            break
        time.sleep((when - now).total_seconds())


def main():
    setup_logging()
    cmd = sys.argv[1:]
    next_run = datetime.datetime.now().replace(**_START_TIME) + _DELTA

    LOG.info('Started runner for: %s', ' '.join(cmd))

    while True:
        LOG.info('Next run at %s', next_run.isoformat())
        wait_until(next_run)

        LOG.info('Starting command')
        res = subprocess.run(cmd)
        LOG.info('Command terminated with status %d', res.returncode)

        next_run += _DELTA


if __name__ == '__main__':
    main()
