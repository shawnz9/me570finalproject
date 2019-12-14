function [nextSearcher] = searcherCatchPosition(pursuer,evader,center,graphVector)
if ifblock(pursuer,evader)
    startIndex = graph_coortoindex(graphVector,pursuer);
    endIndex = graph_coortoindex(graphVector,evader);
    searcherPath = graph_search(graphVector,startIndex,endIndex);
    nextSearcher = searcherPath(:,2);
else
    nextSearcher = lion(pursuer,evader,center);
end

    