# alpine-gcc

Docker image based on Alpine linux set up with gcc toolchain and NASM.

## How to use it

### Run the image in interactive mode

```sh
docker run --rm -it -v ~/<YOUR_LOCAL_DIR>:/workspace/code eliotpearson/alpine-gcc bash
```

> where `~/<YOUR_LOCAL_DIR>` is a local directory in your home directory on the host machine
and `/workspace/code` is the directory inside the docker container to which it is mapped to.

Code away on the host machine while building and running it inside the linux container.

## Why

I occasionally like to dabble in systems programming and assembly for learning purposes. One of the challenges in doing so is majority of learning resources use linux and I happen to work on a Mac.

Note: This is a simplification of ospatil/alpine-gcc. I removed libuv because I
didn't need or use it in my development.
