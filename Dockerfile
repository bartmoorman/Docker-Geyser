FROM bmoorman/ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive \
    GEYSER_PORT=19132/udp

WORKDIR /var/lib/geyser

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    default-jre-headless \
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
