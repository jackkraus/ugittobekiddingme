#include <chrono>
#include <iostream>
#include <vector>

#include "generate.hpp"
#include "cluster.hpp"

int main(int argc, char* argv[]) {
    // Set default parameters
    int nrow = 10;
    int ncol = 10;
    int nhitmax = 9;
    int nclustmax = 9;
    int seed = 0;
    bool debug = false;

    // Parse command line arguments
    for (int i = 1; i < argc; ++i) {
        if (std::string(argv[i]) == "--nrow" && i + 1 < argc) {
            nrow = std::stoi(argv[++i]);
        } else if (std::string(argv[i]) == "--ncol" && i + 1 < argc) {
            ncol = std::stoi(argv[++i]);
        } else if (std::string(argv[i]) == "--nhitmax" && i + 1 < argc) {
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
        std::cout << "nrow: " << nrow << std::endl;
        std::cout << "ncol: " << ncol << std::endl;
        std::cout << "nhitmax: " << nhitmax << std::endl;
        std::cout << "nclustmax: " << nclustmax << std::endl;
        std::cout << "seed: " << seed << std::endl;
        std::cout << std::endl;
    }

    // Generate grid
    std::vector<std::vector<int>> grid = generate(nrow, ncol, nhitmax, nclustmax, debug);
    
    // Get naive clusters
    std::chrono::high_resolution_clock::time_point start = std::chrono::high_resolution_clock::now();
    std::vector<Point> clusters1 = naive_findClusters(grid, debug);
    std::chrono::high_resolution_clock::time_point end = std::chrono::high_resolution_clock::now();

    std::cout << "\nTime taken to find clusters (1st method):"
              << std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count()
              << " nanoseconds" << std::endl;

    // Print clusters
    printGridWithClusters(nrow, ncol, clusters1);

    return 0;
}
