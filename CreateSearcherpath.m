function [searcherpath] = CreateSearcherpath(graphVector,rspec,door)

searchindex = graph_coortoindex(graphVector,door);

%go to first essential cut
targetindex=rspec(1).essindex(2);
[xPath1,~] = graph_search(graphVector,searchindex,targetindex);
searchindex=targetindex;

%go to second essential cut
targetindex=rspec(2).essindex(2);
[xPath2,~] = graph_search(graphVector,searchindex,targetindex);
searchindex=targetindex;

%go to second entrance
targetindex=rspec(2).entindex(2);
[xPath3,~] = graph_search(graphVector,searchindex,targetindex);

searcherpath=[xPath1,xPath2,xPath3];