
load FreeSpace_data_R1.mat
graphVector = grid2graph(grid);

p1=[[9;55],[9;54],[9;54],[30;66],[30;66],[30;67],[69;55],[69;56],[69;56],[90;44],[90;44],[90;43]];
p2=[[10;54],[10;54],[10;53],[31;65],[31;66],[31;66],[70;56],[70;56],[70;57],[91;45],[91;44],[91;44]];

wrong_route=repmat(struct('p1',[],'p2',[]),0,1);

for ipoint=1:length(p1)
    addroute=struct('p1',p1(:,ipoint),'p2',p2(:,ipoint));
    wrong_route=[wrong_route;addroute];
end
for iroute=1:length(wrong_route)
    targetindex = graph_coortoindex(graphVector,wrong_route(iroute).p1);
    cleanindex = graph_coortoindex(graphVector,wrong_route(iroute).p2);
    targetneighbor = graphVector(targetindex).neighbors;
    graphVector(targetindex).neighbors = targetneighbor(~ismember(targetneighbor,cleanindex));
    targetindex = graph_coortoindex(graphVector,wrong_route(iroute).p2);
    cleanindex = graph_coortoindex(graphVector,wrong_route(iroute).p1);
    targetneighbor = graphVector(targetindex).neighbors;
    graphVector(targetindex).neighbors = targetneighbor(~ismember(targetneighbor,cleanindex));
end
