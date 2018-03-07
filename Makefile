.PHONY: all clean

CFLAGS = -ggdb -O0 -Wall -std=c99
PKG_CONFIG_LIBS = \
	egl glesv2 \
	wayland-egl wayland-client \
	xkbcommon \
	wpe wpebackend-fdo wpe-webkit

TARGET = wpe-fdo-view
SOURCE = main.c
OBJ_DEPS = \
	xdg-shell-unstable-v6-protocol.o \
	fullscreen-shell-unstable-v1-protocol.o

all: $(TARGET)

xdg-shell-unstable-v6-protocol.o: \
	xdg-shell-unstable-v6-protocol.c \
	xdg-shell-unstable-v6-client-protocol.h

fullscreen-shell-unstable-v1-protocol.o: \
	fullscreen-shell-unstable-v1-protocol.c \
	fullscreen-shell-unstable-v1-client-protocol.h

wpe-fdo-view: $(SOURCE) $(OBJ_DEPS)
	$(CC) $(CFLAGS) \
		`pkg-config --libs --cflags $(PKG_CONFIG_LIBS)` \
		-o $@ \
		$^

clean:
	rm -f *.o
	rm -f $(TARGET)
