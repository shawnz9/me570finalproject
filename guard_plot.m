function [guardleftenpointPrev,guardrightenpointPrev] = guard_plot(guard,guardradpathleft,guardradpathright)
rad1path = guardradpathleft;
rad2path = guardradpathright;
leftangle = rad1path(end);
rightangle = rad2path(end);

if size(rad1path,2) > 1 || size(rad2path,2) > 1
    for ifps=1:max(length(rad1path),length(rad2path))
        if ifps>length(rad1path)
            radleft=rad1path(end);
        else
            radleft=rad1path(ifps);
        end
        if ifps>length(rad2path)
            radright=rad2path(end);
        else
            radright=rad2path(ifps);
        end
        guardleftenpointPrev = endpointCollision(guard,radleft);
        guardrightenpointPrev = endpointCollision(guard,radright);
        plot(guard(1),guard(2),'*g');
        plot(guardleftenpointPrev(1),guardleftenpointPrev(2),'k');
        plot(guardrightenpointPrev(1),guardrightenpointPrev(2),'k')
        plot([guard(1),guardleftenpointPrev(1)],[guard(2),guardleftenpointPrev(2)],'-g');
        plot([guard(1),guardrightenpointPrev(1)],[guard(2),guardrightenpointPrev(2)],'-g');
        pause(1/60)
    end
else   
    guardleftenpointPrev = endpointCollision(guard,leftangle);
    guardrightenpointPrev = endpointCollision(guard,rightangle);
    plot(guard(1),guard(2),'*g');
    plot(guardleftenpointPrev(1),guardleftenpointPrev(2),'k');
    plot(guardrightenpointPrev(1),guardrightenpointPrev(2),'k')
    plot([guard(1),guardleftenpointPrev(1)],[guard(2),guardleftenpointPrev(2)],'-g');
    plot([guard(1),guardrightenpointPrev(1)],[guard(2),guardrightenpointPrev(2)],'-g');
end

