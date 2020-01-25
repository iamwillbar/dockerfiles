FROM debian:buster
RUN apt update && apt install -y squid && rm -rf /var/lib/apt/lists/*
VOLUME /var/spool/squid
VOLUME /var/log/squid
EXPOSE 3128
ENTRYPOINT squid -NYCd 1
