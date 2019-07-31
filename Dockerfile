FROM golang:alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache git wget protobuf

RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v3.9.0/protoc-3.9.0-linux-aarch_64.zip
RUN unzip protoc-3.9.0-linux-aarch_64.zip -d /usr/local/ -x bin/protoc
RUN protoc -h
RUN ls /usr/local

RUN go get -u -v google.golang.org/grpc
RUN go get -u github.com/micro/protoc-gen-micro
RUN go get -u github.com/golang/protobuf/protoc-gen-go
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway

WORKDIR /opt/protos
