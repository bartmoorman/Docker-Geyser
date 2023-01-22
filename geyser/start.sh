#!/bin/bash
exec $(which java) \
    -Xms${GEYSER_MIN_MEM:-1G} \
    -Xmx${GEYSER_MAX_MEM:-2G} \
    -jar /opt/geyser/Geyser-Standalone.jar
