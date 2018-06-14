FROM dimakuz/quick-fedora-mirror-docker

LABEL image=dimakuz/quick-fedora-mirror-periodic-docker
MAINTAINER Dima Kuznetsov "dmitrykuzn@gmail.com" 

ENV SCHED="0 1 * * *"
ADD docker-entrypoint.sh /
CMD /docker-entrypoint.sh
