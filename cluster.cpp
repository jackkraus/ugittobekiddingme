#include <iostream>
//#include <queue>
#include "cluster.h"
using namespace std;

// TODO: HLS has fixed width floating-point types
// 		definitely need that for the centroid calculations
 
// struct Point2D {
// 	int x;
// 	int y;
// 	
// 	Point2D(int x, int y) {
// 		this->x = x;
// 		this->y = y;
// 	}
// }


// allows compiler to know array size
template<size_t Rows, size_t Cols>

// pair<double, double> calcCentroid() {
// 	// calc centroid	
// }


/* sw_findMaxSum Parameters: 
 * 	&arr - reference to 2D array, not decayed to pointer (loses size info)
 * 	k->length of submatrices (for 10x10, make it 5)
 */
int sw_findMaxSum(int (&arr)[Rows][Cols], int k) { 
	int maxSum = 0;

	// array of the 8-adjacent spaces for each direction
	int drw[] = {-1, 0, 1, -1, 1, -1, 0, 1};
	int dcl[] = {-1, -1, -1, 0, 0, 1, 1, 1};

	//TODO: queue of cluster points
		
	for(int i = 0; i < k; i++) { // Rows at x=0
		// calculate values on the first k cols
		for(int j = 0; j < k; j++) { // Cols at y=0
			// check if the value is a 1
			if(arr[i][j] == 1) { // it's a hit!
				cout << "win1: arr["<<i<<"]["<<j<<"] HIT!"<<endl;

				// determine if cluster
					// loop over all directions	
					// add to cluster
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
	return maxSum;
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

	sw_findMaxSum(sample_arr, k);

	// insert slidingWindow clustering here
        // for every subwindow we can identify a possible cluster if a window sum is not zero
        // if that window is above a threshold and then send it to calculate the centroid
        // 		then you can take the average of all the points in the cluster
	// 		(TODO: make sure diagonal hits are accounted for!!!!)
      
	// TODO: Centroid calculations!
		

        // Write output files
        // writeClusterPointsCSV(points, "cluster_points.csv");
        // writeClusterCentroidsCSV(clusters, "cluster_centroids.csv");
        
        std::cout << "Clustering completed. Results written\n";
        
        return 0;
}
