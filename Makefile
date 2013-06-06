CXXFLAGS += --std=c++0x

all: check

check: testparse
	./testparse

clean: 
	rm -f testparse

testparse: testparse.cc 
