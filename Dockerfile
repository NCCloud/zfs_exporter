FROM golang:buster

RUN echo "deb http://ftp.debian.org/debian buster-backports main contrib" >> /etc/apt/sources.list.d/backports.list && \
    apt-get update && \
    apt-get -y install -t buster-backports zfsutils-linux && \
    mkdir /app 
ADD . /app
WORKDIR /app
RUN go build -o zfs_exporter .
USER nobody
CMD ["./zfs_exporter"]
