FROM bmoorman/ubuntu:jammy

ARG DEBIAN_FRONTEND=noninteractive \
    GEYSER_PORT=19132/udp

WORKDIR /opt/geyser

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    openjdk-21-jre-headless \
    vim \
    wget \
 && wget --quiet --output-document "Geyser-Standalone.jar" "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone" \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /var/lib/geyser

COPY geyser/ /etc/geyser/

VOLUME /var/lib/geyser

EXPOSE ${GEYSER_PORT}

CMD ["/etc/geyser/start.sh"]
