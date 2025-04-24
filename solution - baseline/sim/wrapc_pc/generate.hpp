#ifndef GENERATE_HPP
#define GENERATE_HPP

#include <iostream>
#include <vector>

#define NROWS 10
#define NCOLS 10

void printGrid(const std::vector<std::vector<int>>& grid);

// Inserting cluster into grid int g[NROW][NCOL]
void insert_cluster(std::vector<std::vector<int>>& g, const int nhitmax, const bool debug);

// Overlap check
void overlap_check(std::vector<std::vector<int>>& g, std::vector<std::vector<int>>& tg, const size_t nrow, const size_t ncol, const bool debug);

std::vector<std::vector<int>> generate(const size_t nrow, const size_t ncol, const int nhitmax, const int nclustmax, const bool debug);

#endif
