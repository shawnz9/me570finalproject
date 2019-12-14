function [guardleft,guardright] = GuardCapturePosition(guard,flag)
room = load('FreeSpace_data_R1.mat');
if flag == 0
    guardleft = calrad(room.rspec(1).entrance(:,2),guard);
    guardright = calrad(room.rspec(1).entrance(:,1),guard);
else
    guardleft = calrad(room.rspec(2).entrance(:,1),guard);
    guardright = calrad(room.rspec(2).entrance(:,2),guard);
end