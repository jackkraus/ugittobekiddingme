#include <iostream>
#include <vector>

struct Point {
    double x, y;
    int cluster_id;
};

struct Cluster {
    int id;
    double centroid_x, centroid_y;
    std::vector<Point> points;
};


std::vector<Cluster> kMeansClustering(const std::vector<Point>& input_points, int k, int max_iterations = 100) {
    // insert kmeans clustering here 
}

void writeClusterPointsCSV(const std::vector<Point>& points, const std::string& filename) {
    std::ofstream outfile(filename);
    if (!outfile) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return;
    }
    
    outfile << "cluster_id,x,y\n";
    for (const auto& point : points) {
        outfile << point.cluster_id << "," << point.x << "," << point.y << "\n";
    }
    outfile.close();
}

void writeClusterCentroidsCSV(const std::vector<Cluster>& clusters, const std::string& filename) {
    std::ofstream outfile(filename);
    if (!outfile) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return;
    }
    
    outfile << "cluster_id,centroid_x,centroid_y\n";
    for (const auto& cluster : clusters) {
        outfile << cluster.id << "," << cluster.centroid_x << "," << cluster.centroid_y << "\n";
    }
    outfile.close();
}

int main() {

    int k = 3; // Number of clusters
    auto clusters = kMeansClustering(points, k);
    
    // Assign final cluster IDs to points
    assignToClusters(points, clusters);
    
    // Write output files
    writeClusterPointsCSV(points, "cluster_points.csv");
    writeClusterCentroidsCSV(clusters, "cluster_centroids.csv");
    
    std::cout << "Clustering completed. Results written\n";
    
    return 0;
}
