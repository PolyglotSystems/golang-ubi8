FROM registry.access.redhat.com/ubi8/ubi:latest

ENV GOLANG_VERSION=1.16.2

CMD [ "/bin/bash" ]

# Basic Updates
RUN dnf update -y \
  && dnf install -y wget curl gnupg make git \
  && dnf clean all \
  && rm -rf /var/cache/yum

RUN mkdir -p /opt/{app-root,app-src}/ \
 && mkdir -p /opt/app-root/{bin,go} \
 && mkdir -p /opt/app-root/go/{bin,src} \
 && chmod -R 777 /opt/app-*

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/app-root/bin:/opt/app-root/go/bin
ENV GOPATH=/opt/app-root/go

RUN wget –q -O /tmp/golang.tar.gz https://golang.org/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz \
 && tar -C /opt/app-root -xzf /tmp/golang.tar.gz \
 && go version

RUN rm -rf /var/log/*