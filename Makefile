CC 		 = gcc
CFLAGS   = -Wall -Wextra -I$(RAYLIBSRC)
LIBS     = -L$(RAYLIBSRC) -lraylib -lm

RAYLIBSRC = thirdparty/raylib/src

all: libraylib.a tame.o
	$(CC) $(CFLAGS) -o tame tame.o $(LIBS)

libraylib.a:
	$(MAKE) -C $(RAYLIBSRC) PLATFORM=PLATFORM_DESKTOP

tame.o: tame.c
	$(CC) $(CFLAGS) -c tame.c -o tame.o

.PHONY: clean
clean:
	rm -f $(RAYLIBSRC)/libraylib.a *.o tame
