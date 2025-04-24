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

#include "generate.hpp"

struct Point {
    int x;
    int y;
    int clusterID;

    Point () { x = 0; y = 0; clusterID = 0; }
    Point (int x, int y, int clusterID) : x(x), y(y), clusterID(clusterID) {}
};

void printPoints(const std::vector<Point>& points) {
    for (const auto& p : points) {
        std::cout << "Point: (" << p.x << ", " << p.y << "), Cluster ID: " << p.clusterID << std::endl;
    }
}

void writePoints(const std::vector<Point>& points, const std::string& filename) {
    std::ofstream outfile(filename);
    if (!outfile) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return;
    }

    outfile << "cluster_id,x,y\n";
    for (const auto& p : points) {
        outfile << p.clusterID << "," << p.x << "," << p.y << "\n";
    }
    outfile.close();
}

std::vector<Point> gridToPoints(const std::vector<std::vector<int>>& grid) {
    std::vector<Point> points;

    int nrows = grid.size();
    int ncols = grid[0].size();

    for (int i = 0; i < nrows; ++i) {
        for (int j = 0; j < ncols; ++j) {
            if (grid[i][j] == 1) {
                points.emplace_back(i, j, -1); // Assuming clusterID is 1 for all points
            }
        }
    }

    return points;
}

void printGridWithClusters(int nrows, int ncols, const std::vector<Point>& points) {
    std::vector<std::vector<int>> grid(nrows, std::vector<int>(ncols, 0));

    for (const auto& p : points) {
        grid[p.x][p.y] = p.clusterID;
    }

    for (int i = 0; i < nrows; ++i) {
        for (int j = 0; j < ncols; ++j) {
            std::cout << grid[i][j] << " ";
        }
        std::cout << std::endl;
    }
}

// Naive clustering
// Assume that anything directly adjacent to [i, j] is part of the same cluster
std::vector<Point> naive_findClusters(const std::vector<std::vector<int>>& grid, bool debug=false) {
    const int nrows = grid.size();
    const int ncols = grid[0].size();

    // Array of the 8-adjacent spaces for each direction
    // Order matters here!
    const int neighborXCoords[] = {-1,  0,  1, -1,  1, -1,  0,  1};
    const int neighborYCoords[] = {-1, -1, -1,  0,  0,  1,  1,  1};

    // Initialize clusters
    int clusterID = 0;
    std::vector<Point> clusters{};

    // if we've visited the point before we don't need to revisit it
    // 	set all values to false initially
    std::vector<std::vector<bool>> visited(nrows, std::vector<bool>(ncols, false));

    for (int i = 0; i < nrows; i++) {
        for (int j = 0; j < ncols; j++) {
            // Visit unvisited hits
            if (grid[i][j] && !visited[i][j]) {
                // Mark hit as visited
                visited[i][j] = true;

                // Create queue of neighbors
                std::queue<Point> cluster{};
                cluster.push(Point(i, j, ++clusterID));

                if (debug) std::cout << "Starting cluster " << clusterID << " at (" << i << ", " << j << ")" << std::endl;
                
                // Iterate over neighbors
                // Not ideal for HLS, because we don't know the iterations ahead of time
                while (!cluster.empty()) {
                    Point hit = cluster.front();  // Grab off top
                    cluster.pop();

                    // Add hit to list of points with clusters
                    clusters.push_back(hit);

                    // Loop over all adjacent neighbors
                    for (int k = 0; k < 8; k++) {
                        int adj_i = hit.x + neighborXCoords[k];
                        int adj_j = hit.y + neighborYCoords[k];

                        // Mind the bounds
                        if (adj_i >= 0 && adj_i < nrows && adj_j >= 0 && adj_j < ncols) {
                            // If (adj_i, adj_j) is a hit and has not already been visited,
                            // and it to the queue of points in the current cluster,
                            // and mark it as visited
                            if (grid[adj_i][adj_j] && !visited[adj_i][adj_j]) {
                                cluster.push(Point(adj_i, adj_j, clusterID));
                                visited[adj_i][adj_j] = true;
                                if (debug) std::cout << "Adding point (" << adj_i << ", " << adj_j << ") to cluster " << clusterID << std::endl;
                            }
                        }
                    }
                }
            }
        }   // Grid cols
    }   // Grid rows

    return clusters;
}

