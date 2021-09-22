ARG GOLANG_VERSION=1.16.2
ARG SYSTEM_ARCH=amd64
ARG SYSTEM_OS=linux

FROM registry.access.redhat.com/ubi8/ubi:latest

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

RUN echo "GOLANG_VERSION: ${GOLANG_VERSION}\nSYSTEM_OS: ${SYSTEM_OS}\nSYSTEM_ARCH: ${SYSTEM_ARCH}"

RUN curl -sSLk https://golang.org/dl/go${GOLANG_VERSION}.${SYSTEM_OS}-${SYSTEM_ARCH}.tar.gz -o /tmp/golang.tar.gz \
 && tar -C /opt/app-root -xzf /tmp/golang.tar.gz \
 && go version

RUN rm -rf /var/log/*