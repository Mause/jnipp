CC=g++

OS_NAME := linux

ifeq ($(OS),Windows_NT)
  OS_NAME := win32
  RM := del
else
  RM := rm -f
  UNAME_S := $(shell uname -s)
  ifeq ($(UNAME_S),Darwin)
    OS_NAME := darwin
  endif
endif

JAVA_HOME ?= /usr/lib/jvm/default-java

CXXFLAGS=-I. -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/$(OS_NAME) -ldl -std=c++11 -Wall -g -llog

VPATH=tests

test: tests/main.cpp
	mkdir -p build && cd build && cmake --build ..

clean:
	-$(RM) $(SRC) test

.PHONY: clean
