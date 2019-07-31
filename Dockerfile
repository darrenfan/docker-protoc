FROM golang:alpine
#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache protobuf-dev git make

RUN go get -u google.golang.org/grpc
RUN go get -u github.com/micro/protoc-gen-micro
RUN go get -u github.com/golang/protobuf/protoc-gen-go
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway


WORKDIR /opt/protos%
