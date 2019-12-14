function [leftangle,rightangle] = SearcherEndpointRotate(searcher)
%1 is the lower point, 2 is the higher point;
room = load('FreeSpace_data_R1.mat');
if searcher(1) ==69 && searcher(2) == 57
    leftangle = calrad(room.rspec(1).essential(:,2),searcher);
    rightangle = calrad(room.rspec(1).entrance(:,1),searcher);
elseif 31<= searcher(1) &&  searcher(1)<= 69 && 1<= searcher(2) && searcher(2) <= 56
    leftangle = pi;
    rightangle = 0;
elseif 70<=searcher(1) && searcher(1) < 90 
    leftangle = calrad(room.rspec(1).essential(:,2),searcher);
    rightangle = calrad(room.rspec(1).entrance(:,1),searcher);
elseif 10< searcher(1) && searcher(1) <= 30
    rightangle = calrad(room.rspec(2).essential(:,2),searcher);
    leftangle = calrad(room.rspec(2).entrance(:,1),searcher);
elseif 31<= searcher(1) && searcher(1) <= 69 && 57<= searcher(2) && searcher(2) <= 75
    rightangle = calrad(room.rspec(2).entrance(:,2),searcher);
    leftangle = calrad(room.rspec(2).entrance(:,1),searcher);
elseif searcher(1) == 90
    leftangle = pi/2;
    rightangle = calrad(room.rspec(1).entrance(:,1),searcher);
elseif searcher(1) ==91
    leftangle = pi/2+pi/4+0.2;
    rightangle = calrad(room.rspec(1).entrance(:,1),searcher);
elseif  searcher(1) ==10
    leftangle = calrad(room.rspec(2).entrance(:,1),searcher);
    rightangle = pi/2;
elseif searcher(1) == 9
    leftangle = calrad(room.rspec(2).entrance(:,1),searcher);
    rightangle = pi/2-pi/4;

end


    