//#include <stdio.h>
//#include <stdlib.h>
//#include <math.h>


// pseudocode from: https://en.wikipedia.org/wiki/DBSCAN
// just an idea :)

//TODO: Is this a useful algorithm to implement with HLS?
//	Or are we going to have to come up with something more bespoke? 

//TODO what do we want this to return?
Neighbors RangeQuery(point_db, distFunc, q, eps) { 
	//TODO Neighbors representation? 
	Neighbors N; // = {} // Empty List Array? 
	for(int p = 0; p < point_db.size(); p++) {  // scan all points in database
		if (distFunc(q,p) <= eps) { // compute distance and check epsilon
			//TODO N := N u {P}  // add to the result
		}	
	}
	return N;
}

//TODO useful return would be ? keep in mind parallelism later 
void dbscan(point_db, distFunc, eps, minPts) {
	int cluster_count = 0; 
	for(int p = 0; p < point_db.size(); p++) {
		// first pass, dw about this
		// this checks to see if the point has been labeled as noise further in loop
		if( label(p) != undefined ) continue;
		
		// TODO Neighbors representation? 
		Neighbors N = RangeQuery(point_db, distFunc, p, eps); // Find the neighbors	
		if( N.size() < minPoints ) { // density check
			label(p).isNoise(); // label point as noise
			continue;
		}
		cluster_count+=1; // next cluster label 

		label(p) = cluster_count; // label initial point

		// SeedSet S := N \ {P} // neighbors to expand (how to implement?)
		
		for (int q = 0; q < S.size(); q++) {
			 // change noise to broder pont
			if( label(q).isNoise==true ) label(q)=cluster_count;		
			// previously processed? 
			if( label(q) != undefined ) continue;
			label(q) = cluster_count; // label neighbor
			Neighbors N = RangeQuery(point_db, distFunc, q, eps); // find neighbors
			
			if(  N.size() < minPoints ) {
				// S := S u N  // Add new neighbor to seed set (not sure how to implement)	
			} 
			
		}
	} 
}


int main() {
	// Read in Points		
	// genPoints();	// generate points (call func)
			
	// Call DBSCAN 
	// dbscan(params); // input points into dbscan func	
	
	// Visualize
	// viz(params); // take in clusters and points from genPoints and visualize (maybe to png/pdf?) 

		
	return 0;
}
