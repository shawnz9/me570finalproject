function [Tmp] = pointlineside(pursuer,endpoint,testpoint)
% Tmp = 1 leftside
% Tmp = 0 online
% Tmp = -1 rightside

% Tmp = (y1 ? y2) * x + (x2 ? x1) * y + x1 * y2 ? x2 * y1
if pursuer(1) == endpoint(1) && pursuer(2) == endpoint(2)
    Tmp = NaN;
    return
else
    Tmp = (pursuer(2) - endpoint(2)) * testpoint(1) + (endpoint(1) - pursuer(1)) * testpoint(2) + pursuer(1) * endpoint(2) - endpoint(1) * pursuer(2);
    Tmp = sign(Tmp);
end
if Tmp == 0 
    if testpoint(1) < min(pursuer(1),endpoint(1)) || testpoint(1) > max(pursuer(1),endpoint(1))
        Tmp = NaN;
    end
end
    
% plot([pursuer(1),endpoint(1)],[pursuer(2),endpoint(2)],'-');
% hold on
% plot(testpoint(1),testpoint(2),'*')
% hold off