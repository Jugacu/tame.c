CC = gcc
CFLAGS = -Wall -Wextra -Ithirdparty/raylib/src

RAYLIBSRC = thirdparty/raylib/src

all: libraylib.a tame.o
	$(CC) $(CFLAGS) -o tame tame.o -L$(RAYLIBSRC) -lraylib -lm -ldl -pthread -lrt -lX11 -lGL -lXrandr -lXi

libraylib.a:
	$(MAKE) -C $(RAYLIBSRC) PLATFORM=PLATFORM_DESKTOP

tame.o: tame.c
	$(CC) $(CFLAGS) -c tame.c -o tame.o

.PHONY: clean
clean:
	rm -f $(RAYLIBSRC)/libraylib.a *.o tame
