FROM debian:9.4

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales openssl curl

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

RUN curl -L https://github.com/mimblewimble/grin/releases/download/v1.0.0/grin-v1.0.0-479973573-linux-amd64.tgz -o grin.tgz; \
             tar xzf grin.tgz -C /usr/local/bin/; \
             rm grin.tgz;

WORKDIR /root/.grin

RUN grin --usernet server config && \
    sed -i -e 's/run_tui = true/run_tui = false/' grin-server.toml

RUN ls -al 
VOLUME ["/root/.grin"]

EXPOSE 13413 13414 13415 13416
# wallet init ?
# grin --floonet wallet init <<< $'changeme\nchangeme\n'

COPY in.sh .
# ENTRYPOINT ["grin", "--usernet"]
# CMD ["server", "run"]