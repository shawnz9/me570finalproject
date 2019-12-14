function [radPath,flag] = searcherThetaPath(startRad,endRad,direction,stepNum)
%find the angle path from startRad to endRad
% 0 means clockwise
% 1 means counterclockwise
% flag 1 means 2*pi added
[flag] = 0;
radPath(:,1) = startRad;
n=1;
if direction == 1  
    if endRad - startRad < 0
    radstep = (2*pi-abs(endRad-startRad))/(stepNum-1);
    else
    radstep = (endRad - startRad)/(stepNum-1);
    end
    
    while n <= stepNum-2
        [radPath] = [radPath,mod(startRad+n*radstep,2*pi)]; %%%%gaiguo
        n = n+1;
    end
    
else
    if endRad - startRad < 0
    radstep = abs(endRad-startRad)/(stepNum-1);
    else
    radstep = (2*pi-abs(endRad - startRad))/(stepNum-1);
    end
    
    while n <= stepNum-2
        [radPath] = [radPath,startRad-n*radstep];
        n = n+1;
    end
end

[radPath] = [radPath,endRad];

radPath(radPath < 0) = radPath(radPath < 0) + 2*pi;

