#include <iostream>
using namespace std;

// allows compiler to know array size
//
// TODO: HLS has fixed width floating-point types
// 		definitely need that for the centroid calculations
 
template<size_t Rows, size_t Cols>

/* sw_findMaxSum Parameters: 
 * 	&arr - reference to 2D array, not decayed to pointer (loses size info)
 * 	k->length of submatrices (for 10x10, make it 5)
 */
int sw_findMaxSum(int (&arr)[Rows][Cols], int k) { 
	// init variables 
	int maxSum = 0;
	int sum1 = 0;
	int sum2 = 0;
	
	// error checking to see if k = {Rows,Cols}/2
	if ( (Rows/2 != k) || (Cols/2 != k) ) {
		cout << "Rows = " << Rows
		     << "Cols = " << Cols
		     << "k = " << k 
		     << endl;
	}	
	
	// Determine the starting positions of each window
	// first pos. 
	int x1 = 0; // 0->k
	int y1 = 0; // 0->k	
	//cout << "first pos is {"<<x1<<","<<y1<<"}"<<endl; 		
	// second pos. 
	int x2 = (Cols-k);// (Cols-k) -> Cols
	int y2 = 0; // 0 -> k	
	//cout << "second pos is {"<<x2<<","<<y2<<"}"<<endl; 			
	//third pos.
	int x3 = 0; // 0 -> k 
	int y3 = (Rows-k); // (Rows - k) -> Rows 
	//cout << "third pos is {"<<x3<<","<<y3<<"}"<<endl; 			
	//fourth pos.
	int x4 = (Cols-k); // (Cols-k) -> Cols = x2 
	int y4 = (Rows-k); // (Rows - k) -> Rows 
	//cout << "fourth pos is {"<<x4<<","<<y4<<"}"<<endl; 			

	// == Stg1 ==
	// apply the window on the first k rows
	for(int i = x1; i < k; i++) {
		// calculate values on the first k cols
		for(int j = y1; j < k; j++) {
			sum1+=arr[i][j];
			cout << "Stg1; sum1 = " << sum1 << endl; // print_debug
		}
		// compare to find the max sum as we go, and store the max value
		maxSum = max(maxSum,sum1);

		//moving the window one column to the right and calculating values of next
		for(int j = x2; j<Cols; j++) {
			sum2 += arr[i][j];
			cout << "Stg1; sum2 = " << sum2 << endl; // print_debug
		}
		maxSum = max(maxSum,sum2);
	}	
	// resetting vars for comparison
	sum1=0; 
	sum2=0;
	
	// == Stg2 ==
	// moving window down 
	
	for(int i = x3; i < Rows; i++) {
		// calculating values of first two columns
		for(int j = y3; j < k; j++) {
			sum1 += arr[i][j];
			cout << "Stg2; sum1 = " << sum1 << endl; // print_debug
		}
		maxSum = max(maxSum,sum1);
		for(int j = k-1; j < Cols; j++) {
			sum2 += arr[i][j];
			cout << "Stg2; sum2 = " << sum2 << endl; // print_debug
		}
		// comparing the sum2 with the last max sum found
		maxSum = max(maxSum, sum2);
	}
	// returning the maximum sum value
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
	const int arr_size = 10;	
	const int k = 5;

	int sample_arr[arr_size][arr_size] = {
   	    {0, 0, 0, 0, 0, 1, 0, 0, 0, 0},
   	    {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},
   	    {0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
   	    {0, 0, 0, 0, 0, 0, 0, 0, 1, 0},
   	    {0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
   	    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   	    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   	    {0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
   	    {0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
   	    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
   	};

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
