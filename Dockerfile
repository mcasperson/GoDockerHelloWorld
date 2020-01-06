FROM golang:1.13 as builder

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...
RUN GO111MODULE=on go build .
RUN ls -la

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/app/helloworld .
CMD ["./helloworld"]