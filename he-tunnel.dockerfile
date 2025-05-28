FROM debian:bookworm

RUN apt update && \
  apt install -y iproute2 iputils-ping && \
  mkdir /tunnel

COPY start-tunnel.sh /tunnel/start.sh
RUN chmod +x /tunnel/start.sh

ENTRYPOINT ["/tunnel/start.sh"]
