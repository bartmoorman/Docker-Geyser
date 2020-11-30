FROM bmoorman/ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive
ARG GEYSER_PORT=19132/udp

WORKDIR /var/lib/geyser

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    openjdk-8-jre-headless \
    vim \
    wget \
 && wget --quiet --directory-prefix /opt/geyser https://ci.nukkitx.com/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/standalone/target/Geyser.jar \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY geyser/ /etc/geyser/

VOLUME /var/lib/geyser

EXPOSE ${GEYSER_PORT}

CMD ["/etc/geyser/start.sh"]
