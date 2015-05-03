SRCDIR = src
INCDIR = include
LIBDIR = lib
CPP = g++

# CFLAGS = -O2 -s -w -std=c++11 -I$(INCDIR)/nwbd -I$(INCDIR)/tcod
CFLAGS = -g -Wall -std=c++11 -I$(INCDIR)/tcod

# Determine if operating system is 32-bit or 64-bit
 ifeq ($(shell uname -m),x86_64)
 	# These are the definitions specific to 64-bit systems
	LFLAGS = -L$(LIBDIR)/x86_64 -ltcod -ltcodxx -Wl,-rpath=$(LIBDIR)/x86_64
 else
	#These are the definitions specific to 32-bit systems
 	LFLAGS = -L$(LIBDIR)/i386 -ltcod -ltcodxx -Wl,-rpath=$(LIBDIR)/i386
 endif

SUFFIXES: .o .hpp .cpp

all: clean tuto

tuto:
	@$(CPP) $(SRCDIR)/*.cpp -o tuto $(CFLAGS) $(LFLAGS)

clean:
	@rm -f tuto
