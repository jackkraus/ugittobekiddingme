#include <chrono>
#include <iostream>
#include <vector>

#include "generate.hpp"
#include "cluster.hpp"

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
    
    // Get naive clusters
    std::chrono::high_resolution_clock::time_point start = std::chrono::high_resolution_clock::now();
    std::vector<Point> clusters1 = naive_findClusters(grid, debug);
    std::chrono::high_resolution_clock::time_point end = std::chrono::high_resolution_clock::now();

    std::cout << "\nTime taken to find clusters (1st method):"
              << std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count()
              << " nanoseconds" << std::endl;

    // Convert grid to C-array
    int gridC[NROWS][NCOLS];
    for (size_t i = 0; i < NROWS; ++i) {
        for (size_t j = 0; j < NCOLS; ++j) {
            gridC[i][j] = grid[i][j];
        }
    }

    std::array<std::array<Point, NCOLS>, NROWS> clusters2 = naive_findClustersHLS2(gridC);
    
    // Flatten clusters2
    std::vector<Point> clusters2_flat;
    for (size_t i = 0; i < NROWS; ++i) {
        for (size_t j = 0; j < NCOLS; ++j) {
            if (clusters2[i][j].clusterID != 0) {
                clusters2_flat.push_back(clusters2[i][j]);
            }
        }
    }

    // Print clusters
    printGridWithClusters(NROWS, NCOLS, clusters1);
    std::cout << "-------------------------" << std::endl;
    printGridWithClusters(NROWS, NCOLS, clusters2_flat);

    return 0;
}
