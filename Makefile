CC 		 = gcc
CFLAGS   = -Wall -Wextra -I$(RAYLIBSRC)
LIBS     = -L$(RAYLIBSRC) -lraylib -lm -ldl -pthread -lrt -lX11 -lGL -lXrandr -lXi
RAYLIBSRC = thirdparty/raylib/src
BUILD_DIR = build

all: $(BUILD_DIR)/tame

# Trigger Raylib build
$(RAYLIBSRC)/libraylib.a:
	$(MAKE) -C $(RAYLIBSRC) PLATFORM=PLATFORM_DESKTOP

# Compile tame.o to build dir
$(BUILD_DIR)/tame.o: tame.c $(BUILD_DIR)
	$(CC) $(CFLAGS) -c tame.c -o $@

# Link final exe directly against Raylib src dir
$(BUILD_DIR)/tame: $(BUILD_DIR)/tame.o $(RAYLIBSRC)/libraylib.a
	$(CC) $(CFLAGS) -o $@ $(BUILD_DIR)/tame.o $(LIBS)

# Ensure build dir exists
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	$(MAKE) -C $(RAYLIBSRC) clean
	rm -rf $(BUILD_DIR) *.o tame

