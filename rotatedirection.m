function [direction] = rotatedirection(pursuer,startrad,endrad)
% 0 means clockwise
% 1 means counterclockwise
if isnan(startrad) || isnan(endrad)
    direction = 1;
    return
end

while endrad < 0
    endrad = endrad + 2*pi;
end
if endrad > 2*pi
    endrad=mod(endrad,2*pi);
end

load FreeSpace_data_R1.mat
r = 0.5;
clockflag=1;
cclockflag=1;

%counterclockwise test

rad=startrad;
if endrad - startrad < 0
    ccraddiff5 = (2*pi-abs(endrad-startrad))/5;
else
    ccraddiff5 = (endrad - startrad)/5;
end
point=[pursuer(1)+r*cos(rad);pursuer(2)+r*sin(rad)];
rad=rad+ccraddiff5;
for irotatetest=1:4
    point=[pursuer(1)+r*cos(rad);pursuer(2)+r*sin(rad)];
    if polygon_isCollision(room,point)
        cclockflag=0;
        break
    end
    rad=rad+ccraddiff5;
end

%clockwise test
if endrad - startrad < 0
    craddiff5 = abs(endrad-startrad)/5;
    rad=startrad;
else
    craddiff5 = (2*pi-abs(endrad - startrad))/5;
    rad = startrad +2*pi;
end
point=[pursuer(1)+r*cos(rad);pursuer(2)+r*sin(rad)];
rad=rad-craddiff5;
for irotatetest=1:4
    point=[pursuer(1)+r*cos(rad);pursuer(2)+r*sin(rad)];
    if polygon_isCollision(room,point)
        clockflag=0;
        break
    end
    rad=rad-craddiff5;
end

if clockflag == 0
    direction = 1;
elseif clockflag == 1 && cclockflag == 0
    direction = 0;
else
    if craddiff5 <= ccraddiff5
        direction = 0;
    else
        direction = 1;
    end
end