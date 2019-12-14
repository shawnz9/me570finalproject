function [catchflag,seeflag] = ifpursuersee(evader,pursuer,pursuerLeftCurrent,pursuerRightCurrent,preflag,swipeflagl,swipeflagr)
% test if the evade is between the searcher/guard's previous endpoint and

% current endpoint.Self-Occluded
% pursuerLeftPrev = leftendpoints(:,1);
% pursuerRightPrev = rightendpoints(:,1);

catchflag = false;

if ifblock(pursuer,evader)
    seeflag = [NaN,NaN];
    return
end
leftflag = pointlineside(pursuer,pursuerLeftCurrent,evader);
rightflag = pointlineside(pursuer,pursuerRightCurrent,evader);
seeflag = [leftflag,rightflag];
if seeflag(1)*seeflag(2) ==0
    catchflag = true;
    return
end
if ~isnan(swipeflagl)
    if ~isnan(preflag(1)) && ~swipeflagl
        if leftflag*preflag(1) < 0
            catchflag = true;
        end
    end
end

%rightflag 
if ~isnan(swipeflagr)
    if ~isnan(preflag(2)) && ~swipeflagr
        if rightflag*preflag(2) < 0
            catchflag = true;
        end
    end
end

    
        

    





