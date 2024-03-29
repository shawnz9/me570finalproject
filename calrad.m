function [rad]=calrad(point,pursuer)
tol=1e-10;
x1 = point(1);
y1 = point(2);
x2 = pursuer(1);
y2 = pursuer(2);
x3 = pursuer(1)+5;
y3 = y2;
a2 = (x1-x2)*(x1-x2)+(y1-y2)*(y1-y2);
b2 = (x3-x2)*(x3-x2)+(y3-y2)*(y3-y2);
c2 = (x1-x3)*(x1-x3)+(y1-y3)*(y1-y3);
a = sqrt(a2);
b = sqrt(b2);
c = sqrt(c2);
pos = (a2+b2-c2)/(2*a*b);  
rad = acos(pos); 
if norm(point-pursuer) < tol
%     rad=0;
    rad = NaN;
end
if y2 > y1 
    rad = 2*pi - rad;
end


