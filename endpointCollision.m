function [endpoints] = endpointCollision(pursuer,angle)
data = load('FreeSpace_data_R1.mat');
boundry = data.room; 
pursuer2 = [pursuer(1)+141*cos(angle);pursuer(2)+141*sin(angle)];
viewsight = [pursuer,pursuer2];
lb = length(boundry);
endpoints = pursuer2;
if isnan(angle)
    endpoints = pursuer;
    return
end
for iside = 1:lb
    iside2 = mod(iside,lb)+1;
    side = [boundry(:,iside),boundry(:,iside2)];
    if ifonline(pursuer,side)
        sudopursuer = [pursuer(1)+0.2*cos(angle);pursuer(2)+0.2*sin(angle)];
        viewsight = [sudopursuer,pursuer2];
    else
        viewsight = [pursuer,pursuer2];
    end
    if edge_isCollision2(viewsight,side)
        %find intersection
        [x_intersect,y_intersect]=node([pursuer(1),pursuer2(1)],[pursuer(2),pursuer2(2)],[side(1,1),side(1,2)],[side(2,1),side(2,2)]);
        

        if abs(x_intersect-pursuer(1)) < abs(endpoints(1)-pursuer(1)) | abs(y_intersect-pursuer(2)) < abs(endpoints(2)-pursuer(2))
            endpoints=[x_intersect;y_intersect];
        end
    end
end

if pursuer(1) ~= endpoints(1)
    testpoint=[pursuer(1)+0.2*abs(pursuer(1)-endpoints(1))/(endpoints(1)-pursuer(1));(endpoints(2)-pursuer(2))/(endpoints(1)-pursuer(1))*0.2+pursuer(2)];
    
    if polygon_isCollision(boundry,testpoint)
        endpoints=pursuer;
    end
elseif pursuer(2) ~= y_intersect
    testpoint = [x_intersect;pursuer(2)+0.2*abs(pursuer(2)-y_intersect)/(y_intersect-pursuer(2))];
    if polygon_isCollision(boundry,testpoint)
        endpoints=pursuer;
    end
else
    endpoints=pursuer;
end

