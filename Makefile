CXX = g++
CXXFLAGS = -std=c++20 -Wall -Wextra -pedantic -O2

EXECS = generate #cluster main

all: $(EXECS)

generate: generate.cpp generate.h
	$(CXX) $(CXXFLAGS) -o $@ $<

cluster: cluster.cpp cluster.h
	$(CXX) $(CXXFLAGS) -o $@ $<

main: main.cpp generate.h cluster.h
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
	rm -f $(EXECS)