// defining parameters of grid and cluster sizes //

// decided grid number and size
const int nrow = 10;
const int ncol = 10;

// biggest hit number for a cluster
const int nhitmax = 5;

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
