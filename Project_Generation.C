#include "Cluster_Generation.h"

void Project_Generation(){

    // generating a grid with one randomly placed cluster //

    // making new grid
    int grid[nrow][ncol] = {0};

    for(unsigned int i=0; i<nrow; i++){
        for(unsigned int j=0; j<ncol; j++){
            cout<<grid[i][j];
        }
        cout<<endl;
    }
    cout<<endl;

    // picking a random point on the grid for inital point of cluster
    int cx = rand() % nrow;
    int cy = rand() % ncol;

    grid[cx][cy] = 1;

    // cout<<endl<<cx;
    // cout<<endl<<cy<<endl<<endl;

    // making a random number of hits in cluster
    int hitnum = rand() % nhitmax;

    // randomly orienting the other hits around the initial hit
    for(unsigned int i=0; i<hitnum; i++){
        
        // randomly orienting the hits around the initial point in one of eight positions
        // 0 1 2
        // 3 x 4
        // 5 6 7
        // where x is the initial hit
        int hitloc = rand() % 8;

        // cout<<endl<<hitloc<<endl;

        if((cx==0)&&((hitloc==0)||(hitloc==1)||(hitloc==2))){continue;}
        if((cx==nrow-1)&&((hitloc==5)||(hitloc==6)||(hitloc==7))){continue;}
        if((cy==0)&&((hitloc==0)||(hitloc==3)||(hitloc==5))){continue;}
        if((cy==ncol-1)&&((hitloc==2)||(hitloc==4)||(hitloc==7))){continue;}

        if(hitloc == 0){
            int cx_h=cx-1;
            int cy_h=cy-1;
            grid[cx_h][cy_h]=1;
        }
        if(hitloc == 1){
            int cx_h=cx-1;
            grid[cx_h][cy]=1;
        }
        if(hitloc == 2){
            int cx_h=cx-1;
            int cy_h=cy+1;
            grid[cx_h][cy_h]=1;
        }
        if(hitloc == 3){
            int cy_h=cy-1;
            grid[cx][cy_h]=1;
        }
        if(hitloc == 4){
            int cy_h=cy+1;
            grid[cx][cy_h]=1;
        }

        if(hitloc == 5){
            int cx_h=cx+1;
            int cy_h=cy-1;
            grid[cx_h][cy_h]=1;
        }
        if(hitloc == 6){
            int cx_h=cx+1;
            grid[cx_h][cy]=1;
        }
        if(hitloc == 7){
            int cx_h=cx+1;
            int cy_h=cy+1;
            grid[cx_h][cy_h]=1;
        }
    }

    for(unsigned int i=0; i<nrow; i++){
        for(unsigned int j=0; j<ncol; j++){
            cout<<grid[i][j];
        }
        cout<<endl;
    }


}

int main(){
    Project_Generation();
    return 0;
}