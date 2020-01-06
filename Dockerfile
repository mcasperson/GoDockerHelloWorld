FROM golang:1.13 as builder

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...
RUN CGO_ENABLED=0 GO111MODULE=on go build .
RUN ls -la

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/app/helloworld .
EXPOSE 8080
CMD ["/root/helloworld"]