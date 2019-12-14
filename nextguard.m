function [newguard,roomnumber] = nextguard(guard,evader,graphVector)
%roomnum is equal to 0 if evader is at room1
%roomnum is equal to 1 if evader is at room2
if evader(1) > 80 
    % evader is at room1,target position is 69,61
    targetindex=4329;
    roomnumber = 0;
elseif evader(1) < 20
    % evader is at room2,target position is 31,71
    targetindex=539;   
    roomnumber = 1;
end
guardindex = graph_coortoindex(graphVector,guard);
if guardindex ~= targetindex
    %go to guard point
    [guardpath,~] = graph_search(graphVector,guardindex,targetindex);
    newguard = guardpath(:,2);
else
    newguard = guard;
end
