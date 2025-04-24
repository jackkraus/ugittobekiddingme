#include <algorithm>
#include <random>
#include <vector>

#include "utils.hpp"

#ifndef CLUSTER_HPP
#define CLUSTER_HPP

// Implement kMeans clustering algorithm
std::vector<Cluster> kMeans(const std::vector<Point>& points, int k) {
    // Initialize random number generator
    int seed{12345};
    std::mt19937 rng(seed);

    // Initialize clusters
    // Choose random points as initial centroids
    // THIS CAN BE PARALLELIZED
    std::vector<Cluster> clusters(k);
    std::vector<Point> centroids(k);

    std::uniform_int_distribution<int> dist(0, points.size() - 1);
    for (int clusterIdx = 0; clusterIdx < k; ++clusterIdx) {
        centroids[clusterIdx] = points[dist(rng)];
    }

    // Iterate until convergence
    bool converged{false};
    while (!converged) {
        // Clear previous clusters
        for (Cluster& cluster : clusters) {
            cluster.points.clear();
        }

        // For each point, find the nearest centroid
        // THIS CAN BE PARALLELIZED
        for (const Point& point : points) {
            // Calculate distance to each centroid
            std::vector<double> distances(k);
            for (int clusterIdx{0}; clusterIdx < k; ++clusterIdx) {
                const Point& centroid = centroids[clusterIdx];
                distances[clusterIdx] = std::sqrt(std::pow(point.x - centroid.x, 2) + std::pow(point.y - centroid.y, 2));
            }

            // Find the nearest centroid
            std::vector<double>::iterator minDistance = std::min_element(distances.begin(), distances.end());
            int closestClusterIdx = std::distance(distances.begin(), minDistance);

            // Add point to nearest cluster
            clusters[closestClusterIdx].points.push_back(point);
        }

        // Calculate new centroids
        std::vector<Point> newCentroids(k);
        for (int clusterIdx{0}; clusterIdx < k; ++clusterIdx) {
            Cluster& cluster = clusters[clusterIdx];
            if (cluster.points.empty()) {
                continue; // Skip empty clusters
            }

            // Calculate new centroid
            double sumX{0.0}, sumY{0.0};
            for (const Point& point : cluster.points) {
                sumX += point.x;
                sumY += point.y;
            }
            newCentroids[clusterIdx] = {sumX / cluster.points.size(), sumY / cluster.points.size()};
        }

        // Check for convergence
        // Calcaluate distances between newCentroids and centroids
        // If any are greater than a threshold, set converged to false
        double THRESHOLD{1e-5};
        converged = std::all_of(centroids.begin(), centroids.end(), [&](const Point& centroid) {
            return std::sqrt(std::pow(centroid.x - newCentroids[&centroid - &centroids[0]].x, 2) +
                   std::pow(centroid.y - newCentroids[&centroid - &centroids[0]].y, 2)) < THRESHOLD;
        });

        // Update centroids
        centroids = newCentroids;

    }   // End convergence loop

    // Package and return clusters
    for (int clusterIdx{0}; clusterIdx < k; ++clusterIdx) {
        clusters[clusterIdx].centroid = centroids[clusterIdx];
    }

    return clusters;
}

#endif