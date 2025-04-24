#ifndef CLUSTER_HPP
#define CLUSTER_HPP

#include <array>
#include <iostream>
#include <algorithm>
#include <fstream>
#include <numeric>
#include <string>
#include <queue>
#include <vector>

#define NROWS 10
#define NCOLS 10

// Array of the 8-adjacent spaces for each direction
// Order matters here!
const int neighborXCoords[] = {-1,  0,  1, -1,  1, -1,  0,  1};
const int neighborYCoords[] = {-1, -1, -1,  0,  0,  1,  1,  1};

const int upperLeftNeighborXCoords[] = { 0, -1, -1, -1};
const int upperLeftNeighborYCoords[] = {-1, -1,  0,  1};

const int lowerRightNeighborXCoords[] = { 0,  1,  1,  1};
const int lowerRightNeighborYCoords[] = { 1,  1,  0, -1};

struct Point {
    int x;
    int y;
    int clusterID;

    Point () { x = 0; y = 0; clusterID = 0; }
    Point (int x, int y, int clusterID) : x(x), y(y), clusterID(clusterID) {}
};

void printPoints(const std::vector<Point>& points);
void writePoints(const std::vector<Point>& points, const std::string& filename);

std::vector<Point> gridToPoints(const std::vector<std::vector<int>>& grid);
void printGridWithClusters(int nrows, int ncols, const std::vector<Point>& points);

std::vector<Point> naive_findClusters(const std::vector<std::vector<int>>& grid);
std::array<std::array<Point, NCOLS>, NROWS> naive_findClustersHLS1(int grid[NROWS][NCOLS]);
void naive_findClustersHLS2(bool grid[NROWS + 2][NCOLS + 2], Point pointsGrid[NROWS + 2][NCOLS + 2]);

#endif
