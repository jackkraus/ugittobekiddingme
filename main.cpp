#include <iostream>
#include <fstream>
#include <queue>

//#include "cluster.h"
//#include "generate.h"

using namespace std;

const int ARR_SIZE = 100;
const int k = 5;

// decided grid number and size
//const int nrow = 10;
//const int ncol = 10;
const int nrow = ARR_SIZE;
const int ncol = ARR_SIZE;

// biggest hit number for a cluster
const int nhitmax = ARR_SIZE*2;

// max number of clusters in grid
const int nclustmax = nhitmax;
// const int nclustmax = 50;

// making new grid
int grid[nrow][ncol] = {0};


int sample_arr[ARR_SIZE][ARR_SIZE] = {
       {0, 0, 0, 0, 0, 1, 0, 0, 0, 0},
       {1, 0, 0, 0, 0, 0, 0, 1, 0, 0},
       {0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
       {0, 1, 0, 0, 1, 0, 0, 0, 1, 0},
       {0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
       {0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
       {1, 0, 0, 1, 0, 0, 0, 0, 0, 0},
       {0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
       {0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
       {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
};

struct CentroidPoint{
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

// inserting cluster into grid int g[nrow][ncol]
void insert_cluster(int g[nrow][ncol]){
    // picking a random point on the grid for inital point of cluster and placing it on the grid
    int x = rand() % nrow;
    int y = rand() % ncol;

    // placing the initial hit of the cluster into the g
    g[x][y] = 1;

    // making a random number of max hits in cluster
    int hitnum = rand() % nhitmax;

    // randomly orienting the other hits around the initial hit
    for(unsigned int i=0; i<hitnum; i++){
        
        // randomly orienting the hits around the initial point in one of eight positions
        // 0 1 2
        // 3 x 4
        // 5 6 7
        // where x is the initial hit
        int hitloc = rand() % 8;

        // // printing the next hit in the cluster's location 
        // cout<<endl<<hitloc<<endl;

        // skipping the suggested random hit in the boundary cases
        if((x==0)&&((hitloc==0)||(hitloc==1)||(hitloc==2))){continue;}
        if((x==nrow-1)&&((hitloc==5)||(hitloc==6)||(hitloc==7))){continue;}
        if((y==0)&&((hitloc==0)||(hitloc==3)||(hitloc==5))){continue;}
        if((y==ncol-1)&&((hitloc==2)||(hitloc==4)||(hitloc==7))){continue;}
	
	// placing the next hit in the cluster onto the grid
        if(hitloc == 0){
            int x_h=x-1;
            int y_h=y-1;
            g[x_h][y_h]=1;
        }
        if(hitloc == 1){
            int x_h=x-1;
            g[x_h][y]=1;
        }
        if(hitloc == 2){
            int x_h=x-1;
            int y_h=y+1;
            g[x_h][y_h]=1;
        }
        if(hitloc == 3){
            int y_h=y-1;
            g[x][y_h]=1;
        }
        if(hitloc == 4){
            int y_h=y+1;
            g[x][y_h]=1;
        }
        if(hitloc == 5){
            int x_h=x+1;
            int y_h=y-1;
            g[x_h][y_h]=1;
        }
        if(hitloc == 6){
            int x_h=x+1;
            g[x_h][y]=1;
        }
        if(hitloc == 7){
            int x_h=x+1;
            int y_h=y+1;
            g[x_h][y_h]=1;
        }
    }
}   


// overlap check
void overlap_check(int f, int g[nrow][ncol], int tg[nrow][ncol]){
    for(unsigned int i=0; i<nrow; i++){
        for(unsigned int j=0; j<ncol; j++){

            // checking if hit overlaps
            if(tg[i][j]!=1){continue;}
            if(g[i][j]==tg[i][j]){f=1;}

            // checking if adjacent there are adjacent hits to cluster in temp grid
            for(unsigned int b=0;b<8;b++){

                // skipping boundary cases
                if((i==0)&&((b==0)||(b==1)||(b==2))){continue;}
                if((i==nrow-1)&&((b==5)||(b==6)||(b==7))){continue;}
                if((j==0)&&((b==0)||(b==3)||(b==5))){continue;}
                if((j==ncol-1)&&((b==2)||(b==4)||(b==7))){continue;}

                if(b==0){
                    int c0=i-1;
                    int c1=j-1;
                    if(g[c0][c1]==1){f=1;}
                }
                if(b==1){
                    int c0=i-1;
                    if(g[c0][j]==1){f=1;}
                }
                if(b==2){
                    int c0=i-1;
                    int c1=j+1;
                    if(g[c0][c1]==1){f=1;}
                }
                if(b==3){
                    int c1=j-1;
                    if(g[i][c1]==1){f=1;}
                }
                if(b==4){
                    int c1=j+1;
                    if(g[i][c1]==1){f=1;}
                }
                if(b==5){
                    int c0=i+1;
                    int c1=j-1;
                    if(g[c0][c1]==1){f=1;}
                }
               	if(b==6){
                    int c0=i+1;
                    if(g[c0][j]==1){f=1;}
                }
                if(b==7){
                    int c0=i+1;
                    int c1=j+1;
                    if(g[c0][c1]==1){f=1;}
                }
            }
        }
    }

    // printing the temporary grid
    if(f==1){cout<<"the following cluster grid has overlap with the current grid"<<endl;}
    cout<<"cluster grid"<<endl;
    for(unsigned int i=0; i<nrow; i++){
        for(unsigned int j=0; j<ncol; j++){
            cout<<tg[i][j];
        }
        cout<<endl;
    }
    cout<<endl;

    // mapping the separate grid and cluster to the original grid if there's no overlap between the two
    if(f==0){
        for(unsigned int i=0; i<nrow; i++){
            for(unsigned int j=0; j<ncol; j++){
                if(tg[i][j]==1){g[i][j]=1;}
            }
        }
    }
}

void generate(){

    // generating a grid with one randomly placed cluster //
    insert_cluster(grid);

    // printing the grid after the first cluster
    cout<<"empty grid with one cluster"<<endl;
    for(unsigned int i=0; i<nrow; i++){
        for(unsigned int j=0; j<ncol; j++){
            cout<<grid[i][j];
        }
        cout<<endl;
    }
    cout<<endl;

    // determining the max number of clusters after the first cluster for this grid
    int clustnum = rand() % nclustmax;

    // going through each of the new potential clusters
    for(unsigned int a=0; a<clustnum; a++){
        
        // printing the original grid
        if(a!=0){
            cout<<"current grid"<<endl;
            for(unsigned int i=0; i<nrow; i++){
                for(unsigned int j=0; j<ncol; j++){
                    cout<<grid[i][j];
                }
                cout<<endl;
            }
            cout<<endl;
        }

        // making a separate grid for this new cluster
        int tempgrid[nrow][ncol] = {0};

        // placing hits in the separate grid
        insert_cluster(tempgrid);

        // comparing the separate grid to the original
        int flag = 0;
        overlap_check(flag, grid, tempgrid);
    }
    // printing the final grid
    cout<<"final grid"<<endl;
    for(unsigned int i=0; i<nrow; i++){
        for(unsigned int j=0; j<ncol; j++){
            cout<<grid[i][j];
        }
        cout<<endl;
    }
    cout<<endl;
}



// TODO: HLS has fixed width floating-point types
// 		definitely need that for the centroid calculations

vector<CentroidPoint> calcCentroid(vector<vector<ClusterPoint>> clusters) {
	// calc centroid	
	vector<CentroidPoint> centroids;
	CentroidPoint c;
	float sumx = 0.f;
	float sumy = 0.f;	
	int tempClusterID= 0;
	int hit_count = 0;

	for(const auto& cluster : clusters) {
		for(const ClusterPoint& p: cluster) {
		// cout << "calcCentroid:    cluster_" << p.clusterID << ": (" << p.x<< ","<<p.y<<") "<<endl;
			sumx += (float)(p.x);
			sumy += (float)(p.y);	
			tempClusterID=p.clusterID;
			hit_count++;
		}
		// calculate the centroid	
		c.x = sumx/hit_count;
		c.y = sumy/hit_count;
		c.clusterID = tempClusterID;
		centroids.push_back(c); // add it to the vector of centroids
		// cout << "calcCentroid:    cent_cluster_" <<c.clusterID << ": (" << c.x<< ","<<c.y<<") "<<endl;
		// reset the vars for the next cluster
		sumx=0.f;
		sumy=0.f;
		hit_count=0;
	}	
	return centroids;
}

// allows compiler to know array size
template<size_t Rows, size_t Cols>
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
				// 	direct adjaceny to the first point
				queue<ClusterPoint> q; 
				clusterID++;	
				
				// add non-visited hit to queue	
				q.push(ClusterPoint(i,j,clusterID));
				// it has now been visited
				visited[i][j] = true;
				
				// loop through the queue and pop when done
				while(!q.empty()){
					ClusterPoint hit = q.front(); // grab off top	
					// cout << "cluster #" <<hit.clusterID << " ("<< hit.x<< ", " << hit.y<< ")" << endl;
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
    		for(const ClusterPoint& p: cluster) {
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
	//for(int i = 0; i < ARR_SIZE; i++) {
	//	for(int j = 0; j < ARR_SIZE; j++) {
	//		cout << grid[i][j] << ", "; 	
	//	}
	//	cout << endl;
	//}

	vector<vector<ClusterPoint>> clusters = naive_findClusters(grid, k);
	//vector<vector<ClusterPoint>> clusters = naive_findClusters(sample_arr, k);
	// vector<vector<ClusterPoint>> clusters = sw_findClusters(sample_arr, k);
	
	// print clusters
	for(const auto& cluster : clusters) {
		cout << "main:    cluster_";
		for(const ClusterPoint& p: cluster) {
			cout << p.clusterID << ": (" << p.x<< ","<<p.y<<") ";
		}
		cout << endl;
	}

	// calculate centroids
	vector<CentroidPoint> centroids = calcCentroid(clusters); 
		
	// print clusters
	for(const auto& c : centroids) {
		cout << "main:    centroid_" << c.clusterID << ": (" << c.x<< ","<<c.y<<") "<< endl;
	}	


        // Write output files
        writeClusterPointsCSV(clusters, "cluster_points.csv");
        writeClusterCentroidsCSV(centroids, "cluster_centroids.csv");
        
        std::cout << "Clustering completed. Results written\n";
        

}










int main() {
	generate();
	
	cluster();	
	
	return 0;
}
