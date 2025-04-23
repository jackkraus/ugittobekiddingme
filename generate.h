#include <iostream>
#include <vector>

void printGrid(const std::vector<std::vector<int>>& grid) {
    for (size_t i = 0; i < grid.size(); i++) {
        for (size_t j = 0; j < grid[0].size(); j++) {
            std::cout << grid[i][j] << " ";
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;
}

// Inserting cluster into grid int g[nrow][ncol]
void insert_cluster(std::vector<std::vector<int>>& g, const int nhitmax, const bool debug=false) {
    int nrow = g.size();
    int ncol = g[0].size();

    // Picking a random point on the grid for inital point of cluster and placing it on the grid
    int x = rand() % nrow;
    int y = rand() % ncol;

    // Placing the initial hit of the cluster into the grid
    g[x][y] = 1;

    // Choosing random number of hits for cluster
    int hitnum = rand() % nhitmax;

    if (debug) std::cout << "Initial hit at (" << x << ", " << y << ") with " << hitnum << " additional hits." << std::endl;

    // Randomly orienting the other hits around the initial hit
    for(int i = 0; i < hitnum; i++){
        
        // Randomly orienting the hits around the initial point in one of eight positions
        // 0 1 2
        // 3 x 4
        // 5 6 7
        // where x is the initial hit
        int hitloc = rand() % 8;

        // Printing the next hit in the cluster's location 
        if (debug) std::cout << "Next hit location: " << hitloc << std::endl;

        // Skipping the suggested random hit in the boundary cases
        if (((x == 0) && ((hitloc == 0) || (hitloc == 1) || (hitloc == 2))) ||
            ((x == nrow-1) && ((hitloc == 5) || (hitloc == 6) || (hitloc == 7))) ||
            ((y == 0) && ((hitloc == 0) || (hitloc == 3) || (hitloc == 5))) ||
            ((y == ncol-1) && ((hitloc == 2) || (hitloc == 4) || (hitloc == 7)))) {
            if (debug) std::cout << "Skipping suggested hit..." << std::endl;
            continue;
        }

        // Placing the next hit in the cluster onto the grid
        int x_h, y_h;
        switch(hitloc) {
            case 0:
                x_h = x - 1;
                y_h = y - 1;
                break;
            case 1:
                x_h = x - 1;
                y_h = y;
                break;
            case 2:
                x_h = x - 1;
                y_h = y + 1;
                break;
            case 3:
                x_h = x;
                y_h = y - 1;
                break;
            case 4:
                x_h = x;
                y_h = y + 1;
                break;
            case 5:
                x_h = x + 1;
                y_h = y - 1;
                break;
            case 6:
                x_h = x + 1;
                y_h = y;
                break;
            case 7:
                x_h = x + 1;
                y_h = y + 1;
                break;
            default:
                std::cerr << "You shouldn't be here!: " << hitloc << std::endl;
                exit(1);
        }

        // Placing the hit in the grid
        g[x_h][y_h] = 1;
    }
}

// Overlap check
void overlap_check(std::vector<std::vector<int>>& g, std::vector<std::vector<int>>& tg, const int nrow, const int ncol, const bool debug=false) {
    bool overlap = false;      // Overlap flag
    
    for(int i = 0; i < nrow; i++){
        for(int j = 0; j < ncol; j++){
            // Checking if hit overlaps
            if(tg[i][j] != 1) continue;
            if(g[i][j] == tg[i][j]) overlap = true;

            // Checking if adjacent there are adjacent hits to cluster in temp grid
            for(unsigned int b = 0; b < 8; b++){
                // Skipping boundary cases
                if (((i == 0) && ((b == 0) || (b == 1) || (b == 2))) ||
                    ((i == nrow-1) && ((b == 5) || (b == 6) || (b == 7))) ||
                    ((j == 0) && ((b == 0) || (b == 3) || (b == 5))) ||
                    ((j == ncol-1) && ((b == 2) || (b == 4) || (b == 7)))) {
                    continue;
                }

                int c0, c1;
                switch(b) {
                    case 0:
                        c0 = i - 1;
                        c1 = j - 1;
                        break;
                    case 1:
                        c0 = i - 1;
                        c1 = j;
                        break;
                    case 2:
                        c0 = i - 1;
                        c1 = j + 1;
                        break;
                    case 3:
                        c0 = i;
                        c1 = j - 1;
                        break;
                    case 4:
                        c0 = i;
                        c1 = j + 1;
                        break;
                    case 5:
                        c0 = i + 1;
                        c1 = j - 1;
                        break;
                    case 6:
                        c0 = i + 1;
                        c1 = j;
                        break;
                    case 7:
                        c0 = i + 1;
                        c1 = j + 1;
                        break;
                    default:
                        std::cerr << "You shouldn't be here: " << b << std::endl;
                        exit(1);
                }

                if (g[c0][c1] == 1) overlap = true;
            }
        }
    }

    // Mapping separate grid and cluster to the original grid if there's no overlap between the two
    if (!overlap) {
        for (unsigned int i = 0; i < nrow; i++ ){
            for (unsigned int j = 0; j < ncol; j++ ){
                if (tg[i][j] == 1) g[i][j] = 1;
            }
        }
    }
    else {
        if (debug) std::cout << "\nThe following cluster grid has overlap with the current grid" << std::endl;
        printGrid(tg);

    }
}

std::vector<std::vector<int>> generate(const size_t nrow, const size_t ncol, const int nhitmax, const int nclustmax, const bool debug=false) {
    // Initialize grid
    std::vector<std::vector<int>> grid(nrow, std::vector<int>(ncol, 0));

    // Generating a grid with one randomly placed cluster
    insert_cluster(grid, nhitmax, debug);

    // Printing the grid after the first cluster
    if (debug) {
        std::cout << "\nEmpty grid with one cluster" << std::endl;
        printGrid(grid);
    }

    // Determining the max number of clusters after the first cluster for this grid
    int clustnum = rand() % nclustmax;
    if (debug) std::cout << "Adding " << clustnum << " more clusters." << std::endl;

    // Going through each of the new potential clusters
    for(int a = 0; a < clustnum; a++){   
        // Printing the new grid
        if(a!=0 && debug){
            std::cout << "\nCurrent grid" << std::endl;
            printGrid(grid);
        }
        
        // Making a separate grid for this new cluster
        std::vector<std::vector<int>> tempgrid(nrow, std::vector<int>(ncol, 0));

        // Placing hits in the separate grid
        insert_cluster(tempgrid, nhitmax, debug);

        // Comparing the separate grid to the original
        overlap_check(grid, tempgrid, nrow, ncol, debug);   
    }

    // Printing the final grid
    std::cout << "\nFinal grid" << std::endl;
    printGrid(grid);

    return grid;
}