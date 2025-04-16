//#include <stdio.h>
//#include <stdlib.h>
//#include <math.h>
#include "generate_points.h"

struct Point {
	int x;
	int y; 
	int clust_id; // to ID what cluster a point belongs to
}

struct Cluster { 
	int id; // to ID the cluster
	float cent_x; // centroid x value
	float cent_y; // centroid x value
	std::vector<Point> points;
}

int main() {

	return 0;
}
