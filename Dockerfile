FROM centos:7
MAINTAINER "John Hazelwood" <jhazelwo@users.noreply.github.com>
RUN yum clean all && yum -y upgrade && \
    yum -y install https://prerelease.keybase.io/keybase_amd64.rpm
RUN install -d -m 0700 -o 1000 -g 1000 /aws && \
  groupadd --gid 1000 human && \
  useradd --uid 1000 --gid 1000 --home-dir /aws/home -M --shell /bin/bash human
WORKDIR /aws
USER human
RUN /usr/bin/run_keybase
