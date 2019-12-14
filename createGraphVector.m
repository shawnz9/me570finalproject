data = load('FreeSpace_data_R1.mat');
grid = data.grid;
Nnodes = sum(grid.F(:));
graphVector = repmat(struct('neighbors',[],'neighborcost',[],'x',[]),Nnodes,1);
clear data
clear grid
clear Nnodes
save('graphVector.mat')