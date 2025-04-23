#include "cluster.h"

#include "generate.h"

using namespace std;

struct CentroidPoint {
    float x;
    float y;
    int clusterID;
};

struct ClusterPoint {
    int x;
    int y;
    int clusterID;

    ClusterPoint(int x, int y, int clusterID) {
        this->x = x;
        this->y = y;
        this->clusterID = clusterID;
    }
};

// TODO: HLS has fixed width floating-point types
// 		definitely need that for the centroid calculations

vector<CentroidPoint> calcCentroid(vector<vector<ClusterPoint>> clusters) {
    // calc centroid
    vector<CentroidPoint> centroids;
    CentroidPoint c;
    float sumx = 0.f;
    float sumy = 0.f;
    int tempClusterID = 0;
    int hit_count = 0;

    for (const auto& cluster : clusters) {
        for (const ClusterPoint& p : cluster) {
            // cout << "calcCentroid:    cluster_" << p.clusterID << ": (" << p.x<< ","<<p.y<<") "<<endl;
            sumx += (float)(p.x);
            sumy += (float)(p.y);
            tempClusterID = p.clusterID;
            hit_count++;
        }
        // calculate the centroid
        c.x = sumx / hit_count;
        c.y = sumy / hit_count;
        c.clusterID = tempClusterID;
        centroids.push_back(c);  // add it to the vector of centroids
        // cout << "calcCentroid:    cent_cluster_" <<c.clusterID << ": (" << c.x<< ","<<c.y<<") "<<endl;
        // reset the vars for the next cluster
        sumx = 0.f;
        sumy = 0.f;
        hit_count = 0;
    }
    return centroids;
}

// allows compiler to know array size
template <size_t Rows, size_t Cols>
/* naive_findClusters Parameters:
 * 	&arr - reference to 2D array, not decayed to pointer (loses size info)
 * 	k->length of submatrices (for 10x10, make it 5)
 */
vector<vector<ClusterPoint>> naive_findClusters(int (&arr)[Rows][Cols], int k) {
    int clusterID = 0;
    vector<vector<ClusterPoint>> cluster_pts;

    // array of the 8-adjacent spaces for each direction
    // 	order matters here!
    int drw[] = {-1, 0, 1, -1, 1, -1, 0, 1};
    int dcl[] = {-1, -1, -1, 0, 0, 1, 1, 1};

    // if we've visited the point before we don't need to revisit it
    // 	set all values to false initially
    vector<vector<bool>> visited(Rows, vector<bool>(Cols, false));

    for (size_t i = 0; i < Rows; i++) {
        for (size_t j = 0; j < Cols; j++) {
            // is value 1 and not been visited yet?
            if (arr[i][j] == 1 && !visited[i][j]) {
                vector<ClusterPoint> cluster;  // est a cluster of points
                // queue will be needed in case of several points not in
                // 	direct adjaceny to the first point
                queue<ClusterPoint> q;
                clusterID++;

                // add non-visited hit to queue
                q.push(ClusterPoint(i, j, clusterID));
                // it has now been visited
                visited[i][j] = true;

                // loop through the queue and pop when done
                while (!q.empty()) {
                    ClusterPoint hit = q.front();  // grab off top
                    // cout << "cluster #" <<hit.clusterID << " ("<< hit.x<< ", " << hit.y<< ")" << endl;
                    q.pop();
                    cluster.push_back(hit);  // add hit to cluster

                    // loop over all adjacent neighbors
                    for (int k = 0; k < 8; k++) {
                        int adj_i = hit.x + drw[k];
                        int adj_j = hit.y + dcl[k];

                        // mind the bounds
                        if (adj_i >= 0 && adj_i < Rows && adj_j >= 0 && adj_j < Cols) {
                            // is it a hit and has it not already been visited?
                            if (arr[adj_i][adj_j] == 1 && !visited[adj_i][adj_j]) {
                                // if all of that is true, push that point to the queue
                                q.push(ClusterPoint(adj_i, adj_j, clusterID));
                                visited[adj_i][adj_j] = true;
                            }
                        }
                    }
                }
                // by this point, all cp's in q should be popped,
                // which means we're at the end of our cluster?
                cluster_pts.push_back(cluster);
            }
        }
    }
    return cluster_pts;
}

