// defining parameters of grid and cluster sizes //

// decided grid number and size
const int nrow = 10;
const int ncol = 10;
// const int nrow = 100;
// const int ncol = 100;

// biggest hit number for a cluster
const int nhitmax = 9;

// max number of clusters in grid
const int nclustmax = 9;
// const int nclustmax = 50;

// generating sample grids with cluster(s) manually //

// number of manually written or sample grids
const int ngrids = 4;

// making grids
int manual_grid[ngrids][nrow][ncol] = {0};

// // making one cluster of three hits in manual_grid[0]
// manual_grid[0][3][4] = 1;
// manual_grid[0][3][5] = 1;
// manual_grid[0][2][4] = 1;

// // making two clusters of hits in manual_grid[1]
// // first cluster
// manual_grid[1][3][4] = 1;
// manual_grid[1][3][5] = 1;
// manual_grid[1][2][4] = 1;
// manual_grid[1][2][5] = 1;
// // second cluster
// manual_grid[1][4][1] = 1;
// manual_grid[1][5][1] = 1;
// manual_grid[1][5][2] = 1;
// manual_grid[1][5][2] = 1;

// // making one cluster of non binary hits in manual_grid[2]
// // first cluster
// manual_grid[2][3][4] = 11;
// manual_grid[2][3][5] = 8;
// manual_grid[2][2][4] = 8;
// manual_grid[2][2][5] = 4;

// // making two clusters of non binary hits in manual_grid[3]
// // first cluster
// manual_grid[3][3][4] = 9;
// manual_grid[3][3][5] = 8;
// manual_grid[3][2][4] = 4;
// manual_grid[3][2][5] = 4;
// // second cluster
// manual_grid[3][8][4] = 9;
// manual_grid[3][8][5] = 8;
// manual_grid[3][7][4] = 4;

// inserting cluster into grid
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
