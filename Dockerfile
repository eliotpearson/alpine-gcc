FROM alpine
LABEL maintainer="ospatil@gmail.com"
RUN apk update && apk upgrade && apk add bash build-base gdb valgrind git cmake nasm && \
  mkdir -p workspace/github && cd workspace/github && git clone https://github.com/libuv/libuv.git && \
  cd libuv && mkdir -p out/cmake && cd out/cmake && \
  cmake -DBUILD_TESTING=ON ../.. && make && make install

# All of above but based on debian
# FROM debian
# LABEL maintainer="ospatil@gmail.com"
# RUN apt-get update && \
#   apt-get install -y apt-utils build-essential gdb valgrind git cmake nasm && \
#   mkdir -p workspace/github && \
#   cd workspace/github && \
#   git clone https://github.com/libuv/libuv.git &&\
#   cd libuv && \
#   mkdir -p out/cmake && cd out/cmake && cmake -DBUILD_TESTING=ON ../.. && make all test && make install
