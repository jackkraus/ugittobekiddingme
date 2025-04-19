#include <vector>
#include <string>

#include "utils.hpp"
#include "cluster.hpp"

int main() {
    std::string filepath{DATADIR + files[0]};
    
    // Read data from file
    std::vector<Point> data = readPointsFromFile(filepath);

    // Perform kMeans
    std::vector<Cluster> kMeansClusters{kMeans(data, 3)};

    // Print results
    for (const Cluster& cluster : kMeansClusters) {
        printCluster(cluster);
    }
}