CC          = gcc
CFLAGS      = -Wall -Wextra -Isrc -I$(RAYLIBSRC)
LIBS        = -L$(RAYLIBSRC) -lraylib -lm -ldl -pthread -lrt -lX11 -lGL -lXrandr -lXi
RAYLIBSRC   = thirdparty/raylib/src
BUILD_DIR   = build
SOURCES = $(shell find src -name "*.c")

all: $(BUILD_DIR)/tame

$(RAYLIBSRC)/libraylib.a:
	$(MAKE) -C $(RAYLIBSRC) PLATFORM=PLATFORM_DESKTOP

$(BUILD_DIR)/tame: $(RAYLIBSRC)/libraylib.a $(SOURCES) | $(BUILD_DIR)
	$(CC) $(SOURCES) -o $@ $(CFLAGS) $(LIBS)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	$(MAKE) -C $(RAYLIBSRC) clean
	rm -rf $(BUILD_DIR) *.o tame

.PHONY: all clean

