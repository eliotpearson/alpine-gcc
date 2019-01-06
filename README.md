# alpine-gcc

Docker image based on Alpine linux set up with gcc toolchain, libuv and NASM.

## How to use it

### Run the image in interactive mode

```sh
docker run --rm -it -v ~/<YOUR_LOCAL_DIR>:/workspace/code ospatil/alpine-gcc bash
```

> where `~/<YOUR_LOCAL_DIR>` is a local directory in your home directory on the host machine
and `/workspace/code` is the directory inside the docker container to which it is mapped to.

### Test the setup

Create a file `uv.c` in your `~/<YOUR_LOCAL_DIR>` on the host machine with the following contents:

```c
#include <stdio.h>
#include <stdlib.h>
#include <uv.h>

int main(void)
{
  uv_loop_t *loop = malloc(sizeof(uv_loop_t));
  uv_loop_init(loop);

  printf("Now quitting.\n");
  uv_run(loop, UV_RUN_DEFAULT);

  uv_loop_close(loop);
  free(loop);
  return 0;
}
```

Change into `workspace/code` directory inside the container and compile it with the following command:

```sh
gcc -Wall uv.c -luv -Wl,-rpath,/usr/local/lib64 -o uv
```

Run the generated binary:

```sh
bash-4.4# ./uv
Now quitting.
```

### Enjoy

Code away on the host machine while building and running it inside the linux container.

## Why

I occasionally like to dabble in systems programming and assembly for learning purposes. One of the challenges in doing so is majority of learning resources use linux and I happen to work on a Mac. It's a constant hassle to try to map between the two and virtual machines tend to become unwieldy fairly soon. Et voilà!
