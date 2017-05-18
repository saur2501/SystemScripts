#This target will compile all the files
#can use variables instead of g++; like CC=g++ and CFLAGS=-c -Wall and use $(CC) ew
all: hello

hello: main.o function1.o function2.o
	g++ main.cpp function1.cpp function2.cpp -o hello
#compile:
main.o: main.cpp
	g++ -c main.cpp

function1.o: function1.cpp
	g++ -c function1.cpp

function2.o: function2.cpp
	g++ -c function2.cpp

clean:
	rm -rf *o hello
