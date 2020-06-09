FROM golang:alpine

RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go build -o zfs_exporter .
USER nobody
CMD ["./zfs_exporter"]
