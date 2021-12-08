FROM alpine
LABEL maintainer="eliot.pearson@gmail.com"
RUN apk update && apk upgrade && apk add bash build-base gdb valgrind git cmake nasm
