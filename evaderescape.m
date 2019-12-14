function [newevader] = evaderescape(evader,searcher,graphVector,blacklist)
evaderindex = graph_coortoindex(graphVector,evader);
backup = graphVector(evaderindex).neighbors;
backup(ismember(backup,blacklist)) = [];
if ifblock(evader,searcher)
    %if they are no longer visibile.
    newevader = graphVector(backup(randi([1,length(backup)],1))).x;
else
    %if they are still visible.
    hstk=ones(1,length(backup));
    for ineighbor = 1:length(backup)
        neighborxy = graphVector(ineighbor).x;
        hstk(ineighbor) = (neighborxy(1) - searcher(1))^2 + (neighborxy(2) - searcher(2))^2;
    end
    newindex = backup(find(hstk == max(hstk)));
    newevader = graphVector(newindex).x;
end

        