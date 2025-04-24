CXX = g++
CXXFLAGS = -std=c++20 -Wall -Wextra -pedantic -O2

EXECS = generate cluster #main

all: $(EXECS)

generate: generate.cpp generate.hpp
	$(CXX) $(CXXFLAGS) -o $@ $<

cluster: cluster.cpp generate.hpp cluster.hpp
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
	rm -f $(EXECS)