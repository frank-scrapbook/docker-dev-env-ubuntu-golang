FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y build-essential wget

RUN wget -P /tmp/go https://go.dev/dl/go1.19.linux-amd64.tar.gz

RUN tar -C /usr/local -xzf /tmp/go/go1.19.linux-amd64.tar.gz
RUN rm /tmp/go/go1.19.linux-amd64.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

WORKDIR $GOPATH