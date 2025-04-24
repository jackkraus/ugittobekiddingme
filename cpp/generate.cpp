#include <iostream>
#include <string>

#include "generate.hpp"

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

    std::vector<std::vector<int>> grid = generate(NROWS, NCOLS, nhitmax, nclustmax, debug);

    return 0;
}
