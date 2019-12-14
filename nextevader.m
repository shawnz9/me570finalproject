function [newevader] = nextevader(evader,graphVector,blacklist)
evaderindex = graph_coortoindex(graphVector,evader);
backup = graphVector(evaderindex).neighbors;
backup(ismember(backup,blacklist)) = [];
newevader = graphVector(backup(randi([1,length(backup)],1))).x;
