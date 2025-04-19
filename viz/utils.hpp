#include <format>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

#ifndef UTILS_HPP
#define UTILS_HPP

struct Point {
    double x;
    double y;
};

struct Cluster {
    std::vector<Point> points;
    Point centroid;
};

std::string DATADIR{"../data/"};
std::vector<std::string> files {
    "2spiral.csv", "3MC.csv", "banana.csv", 
    "complex9.csv", "cure-t2-4k.csv", "curves1.csv", 
    "curves2.csv", "dartboard1.csv", "dartboard2.csv", 
    "diamond9.csv", "donut3.csv", "donutcurves.csv",
    "ds2c2sc13.csv", "pearl.csv", "rings.csv",
    "smile2.csv", "spherical_6_2.csv", "spiralsquare.csv",
    "target.csv", "twenty.csv", "twodiamonds.csv",
    "zelnik1.csv", "zelnik3.csv", "zelnik6.csv"
};

// Read x,y,class data from CSV file with a header
std::vector<Point> readPointsFromFile(const std::string& filepath) {
    // Open file for reading
    std::ifstream file(filepath);
    if (!file.is_open()) {
        std::cerr << "Error opening file: " << filepath << std::endl;
        return {};
    }

    // Read/skip header
    std::string line{};
    std::getline(file, line);

    // Read each line
    std::vector<Point> points{};
    while (std::getline(file, line)) {      // Read next line
        // Extract x,y from line
        std::stringstream ss(line);
        std::string x_str{}, y_str{};
        std::getline(ss, x_str, ',');
        std::getline(ss, y_str, ',');

        // Add point to vector
        points.push_back({std::stod(x_str), std::stod(y_str)});
    }

    // Close file
    file.close();

    // Return points
    return points;
}

void printCluster(const Cluster& cluster, bool printAll=false) {
    std::cout << std::format("Cluster centroid: x: {}, y: {}", cluster.centroid.x, cluster.centroid.y) << std::endl;
    
    if (printAll) {
        for (const auto& point : cluster.points) {
            std::cout << std::format("x: {}, y: {}", point.x, point.y) << std::endl;
        }
    }
}

#endif