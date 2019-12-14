clear
%room structure
grid.xx=(1:100);
grid.yy=(1:100);
room=ones(100);
room(1:34,1:30)=0;
room(66:100,1:10) = 0;
room(1:25,80:100)=0;
room(56:100,90:100) = 0;
room(1:45,10:30)=0;
room(76:100,11:30) = 0;
room(1:34,70:90)=0;
room(66:100,70:90) = 0;
%room(1:20,1:100) = 0;
j = 10;
for i = 55:75
    room(i,10:j) = 0;
    j = j+1;
end

k =10;
for i = 45:65
    room(i,k:30) = 0;
    k = k+1;
end
h = 90;
for i = 45:65
    room(i,h:90) = 0;
    h = h-1;
end

l =90;
for i = 35:55
    room(i,70:l) = 0;
    l = l-1;
end
clear h
clear i
clear j
clear k
clear l

grid.F=logical(room);
[grid] = grid;
clear room

%room information
rspec=rspec_prepare();
%insert information of cut1, first-essential:[x1,x2;y1,y2], secon-domain:[x1,x2;y1,y2]
%third-essindex:[index1,index2], fourth-entindex:[index1,index2]
rspec=rspec_insert(rspec,[91,91;35,43],[69,69;57,65],[4567,4575],[4325,4343],[65;58],3926);
%insert information of cut2

rspec=rspec_insert(rspec,[9,9;45,53],[31,31;67,75],[259,267],[535,553],[67;66],4134);

graphVector = grid2graph(grid);

% maptweaks
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

blacklist = cutboundryblacklist;

clear addroute
clear cleanindex
clear ipoint
clear iroute
clear p1
clear p2
clear targetindex
clear targetneighbor
clear wrong_route
load('RoomVertices.mat')
save('FreeSpace_data_R1.mat')
