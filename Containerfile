FROM registry.access.redhat.com/ubi8/ubi:latest

# Setup Default Args
ARG GOLANG_VERSION=1.16.2
ARG SYSTEM_ARCH=amd64
ARG SYSTEM_OS=linux
ARG TAG_VERSION

# Our command is set to bash to allow for easy build piping
CMD [ "/bin/bash" ]

# Create file system bits
RUN mkdir -p /opt/{app-root,app-src}/ \
 && mkdir -p /opt/app-root/{bin,go} \
 && mkdir -p /opt/app-root/go/{bin,src}

# Set ENV PATHs now that the filesystem exists
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/app-root/bin:/opt/app-root/go/bin
ENV GOPATH=/opt/app-root/go

# Basic Updates
RUN dnf update -y \
  && dnf install -y wget curl gnupg make git \
  && dnf clean all \
  && rm -rf /var/cache/yum

# Install Golang
#RUN if [ -z $TAG_VERSION ]; then GO_V=$GOLANG_VERSION; else GO_V=$(echo $TAG_VERSION | sed 's/v//g'); fi \
RUN GO_V=$GOLANG_VERSION \
 && [[ ${TAG_VERSION:0:1} = "v" ]] && GO_V=$(echo $TAG_VERSION | sed 's/v//g') \
 && curl -sSLk https://golang.org/dl/go${GO_V}.${SYSTEM_OS}-${SYSTEM_ARCH}.tar.gz -o /tmp/golang.tar.gz \
 && tar -C /opt/app-root -xzf /tmp/golang.tar.gz \
 && chmod -R 777 /opt/app-* \
 && go version \
 && rm -rf /var/log/*