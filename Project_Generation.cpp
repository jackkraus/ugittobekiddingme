#include <iostream>
#include "Cluster_Generation.h"

namespace std;

void Project_Generation(){
    const int nrow = 10;
    const int ncol = 10;

    const int nrow1 = nrow+1;
    const int ncol1 = ncol+1;

    // generating a grid with one randomly placed cluster //

    // making new grid
    int grid[nrow][ncol] = {0};

    for(unsigned int i=0; i<nrow; i++){
        for(unsigned int j=0; j<ncol; j++){
            cout<<grid[i][j];
        }
        cout<<endl;
    }

    // // picking a random point on the grid for inital point of cluster
    // int cx = rand() % nrow1;
    // int cy = rand() % ncol1;

    // // making a random number of hits in cluster
    // int hitnum = rand() % nhitmax;

    // // randomly orienting the other hits around the initial hit
    // for(unsigned int i=0; i<hitnum; i++){
    //     
    //     // randomly orienting the hits around the initial point in one of eight positions
    //     // 0 1 2
    //     // 3 x 4
    //     // 5 6 7
    //     // where x is the initial hit
    //     int hitloc = rand() % 8;

    //     cout<<hitloc<<endl;
        
        // if(hitloc == 0){
        //     if(()||()){continue;}
        // }
        // if(hitloc == 1){
        //     //
        // }
        // if(hitloc == 2){
        //     //
        // }
        // if(hitloc == 3){
        //     //
        // }
        // if(hitloc == 4){
        //     //
        // }
        // if(hitloc == 5){
        //     //
        // }
        // if(hitloc == 6){
        //     //
        // }
        // if(hitloc == 7){
        //     //
        // }
    }

    // for(unsigned int i=0; i<nrow; i++){
    //     for(unsigned int j=0; i<ncol; j++){
    //         cout<<grid[i][j];
    //     }
    //     cout<<endl;
    // }


}

int main() {
	Project_Generation();	
	return 0;
}
