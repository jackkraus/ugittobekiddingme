#include <array>
#include <chrono>
#include <iostream>
#include <string>
#include <queue>
#include <vector>

#include "generate.hpp"

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

void gridToCSV(std::vector<Point>& grid, int iteration) {
    for (int i = 0; i < grid.size(); ++i) {
        std::cout << iteration << "," << grid[i].x << "," << grid[i].y << "," << grid[i].clusterID << "\n";
    }
}

void gridToCSV(std::vector<std::vector<Point>>& grid, int iteration) {
    for (int i = 0; i < grid.size(); ++i) {
        for (int j = 0; j < grid[i].size(); ++j) {
            std::cout << iteration << "," << grid[i][j].x << "," << grid[i][j].y << "," << grid[i][j].clusterID << "\n";
        }
    }
}

void gridToCSV(std::vector<std::vector<int>>& grid, int iteration) {
    for (int i = 0; i < grid.size(); ++i) {
        for (int j = 0; j < grid[i].size(); ++j) {
            std::cout << iteration << "," << i << "," << j << "," << grid[i][j]<< "\n";
        }
    }
}

void gridToCSV(short grid[NROWS + 2][NCOLS + 2], int iteration) {
    for (int i = 0; i < NROWS + 2; ++i) {
        for (int j = 0; j < NCOLS + 2; ++j) {
            std::cout << iteration << "," << i << "," << j << "," << grid[i][j]<< "\n";
        }
    }
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
// Actually this is finding all the connected components of a graph
std::vector<Point> naive_findClusters(std::vector<std::vector<int>>& grid) {
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

    int iteration = 0;
    gridToCSV(grid, iteration++);

    for (int i = 0; i < nrows; i++) {
        for (int j = 0; j < ncols; j++) {
            // Visit unvisited hits
            if (grid[i][j] && !visited[i][j]) {
                // Mark hit as visited
                visited[i][j] = true;

                // Create queue of neighbors
                std::queue<Point> cluster{};
                cluster.push(Point(i, j, ++clusterID));
                grid[i][j] = clusterID;
                gridToCSV(grid, iteration++);

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
                                grid[adj_i][adj_j] = clusterID;
                                gridToCSV(grid, iteration++);
                                visited[adj_i][adj_j] = true;
                            }
                        }
                    }
                }
            }
        }   // Grid cols
    }   // Grid rows

    return clusters;
}

// Minimally optimized version that will synthesize in HLS
std::array<std::array<Point, NCOLS>, NROWS> naive_findClustersHLS1(int grid[NROWS][NCOLS]) {
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

    // Convert grid to array
    std::array<std::array<Point, NCOLS>, NROWS> clusterArray;
    for (int i = 0; i < NROWS; i++) {
        for (int j = 0; j < NCOLS; j++) {
            clusterArray[i][j] = clusterGrid[i][j];
        }
    }

    return clusterArray;
}

