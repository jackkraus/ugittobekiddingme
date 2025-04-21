#include <iostream>
#include <queue>
#include "cluster.h"
using namespace std;

// TODO: HLS has fixed width floating-point types
// 		definitely need that for the centroid calculations
 
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


// allows compiler to know array size
template<size_t Rows, size_t Cols>

// pair<double, double> calcCentroid() {
// 	// calc centroid	
// }

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
			
	for(int i = 0; i < Rows; i++) { 
		for(int j = 0; j < Cols; j++) { 
			// is value 1 and not been visited yet?
			if(arr[i][j] == 1 && !visited[i][j]) { 
				vector<ClusterPoint> cluster; // est a cluster of points
				// queue will be needed in case of several points not in 
				// 	direct adjacency to the first point
				queue<ClusterPoint> q; 
				clusterID++;	
				
				// add non-visited hit to queue	
				q.push(ClusterPoint(i,j,clusterID));
				// it has now been visited
				visited[i][j] = true;
				
				// loop through the queue and pop when done
				while(!q.empty()){
					ClusterPoint hit = q.front(); // grab off top	
					cout << "cluster #" <<hit.clusterID << " ("<< hit.x<< ", " << hit.y<< ")" << endl;
					q.pop();
					cluster.push_back(hit); // add hit to cluster
					
					// loop over all adjacent neighbors
					for(int k = 0; k < 8; k++) {
						int adj_i = hit.x + drw[k];
						int adj_j = hit.y + dcl[k];

						// mind the bounds 
						if(adj_i >= 0 && adj_i < Rows && adj_j >=0 && adj_j < Cols) {
							// is it a hit and has it not already been visited?
							if(arr[adj_i][adj_j] == 1 && !visited[adj_i][adj_j]) {
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
			}				} 
		}
	return cluster_pts;
} 

template<size_t Rows, size_t Cols>
/* sw_findClusters Parameters: 
 * 	&arr - reference to 2D array, not decayed to pointer (loses size info)
 * 	k->length of submatrices (for 10x10, make it 5)
 */
vector<vector<ClusterPoint>> sw_findClusters(int (&arr)[Rows][Cols], int k) { 
	int clusterID_start = -1;
	vector<vector<ClusterPoint>> cluster_pts;

	// array of the 8-adjacent spaces for each direction
	int drw[] = {-1, 0, 1, -1, 1, -1, 0, 1};
	int dcl[] = {-1, -1, -1, 0, 0, 1, 1, 1};

	//TODO: queue of cluster points
		
	for(int i = 0; i < k; i++) { // Rows at x=0
		// calculate values on the first k cols
		for(int j = 0; j < k; j++) { // Cols at y=0
			// check if the value is a 1
			if(arr[i][j] == 1) { // it's a hit! do we need to revisit it?
				cout << "win1: arr["<<i<<"]["<<j<<"] HIT!"<<endl;

				// determine if cluster
					// loop over all directions	
					// add to cluster
				//for(int dir = 0; dir < 8; dir++) {
				//}
			} 
		}

		//moving the window one column to the right and calculating values of next
		for(int j = Cols-k; j<Cols; j++) {
			// check if the value is a 1
			if(arr[i][j] == 1) { // it's a hit!
				cout << "win2: arr["<<i<<"]["<<j<<"] HIT!"<<endl;

				// determine if cluster
					// loop over all directions	
					// add to cluster
			}
		}
	}	
	
	for(int i = Rows-k; i < Rows; i++) { // Rows at x=Rows-k
		for(int j = 0; j < k; j++) {
			// check if the value is a 1
			if(arr[i][j] == 1) { // it's a hit!
				cout << "win3: arr["<<i<<"]["<<j<<"] HIT!"<<endl;

				// determine if cluster
					// loop over all directions	
					// add to cluster
			}
		}
		for(int j = Cols-k; j < Cols; j++) {
			// check if the value is a 1
			if(arr[i][j] == 1) { // it's a hit!
				cout << "win4: arr["<<i<<"]["<<j<<"] HIT!"<<endl;

				// determine if cluster
					// loop over all directions	
					// add to cluster
			}

		}
	}
	return cluster_pts;
} 



//void writeClusterPointsCSV(const std::vector<Point>& points, const std::string& filename) {
//	std::ofstream outfile(filename);
//    	if (!outfile) {
//    	    std::cerr << "Error opening file: " << filename << std::endl;
//    	    return;
//    	}
//    	
//    	outfile << "cluster_id,x,y\n";
//    	for (const auto& point : points) {
//    	    outfile << point.cluster_id << "," << point.x << "," << point.y << "\n";
//    	}
//    	outfile.close();
//}
//
//void writeClusterCentroidsCSV(const std::vector<Cluster>& clusters, const std::string& filename) {
//	std::ofstream outfile(filename);
//    	if (!outfile) {
//    	    std::cerr << "Error opening file: " << filename << std::endl;
//    	    return;
//    	}
//    	
//    	outfile << "cluster_id,centroid_x,centroid_y\n";
//    	for (const auto& cluster : clusters) {
//    	    outfile << cluster.id << "," << cluster.centroid_x << "," << cluster.centroid_y << "\n";
//    	}
//    	outfile.close();
//}

int main() {

	vector<vector<ClusterPoint>> naive_clusters = naive_findClusters(sample_arr, k);
	// vector<vector<ClusterPoint>> clusters = sw_findClusters(sample_arr, k);

        // for every subwindow we can identify a possible cluster if a window sum is not zero
        // if that window is above a threshold and then send it to calculate the centroid
        // 		then you can take the average of all the points in the cluster
      
	
	// print clusters
	for(const auto& cluster : naive_clusters) {
		cout << "cluster_";
		for(const ClusterPoint& p: cluster) {
			cout << p.clusterID << ": (" << p.x<< ","<<p.y<<") ";
		}
		cout << endl;
	}	

        // Write output files
        // writeClusterPointsCSV(points, "cluster_points.csv");
        // writeClusterCentroidsCSV(clusters, "cluster_centroids.csv");
        
        std::cout << "Clustering completed. Results written\n";
        
        return 0;
}
