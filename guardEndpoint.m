function [guardleft, guardright] = guardEndpoint(guard)
room = load('FreeSpace_data_R1.mat');
if 1<= guard(2) && guard(2) <= 57
    guardleft = pi;
    guardright = 0;
elseif guard(2) >= 58 && guard(2) < 66
    guardleft = calrad(room.rspec(2).entrance(:,1),guard);
    guardright = calrad(room.rspec(1).entrance(:,2),guard);
else
    guardleft = calrad(room.rspec(2).entrance(:,2),guard);
    guardright = calrad(room.rspec(1).entrance(:,2),guard);
end