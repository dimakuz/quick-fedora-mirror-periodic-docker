FROM fedora:29

LABEL image=dimakuz/quick-fedora-mirror-periodic-docker
MAINTAINER Dima Kuznetsov "dmitrykuzn@gmail.com" 

RUN \
	dnf install -y git zsh rsync bash coreutils curl crontabs findutils hostname && \
	dnf clean all && \
	git clone https://pagure.io/quick-fedora-mirror.git

ENV CHECKIN_SITE=change-me
ENV CHECKIN_HOST=change-me
ENV CHECKIN_PASSWORD=change-me
ENV FILTEREXP=

VOLUME /timefiledir
VOLUME /mirror

ADD sync-mirror.sh /

ENV SCHED="0 1 * * *"
RUN sed -i -e 's~^\(session.*pam_loginuid.so\)$~#\1~' /etc/pam.d/crond
ADD docker-entrypoint.sh /
CMD /docker-entrypoint.sh