// Assume that grid is on all sides with 0s
// This allows us to skip bounds checking as long as we remain in [1, NROWS] and [1, NCOLS]
// Anything in the padded area will be considered not-a-hit,
// and so won't affect the cluster identification
void naive_findClustersHLS2(short grid[NROWS + 2][NCOLS + 2], Point pointsGrid[NROWS + 2][NCOLS + 2]) {
    short maxClusterID = 1;
    short clusterGrid1[NROWS + 2][NCOLS + 2] = {0};
    short clusterGrid2[NROWS + 2][NCOLS + 2] = {0};

#pragma HLS RESOURCE variable=clusterGrid1 core=RAM_2P_BRAM
#pragma HLS RESOURCE variable=clusterGrid2 core=RAM_2P_BRAM
#pragma HLS ARRAY_PARTITION variable=upperLeftNeighborXCoords complete dim=1
#pragma HLS ARRAY_PARTITION variable=upperLeftNeighborYCoords complete dim=1
#pragma HLS ARRAY_PARTITION variable=lowerRightNeighborXCoords complete dim=1
#pragma HLS ARRAY_PARTITION variable=lowerRightNeighborYCoords complete dim=1

int iteration = 0;

    // First pass: assign initial cluster IDs based on neighbors above and left
    FirstPass:
    for (int i = 1; i < NROWS + 1; i++) {
        FirstPassInner:
        for (int j = 1; j < NCOLS + 1; j++) {
#pragma HLS PIPELINE II=11
            if (grid[i][j]) {
                short minClusterID = maxClusterID;
				short neighborID0 = clusterGrid1[i + upperLeftNeighborXCoords[0]][j + upperLeftNeighborYCoords[0]];
				short neighborID1 = clusterGrid1[i + upperLeftNeighborXCoords[1]][j + upperLeftNeighborYCoords[1]];
				short neighborID2 = clusterGrid1[i + upperLeftNeighborXCoords[2]][j + upperLeftNeighborYCoords[2]];
				short neighborID3 = clusterGrid1[i + upperLeftNeighborXCoords[3]][j + upperLeftNeighborYCoords[3]];

                if (neighborID0) minClusterID = (minClusterID < neighborID0 ? minClusterID : neighborID0);
                if (neighborID1) minClusterID = (minClusterID < neighborID1 ? minClusterID : neighborID1);
                if (neighborID2) minClusterID = (minClusterID < neighborID2 ? minClusterID : neighborID2);
                if (neighborID3) minClusterID = (minClusterID < neighborID3 ? minClusterID : neighborID3);       

                if (minClusterID == maxClusterID) maxClusterID++;

                clusterGrid1[i][j] = minClusterID;
                grid[i][j] = minClusterID;
                gridToCSV(grid, iteration++);
            }
        }
    }

    // Second pass: propagate lowest clusterID forward to unify connected components
    SecondPass:
    for (int i = 1; i < NROWS + 1; i++) {
        SecondPassInner:
        for (int j = 1; j < NCOLS + 1; j++) {
#pragma HLS PIPELINE II=11
            if (grid[i][j]) {
                short minClusterID = clusterGrid1[i][j];

                short neighborID0 = clusterGrid1[i + lowerRightNeighborXCoords[0]][j + lowerRightNeighborYCoords[0]];
				short neighborID1 = clusterGrid1[i + lowerRightNeighborXCoords[1]][j + lowerRightNeighborYCoords[1]];
				short neighborID2 = clusterGrid1[i + lowerRightNeighborXCoords[2]][j + lowerRightNeighborYCoords[2]];
				short neighborID3 = clusterGrid1[i + lowerRightNeighborXCoords[3]][j + lowerRightNeighborYCoords[3]];

                if (neighborID0) minClusterID = (minClusterID < neighborID0 ? minClusterID : neighborID0);
                if (neighborID1) minClusterID = (minClusterID < neighborID1 ? minClusterID : neighborID1);
                if (neighborID2) minClusterID = (minClusterID < neighborID2 ? minClusterID : neighborID2);
                if (neighborID3) minClusterID = (minClusterID < neighborID3 ? minClusterID : neighborID3);   

                clusterGrid2[i][j] = minClusterID;
                grid[i][j] = minClusterID;
                gridToCSV(grid, iteration++);

                clusterGrid2[i + lowerRightNeighborXCoords[0]][j + lowerRightNeighborYCoords[0]] = minClusterID;
                if (grid[i + lowerRightNeighborXCoords[0]][j + lowerRightNeighborYCoords[0]]) {
                    grid[i + lowerRightNeighborXCoords[0]][j + lowerRightNeighborYCoords[0]] = minClusterID;
                }
                gridToCSV(grid, iteration++);

				clusterGrid2[i + lowerRightNeighborXCoords[1]][j + lowerRightNeighborYCoords[1]] = minClusterID;
                if (grid[i + lowerRightNeighborXCoords[1]][j + lowerRightNeighborYCoords[1]]) {
                    grid[i + lowerRightNeighborXCoords[1]][j + lowerRightNeighborYCoords[1]] = minClusterID;
                }
                gridToCSV(grid, iteration++);

				clusterGrid2[i + lowerRightNeighborXCoords[2]][j + lowerRightNeighborYCoords[2]] = minClusterID;
                if (grid[i + lowerRightNeighborXCoords[2]][j + lowerRightNeighborYCoords[2]]) {
                    grid[i + lowerRightNeighborXCoords[2]][j + lowerRightNeighborYCoords[2]] = minClusterID;
                }
                gridToCSV(grid, iteration++);

				clusterGrid2[i + lowerRightNeighborXCoords[3]][j + lowerRightNeighborYCoords[3]] = minClusterID;
                if (grid[i + lowerRightNeighborXCoords[3]][j + lowerRightNeighborYCoords[3]]) {
                    grid[i + lowerRightNeighborXCoords[3]][j + lowerRightNeighborYCoords[3]] = minClusterID;
                }
                gridToCSV(grid, iteration++);

            }
        }
    }

    // Final pass: Merge clusterGrid1 and clusterGrid2
    CreateResult:
    for (int i = 0; i < NROWS + 2; i++) {
        CreateResultInner:
        for (int j = 0; j < NCOLS + 2; j++) {
#pragma HLS PIPELINE II=1
            if (grid[i][j]) {
                short clusterID = clusterGrid2[i][j] ? clusterGrid2[i][j] : clusterGrid1[i][j];
                pointsGrid[i][j] = Point(i, j, clusterID);
            } else {
                pointsGrid[i][j] = Point(i, j, 0);
            }
        }
    }
}

