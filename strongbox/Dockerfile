FROM openjdk:8

RUN wget -O /tmp/strongbox-release_1-1_all.deb https://github.com/schibsted/strongbox/raw/repos/strongbox-release_1-1_all.deb \
    && dpkg -i /tmp/strongbox-release_1-1_all.deb \
    && apt-get update \
    && apt-get install strongbox-cli \
    && rm -rf /var/lib/apt/lists/

ENTRYPOINT [ "strongbox" ]
