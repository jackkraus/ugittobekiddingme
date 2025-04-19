#include "Cluster_Generation1.h"

void Cluster_Generation(){

    // generating a grid with one randomly placed cluster //

    // making new grid
    int grid[nrow][ncol] = {0};

    // printing the grid
    cout<<"empty grid"<<endl;
    for(unsigned int i=0; i<nrow; i++){
        for(unsigned int j=0; j<ncol; j++){
            cout<<grid[i][j];
        }
        cout<<endl;
    }
    cout<<endl;

    // // printing the location of the random hit for the first cluster
    // cout<<endl<<cx<<", "<<cy<<endl<<endl;

    insert_cluster(grid);

    // printing the grid after the first cluster
    cout<<"grid with one cluster"<<endl;
    for(unsigned int i=0; i<nrow; i++){
        for(unsigned int j=0; j<ncol; j++){
            cout<<grid[i][j];
        }
        cout<<endl;
    }
    cout<<endl;

    // determining the max number of clusters after the first cluster for this grid
    int clustnum = rand() % nclustmax;

    // // going through each of the new potential clusters
    // for(unsigned int i=0; i<clustnum; i++){

    //     // making a separate grid for this new cluster
    //     int tempgrid[nrow][ncol] = {0};

    //     // placing hits in the separate grid

    //     // comparing the separate grid to the original

    //     // discarding the separate grid and cluster if any overlap in hits exists between the two grids
        
    // }

    // printing the final grid
    cout<<"final grid"<<endl;
    for(unsigned int i=0; i<nrow; i++){
        for(unsigned int j=0; j<ncol; j++){
            cout<<grid[i][j];
        }
        cout<<endl;
    }
}

int main(){
    Cluster_Generation();
    return 0;
}