int main(int argc, char* argv[]) {
    // Set default parameters
    int nhitmax = 9;
    int nclustmax = 9;
    int seed = 0;
    bool debug = false;

    // Parse command line arguments
    for (int i = 1; i < argc; ++i) {
        if (std::string(argv[i]) == "--nhitmax" && i + 1 < argc) {
            nhitmax = std::stoi(argv[++i]);
        } else if (std::string(argv[i]) == "--nclustmax" && i + 1 < argc) {
            nclustmax = std::stoi(argv[++i]);
        } else if (std::string(argv[i]) == "--seed" && i + 1 < argc) {
            seed = std::stoi(argv[++i]);
            srand(seed); // Set the random seed
        } else if (std::string(argv[i]) == "--debug") {
            debug = true;
        }
    }

    if (debug) {
        // Print the parameters
        std::cout << "Parameters:" << std::endl;
        std::cout << "nrow: " << NROWS << std::endl;
        std::cout << "ncol: " << NCOLS << std::endl;
        std::cout << "nhitmax: " << nhitmax << std::endl;
        std::cout << "nclustmax: " << nclustmax << std::endl;
        std::cout << "seed: " << seed << std::endl;
        std::cout << std::endl;
    }

    // Generate grid
    std::vector<std::vector<int>> grid = generate(NROWS, NCOLS, nhitmax, nclustmax, debug);

    

    // Get clusters from original solution 
    // std::vector<Point> clusters = naive_findClusters(grid);

    // Get clusters from baseline HLS solution
    // int gridArray[NROWS][NCOLS] = {};
    // for (int i = 0; i < NROWS; i++) {
    //     for (int j = 0; j < NCOLS; j++) {
    //         gridArray[i][j] = grid[i][j];
    //     }
    // }

    // std::array<std::array<Point, NCOLS>, NROWS> clusters1 = naive_findClustersHLS1(gridArray);    

    // Get clusters from optimized HLS solution
    short paddedGrid[NROWS + 2][NCOLS + 2] = {};
    for (size_t i = 0; i < NROWS; ++i) {
        for (size_t j = 0; j < NCOLS; ++j) {
            paddedGrid[i + 1][j + 1] = grid[i][j] ? true : false;
        }
    }

    Point clusters2[NROWS + 2][NCOLS + 2] = {};
    naive_findClustersHLS2(paddedGrid, clusters2);

    // Flatten clusters1 and clusters2 to vectors
    // std::vector<Point> clusters1_flat;
    // for (int i = 0; i < NROWS; i++) {
    //     for (int j = 0; j < NCOLS; j++) {
    //         clusters1_flat.push_back(clusters1[i][j]);
    //     }
    // }

    // std::vector<Point> clusters2_flat;
    // for (int i = 0; i < NROWS + 2; i++) {
    //     for (int j = 0; j < NCOLS + 2; j++) {
    //         clusters2_flat.push_back(clusters2[i][j]);
    //     }
    // }

    // Print clusters
    // std::cout << "Clusters from original solution:" << std::endl;
    // printGridWithClusters(NROWS, NCOLS, clusters);
    // std::cout << std::endl;

    // std::cout << "Clusters from baseline HLS solution:" << std::endl;
    // printGridWithClusters(NROWS, NCOLS, clusters1_flat);
    // std::cout << std::endl;

    // std::cout << "Clusters from optimized HLS solution:" << std::endl;
    // printGridWithClusters(NROWS + 2, NCOLS + 2, clusters2_flat);
    // std::cout << std::endl;

    return 0;
}
