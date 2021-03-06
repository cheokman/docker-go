FROM centos:7
MAINTAINER Ben Wu <wucheokman@gmail.com>

ENV GOROOT     /usr/local/go
ENV GOHOME     /usr/local
ENV GOPATH     /opt/third-party/go
ENV GO_VERSION  1.7.3

#https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz
RUN yum -y update \
    && yum -y install tar \
    git \
    wget \
    && yum clean all \
    && mkdir -p "${GOPATH}" \
    && curl -Ls "https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz" | tar -xz --directory ${GOHOME}

WORKDIR ${GOROOT}
ENV PATH $PATH:${GOROOT}/bin
