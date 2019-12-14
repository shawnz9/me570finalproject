function [searchradpathleft,searchradpathright,searcheranglePrev,angleflag,direction] = searcherView(searcher,anglePrev,angleflag)
flagleft = angleflag(1);
flagright = angleflag(2);
[leftangle,rightangle] = SearcherEndpointRotate(searcher);
directleft = rotatedirection(searcher,anglePrev(1),leftangle);
leftdiff = ifDifferent(flagleft,anglePrev(1),leftangle,directleft);
directright = rotatedirection(searcher,anglePrev(2),rightangle);
rightdiff = ifDifferent(flagright,anglePrev(2),rightangle,directright);
direction = [directleft,directright];
if leftdiff > 0.7 | rightdiff > 0.7
    if abs(leftangle-anglePrev(1)) > 0.7
        [rad1path,flagleft]=searcherThetaPath(anglePrev(1),leftangle,directleft,20);
    else
        rad1path=leftangle;
    end
    if abs(rightangle-anglePrev(2)) > 0.7
        [rad2path,flagright]=searcherThetaPath(anglePrev(2),rightangle,directright,20);
    else
        rad2path=rightangle;
    end
    angleflag = [flagleft,flagright];
else
    rad1path = leftangle;
    rad2path = rightangle;
end
searcheranglePrev = [leftangle,rightangle];
searchradpathleft = rad1path;
searchradpathright = rad2path;

    
