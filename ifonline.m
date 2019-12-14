function [flag] = ifonline(point,vertice)
flag = false;
tol = 1e-12; 
if norm(point-vertice(:,1)) < 1e-12 || norm(point-vertice(:,2)) < 1e-12
    flag = true;
    return
end
if point(1) >= min(vertice(1,:)) && point(1) <= max(vertice(1,:)) && point(2) >= min(vertice(2,:)) && point(2) <= max(vertice(2,:))
    if (vertice(2,1)-point(2))*(vertice(1,1)-vertice(1,2)) - (vertice(2,1)-vertice(2,2))*(vertice(1,1)-point(1)) < tol
        flag = true;
        return
    end
end

