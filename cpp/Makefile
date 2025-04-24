CXX = g++
CXXFLAGS = -std=c++20 -Wall -Wextra -pedantic -O2

EXECS = testbench

all: $(EXECS)

generate.o: generate.cpp generate.hpp
	$(CXX) $(CXXFLAGS) -c $<

cluster.o: cluster.cpp cluster.hpp
	$(CXX) $(CXXFLAGS) -c $<

testbench.o: testbench.cpp generate.hpp cluster.hpp
	$(CXX) $(CXXFLAGS) -c $<

testbench: testbench.o generate.o cluster.o
	$(CXX) $(CXXFLAGS) -o $@ testbench.o generate.o cluster.o

clean:
	rm -f $(EXECS) *.o