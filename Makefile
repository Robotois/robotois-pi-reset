CC=g++

COMPILE_FLAGS = -g -std=c++11 -Wall -c
LINKER_FLAGS = -g
LIBS = -l bcm2835 -l rt

OBJECTS = \
	main.o \
	DigitalIO.o \

#OBJECTS = $(subst .cpp,.o,$(SOURCES))

all: digital.o main.o
	$(CC) $(LINKER_FLAGS) -o runner $(OBJECTS) $(LIBS)

main.o: main.cpp
	$(CC) $(COMPILE_FLAGS) main.cpp
digital.o: DigitalIO/DigitalIO.cpp DigitalIO/DigitalIO.h
	$(CC) $(COMPILE_FLAGS) DigitalIO/DigitalIO.cpp

clean:
	$(RM) $(OBJECTS) runner
