function [guardradpathleft,guardradpathright,guardanglePrev] = guardView(guard,guardanglePrev)
[leftangle,rightangle] = guardEndpoint(guard);
directleft = rotatedirection(guard,guardanglePrev(1),leftangle);
directright = rotatedirection(guard,guardanglePrev(2),rightangle);
if leftangle-guardanglePrev(1) > 0.35 || leftangle-guardanglePrev(1) > 0.35
    if leftangle-guardanglePrev(1) > 0.35
        rad1path=searcherThetaPath(guardanglePrev(1),leftangle,directleft,10);
    else
        rad1path=leftangle;
    end
    if rightangle-guardanglePrev(2) < 0.35
        rad2path=searcherThetaPath(guardanglePrev(2),rightangle,directright,10);
    else
        rad2path=rightangle;
    end
else
    rad1path = leftangle;
    rad2path = rightangle;
end
guardanglePrev = [leftangle,rightangle];
guardradpathleft = rad1path;
guardradpathright = rad2path;

    
        