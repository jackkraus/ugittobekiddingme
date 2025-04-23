#include "generate.h"

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

int main(){
    generate();
    return 0;
}
