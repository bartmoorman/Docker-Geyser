### Docker Run
```
docker run \
--detach \
--name geyser \
--restart unless-stopped \
--publish 19132:19132/udp \
--volume geyser-data:/var/lib/geyser \
bmoorman/geyser:latest
```

### Docker Compose
```
version: "3.7"
services:
  geyser:
    image: bmoorman/geyser:latest
    container_name: geyser
    restart: unless-stopped
    ports:
      - "19132:19132/udp"
    volumes:
      - geyser-data:/var/lib/geyser

volumes:
  geyser-data:
```

### Environment Variables
|Variable|Description|Default|
|--------|-----------|-------|
|TZ|Sets the timezone|`America/Denver`|
|GEYSER_MIN_MEM|Sets the minimum RAM allocated to java|`1G`|
|GEYSER_MAX_MEM|Sets the maximum RAM allocated to java|`2G`|
