FROM fedora:29

LABEL image=dimakuz/quick-fedora-mirror-periodic-docker
MAINTAINER Dima Kuznetsov "dmitrykuzn@gmail.com"

RUN \
	dnf install -y git zsh rsync bash coreutils curl findutils hostname && \
	dnf clean all && \
	git clone https://pagure.io/quick-fedora-mirror.git

ENV CHECKIN_SITE=change-me
ENV CHECKIN_HOST=change-me
ENV CHECKIN_PASSWORD=change-me
ENV FILTEREXP=

VOLUME /timefiledir
VOLUME /mirror

ADD run_periodically.py /
ADD docker-entrypoint.sh /

CMD /docker-entrypoint.sh
