CXX = g++-13
CXXFLAGS = -std=c++20 -Wall -Wextra -Wpedantic

all: main

main: main.cpp cluster.hpp utils.hpp
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
	rm -f main