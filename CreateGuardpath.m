function [guardpath] = CreateGuardpath(graphVector,rspec,door)

searchindex = graph_coortoindex(graphVector,door);

%go to first guard point
targetindex=rspec(1).guardindex;
[xPath1,~] = graph_search(graphVector,searchindex,targetindex);
searchindex=targetindex;

%wait for searcher one
wait1 = ones(2,163-length(xPath1));
xPath2=[wait1(1,:)*xPath1(1,end);wait1(2,:)*xPath1(2,end)];

%go to second essential cut
targetindex=rspec(2).guardindex;
[xPath3,~] = graph_search(graphVector,searchindex,targetindex);

%waiting time
xPath4 = zeros(2,40-length(xPath3));
xPath4(1,:) = 67;
xPath4(2,:) = 66; 

guardpath=[xPath1,xPath2,xPath3,xPath4];