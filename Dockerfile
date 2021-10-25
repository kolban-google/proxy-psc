FROM debian
RUN apt-get update && apt-get install -y \
  tinyproxy \
  procps \
  net-tools
COPY run.sh /
COPY filter /etc/tinyproxy/
COPY tinyproxy.conf /etc/tinyproxy/
COPY hosts /etc/
CMD bash /run.sh