template <size_t Rows, size_t Cols>
/* sw_findClusters Parameters:
 * 	&arr - reference to 2D array, not decayed to pointer (loses size info)
 * 	k->length of submatrices (for 10x10, make it 5)
 */
vector<vector<ClusterPoint>> sw_findClusters(int (&arr)[Rows][Cols], int k) {
    int clusterID_start = 0;
    vector<vector<ClusterPoint>> cluster_pts;

    // array of the 8-adjacent spaces for each direction
    int drw[] = {-1, 0, 1, -1, 1, -1, 0, 1};
    int dcl[] = {-1, -1, -1, 0, 0, 1, 1, 1};

    // TODO: queue of cluster points

    for (int i = 0; i < k; i++) {  // Rows at x=0
        // calculate values on the first k cols
        for (int j = 0; j < k; j++) {  // Cols at y=0
            // check if the value is a 1
            if (arr[i][j] == 1) {  // it's a hit! do we need to revisit it?
                cout << "win1: arr[" << i << "][" << j << "] HIT!" << endl;

                // determine if cluster
                // loop over all directions
                // add to cluster
                // for(int dir = 0; dir < 8; dir++) {
                // }
            }
        }

        // moving the window one column to the right and calculating values of next
        for (int j = Cols - k; j < Cols; j++) {
            // check if the value is a 1
            if (arr[i][j] == 1) {  // it's a hit!
                cout << "win2: arr[" << i << "][" << j << "] HIT!" << endl;

                // determine if cluster
                // loop over all directions
                // add to cluster
            }
        }
    }

    for (int i = Rows - k; i < Rows; i++) {  // Rows at x=Rows-k
        for (int j = 0; j < k; j++) {
            // check if the value is a 1
            if (arr[i][j] == 1) {  // it's a hit!
                cout << "win3: arr[" << i << "][" << j << "] HIT!" << endl;

                // determine if cluster
                // loop over all directions
                // add to cluster
            }
        }
        for (int j = Cols - k; j < Cols; j++) {
            // check if the value is a 1
            if (arr[i][j] == 1) {  // it's a hit!
                cout << "win4: arr[" << i << "][" << j << "] HIT!" << endl;

                // determine if cluster
                // loop over all directions
                // add to cluster
            }
        }
    }
    return cluster_pts;
}

void writeClusterPointsCSV(const std::vector<vector<ClusterPoint>>& clusters, const std::string& filename) {
    std::ofstream outfile(filename);
    if (!outfile) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return;
    }

    outfile << "cluster_id,x,y\n";
    for (const auto& cluster : clusters) {
        for (const ClusterPoint& p : cluster) {
            outfile << p.clusterID << "," << p.x << "," << p.y << "\n";
        }
    }
    outfile.close();
}

void writeClusterCentroidsCSV(const std::vector<CentroidPoint>& cents, const std::string& filename) {
    std::ofstream outfile(filename);
    if (!outfile) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return;
    }

    outfile << "cluster_id,centroid_x,centroid_y\n";
    for (const auto& c : cents) {
        outfile << c.clusterID << "," << c.x << "," << c.y << "\n";
    }
    outfile.close();
}
void cluster() {
    for (int i = 0; i < arr_size; i++) {
        for (int j = 0; j < arr_size; j++) {
            cout << grid[i][j] << ", ";
        }
        cout << endl;
    }

    vector<vector<ClusterPoint>> clusters = naive_findClusters(grid, k);
    // vector<vector<ClusterPoint>> clusters = naive_findClusters(sample_arr, k);
    //  vector<vector<ClusterPoint>> clusters = sw_findClusters(sample_arr, k);

    // print clusters
    for (const auto& cluster : clusters) {
        cout << "main:    cluster_";
        for (const ClusterPoint& p : cluster) {
            cout << p.clusterID << ": (" << p.x << "," << p.y << ") ";
        }
        cout << endl;
    }

    // calculate centroids
    vector<CentroidPoint> centroids = calcCentroid(clusters);

    // print clusters
    for (const auto& c : centroids) {
        cout << "main:    centroid_" << c.clusterID << ": (" << c.x << "," << c.y << ") " << endl;
    }

    // Write output files
    writeClusterPointsCSV(clusters, "cluster_points.csv");
    writeClusterCentroidsCSV(centroids, "cluster_centroids.csv");

    std::cout << "Clustering completed. Results written\n";
}
