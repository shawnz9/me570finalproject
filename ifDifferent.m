function [difference] = ifDifferent(flag,anglePrev,angleCurrent,direction)
% 0 means clockwise
% 1 means counterclockwise
if flag == 1
    anglePrev = anglePrev-2*pi;
end
difference = anglePrev - angleCurrent;

if difference >= 0 
    if direction == 0
        return
    else
        difference = 2*pi - difference;
    end
    
else
    difference = -difference;
    if direction ==1 
        return
    else
        difference = 2*pi -difference;
    end
end

    