std::array<std::array<Point, NCOLS>, NROWS> naive_findClustersHLS1(int grid[NROWS][NCOLS], bool debug=false) {
    // Array of the 8-adjacent spaces for each direction
    // Order matters here!
    const int neighborXCoords[] = {-1,  0,  1, -1,  1, -1,  0,  1};
    const int neighborYCoords[] = {-1, -1, -1,  0,  0,  1,  1,  1};

    // Initialize clusters
    int clusterID = 0;
    Point clusterGrid[NROWS][NCOLS];

    // Set up stack for iterating over neighbors
    // Max neighbors = max size of grid
    const int stackSize = NROWS * NCOLS;
    Point stack[stackSize] = {};
    int stackIndex = 0;

    // Iterate over grid
    for (int i = 0; i < NROWS; i++) {
        for (int j = 0; j < NCOLS; j++) {
            // Every point in grid is visited at least once
            // Give the points their coordinates here
            // But keep clusterID in case it was set earlier
            clusterGrid[i][j] = Point(i, j, clusterGrid[i][j].clusterID);

            // Handle hits that haven't been assigned a cluster
            if (grid[i][j] && !clusterGrid[i][j].clusterID) {
                clusterGrid[i][j].clusterID = ++clusterID;

                if (debug) std::cout << "Starting cluster " << clusterID << " at (" << i << ", " << j << ")" << std::endl;

                // Add point to stack
                stack[stackIndex++] = clusterGrid[i][j];
                if (debug) std::cout << "stackIndex: " << stackIndex << std::endl;

                while (stackIndex > 0) {
                    // Pop point off stack
                    Point hit = stack[--stackIndex];
                    if (debug) std::cout << "stackIndex: " << stackIndex << std::endl;

                    // Loop over all adjacent neighbors
                    for (int k = 0; k < 8; k++) {
                        int adj_i = hit.x + neighborXCoords[k];
                        int adj_j = hit.y + neighborYCoords[k];
                        if (debug) std::cout << "Checking (" << adj_i << ", " << adj_j << ")" << std::endl;

                        // Mind the bounds
                        if (adj_i >= 0 && adj_i < NROWS && adj_j >= 0 && adj_j < NCOLS) {
                            // If (adj_i, adj_j) is a hit and has not already been visited,
                            // and it to the queue of points in the current cluster,
                            // and mark it as visited
                            if (grid[adj_i][adj_j] && !clusterGrid[adj_i][adj_j].clusterID) {
                                clusterGrid[adj_i][adj_j] = Point(adj_i, adj_j, clusterID);
                                stack[stackIndex++] = clusterGrid[adj_i][adj_j];
                                if (debug) std::cout << "Adding point (" << adj_i << ", " << adj_j << ") to cluster " << clusterID << std::endl;
                                if (debug) std::cout << "stackIndex: " << stackIndex << std::endl;
                            }
                        }
                    }
                }
            }
        }
    }

    // Convert grid to array
    std::array<std::array<Point, NCOLS>, NROWS> clusterArray;
    for (int i = 0; i < NROWS; i++) {
        for (int j = 0; j < NCOLS; j++) {
            clusterArray[i][j] = clusterGrid[i][j];
        }
    }

    return clusterArray;
}

std::array<std::array<Point, NCOLS>, NROWS> naive_findClustersHLS2(int grid[NROWS][NCOLS]) {
    // Array of the 8-adjacent spaces for each direction
    // Order matters here!
    const int neighborXCoords[] = {-1,  0,  1, -1,  1, -1,  0,  1};
    const int neighborYCoords[] = {-1, -1, -1,  0,  0,  1,  1,  1};

    // Initialize clusters
    int clusterID = 0;
    std::array<std::array<Point, NCOLS>, NROWS> clusterGrid{};

    // Set up stack for iterating over neighbors
    // Max neighbors = max size of grid
    const int stackSize = NROWS * NCOLS;
    Point stack[stackSize] = {};
    int stackIndex = 0;

    // Iterate over grid
    for (int i = 0; i < NROWS; i++) {
        for (int j = 0; j < NCOLS; j++) {
            // Every point in grid is visited at least once
            // Give the points their coordinates here
            // But keep clusterID in case it was set earlier
            clusterGrid[i][j] = Point(i, j, clusterGrid[i][j].clusterID);

            // Handle hits that haven't been assigned a cluster
            if (grid[i][j] && !clusterGrid[i][j].clusterID) {
                clusterGrid[i][j].clusterID = ++clusterID;

                // Add point to stack
                stack[stackIndex++] = clusterGrid[i][j];

                while (stackIndex > 0) {
                    // Pop point off stack
                    Point hit = stack[--stackIndex];

                    // Loop over all adjacent neighbors
                    for (int k = 0; k < 8; k++) {
                        int adj_i = hit.x + neighborXCoords[k];
                        int adj_j = hit.y + neighborYCoords[k];

                        // Mind the bounds
                        if (adj_i >= 0 && adj_i < NROWS && adj_j >= 0 && adj_j < NCOLS) {
                            // If (adj_i, adj_j) is a hit and has not already been visited,
                            // and it to the queue of points in the current cluster,
                            // and mark it as visited
                            if (grid[adj_i][adj_j] && !clusterGrid[adj_i][adj_j].clusterID) {
                                clusterGrid[adj_i][adj_j] = Point(adj_i, adj_j, clusterID);
                                stack[stackIndex++] = clusterGrid[adj_i][adj_j];
                            }
                        }
                    }
                }
            }
        }
    }

    return clusterGrid;
}

#endif