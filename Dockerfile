FROM dimakuz/quick-fedora-mirror-docker

LABEL image=dimakuz/quick-fedora-mirror-periodic-docker
MAINTAINER Dima Kuznetsov "dmitrykuzn@gmail.com" 

RUN curl -s -o /usr/local/bin/mantra -L https://github.com/pugnascotia/mantra/releases/download/0.0.1/mantra && \
    chmod +x /usr/local/bin/mantra

ENV SCHED="0 1 * * * *"
ADD docker-entrypoint.sh /
CMD /docker-entrypoint.sh
