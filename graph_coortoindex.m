function [index]=graph_coortoindex(graphVector,x)
NNodes=length(graphVector);
%get locations of all nodes
xAll=[graphVector.x];
%compute squared Euclidean distance
distSquared=sum((xAll-x*ones(1,NNodes)).^2);
%sort and get index
[~,idxSorted]=sort(distSquared);
index=idxSorted(1);