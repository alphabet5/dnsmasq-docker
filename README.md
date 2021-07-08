# dnsmasq-docker
 Simple dnsmasq docker container.

[Source Code](https://github.com/alphabet5/dnsmasq-docker)

[Docker Hub](https://hub.docker.com/repository/docker/alphabet5/dnsmasq)

## Getting Started

By default, 1.1.1.1 and 9.9.9.9 are used as forwarding servers.

```bash
docker run -d \
  --name=dnsmasq \
  -p 53:53/tcp \
  -p 53:53/udp \
  alphabet5/dnsmasq
```

The dnsmasq configuration file is stored at /etc/dnsmasq.conf

```text
-v /local/dnsmasq.conf:/etc/dnsmasq.conf
```

Configuration options can be passed when running the docker container.

```bash
docker run -d \
  --name=dnsmasq \
  -p 53:53/tcp \
  -p 53:53/udp \
  alphabet5/dnsmasq \
  --server=1.1.1.1 \ # primary nameserver
  --server=9.9.9.9 \ # secondary nameserver
  --server=/domain.com/192.168.1.1 \ # primary nameserver used for queries to domain.com
  --server=/domain.com/192.168.1.2 \ # secondary nameserver used for queries to domain.com
  --log-queries \ #logs all queries (will often fill your logs quickly)
  --address=/test.host.123/192.168.1.1 #static ip used for test.host.123
```

A full list of arguments can be printed by running:
```bash
docker run alphabet5/dnsmasq --help
```

## Build Instructions

```bash
git clone https://github.com/alphabet5/dnsmasq-docker.git
cd dnsmasq-docker
docker build .
```
