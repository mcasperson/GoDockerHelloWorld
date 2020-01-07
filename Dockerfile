# Use the official Go image for compiling the source code. Call this image "builder".
FROM golang:1.13 as builder
# Set the working directory in Docker image to /go/src/app.
WORKDIR /go/src/app
# Copy the file from the local directory into the Docker image /go/src/app directory.
COPY . .
# Compile the application
RUN CGO_ENABLED=0 GO111MODULE=on go build .

# This is the base image that executes the application.
FROM alpine:latest
# Set the working directory in the DOcker image to /root.
WORKDIR /root/
# Copy the executable compiled in the image "builder" to this image.
COPY --from=builder /go/src/app/helloworld .
# Expose port 8080.
EXPOSE 8080
# Execute the application
CMD ["/root/helloworld"]