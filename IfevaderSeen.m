function [flag,seeflag] = IfevaderSeen(evader,pursuer,pursuerLeftEndpoint,pursuerRightEndpoint,prevflag )
flag = false;
if ifblock(pursuer,evader)
    seeflag = [NaN,NaN];
    return
else
    leftflag = pointlineside(pursuer,pursuerLeftEndpoint,evader);
    rightflag = pointlineside(pursuer,pursuerRightEndpoint,evader);
    seeflag = [leftflag,rightflag];
    if ~isnan(seeflag(1)) 
        if leftflag == 0 ||leftflag == -prevflag(1)
            flag = true;
            return
        end
        
    elseif ~isnan(seeflag(2)) 
        if rightflag == 0 ||rightflag == -prevflag(2)
            flag = true;
        end
    end
end





