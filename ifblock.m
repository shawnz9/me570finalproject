function [flag] = ifblock(point1,point2)
% 0 indicates there is no obstacles between two points, and 1 indicates
% that the line is blocked by the obstacles.
data = load('FreeSpace_data_R1.mat');
boundry = data.room; 
lb = length(boundry);
flag = false;

for iside = 1:lb
    iside2 = mod(iside,lb)+1;
    side = [boundry(:,iside),boundry(:,iside2)];
    if edge_isCollision([point1,point2],side)
        flag = true;
        break
    end
end