function [leftendpoint,rightendpoint,searchercatchflag,searcherpreflag,swipeflagl,swipeflagr] = searcher_plot(searcher,searchradpathleft,searchradpathright,evader,searcherpreflag,leftendpointPrev,rightendpointPrev,direction,plot_info_1,plot_info_2)
rad1path = searchradpathleft;
rad2path = searchradpathright;
leftangle = rad1path(end);
rightangle = rad2path(end);
searchercatchflag = 0;
tol = 10e-1;
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
        leftendpoint = endpointCollision(searcher,radleft);
        rightendpoint = endpointCollision(searcher,radright);
        plot(searcher(1),searcher(2),'*r');
%         plot(leftendpoint(1),leftendpoint(2),'*k');
%         plot(rightendpoint(1),rightendpoint(2),'*k');
        plot([searcher(1),leftendpoint(1)],[searcher(2),leftendpoint(2)],'r');
        plot([searcher(1),rightendpoint(1)],[searcher(2),rightendpoint(2)],'r');
        % previous elements
        
        %plot(plot_info_1(1,1),plot_info_2(1,1),'k*');
        plot(plot_info_1(1,2),plot_info_1(2,2),'*g');
        %plot_info(2,1)
        %plot_info(2,2)
        plot([plot_info_1(1,2),plot_info_2(1,2)],[plot_info_1(2,2),plot_info_2(2,2)],'-g');
        plot([plot_info_1(1,2),plot_info_2(1,1)],[plot_info_1(2,2),plot_info_2(2,1)],'-g');
        pause(0.05)
        %testifsee
        if direction(1) == 1
            swipeflagl = polygon_isSelfOccluded(searcher,leftendpointPrev,leftendpoint,evader);
        else
            swipeflagl = polygon_isSelfOccluded(searcher,leftendpoint,leftendpointPrev,evader);
        end
        
        if direction(2) == 1
            swipeflagr = polygon_isSelfOccluded(searcher,rightendpointPrev,rightendpoint,evader);
        else
            swipeflagr = polygon_isSelfOccluded(searcher,rightendpoint,rightendpointPrev,evader);
        end
        
        leftendpointPrev = leftendpoint;
        rightendpointPrev = rightendpoint;
        
        [searchercatchflag,searcherpreflag] = ifpursuersee(evader,searcher,leftendpoint,rightendpoint,searcherpreflag,swipeflagl,swipeflagr);
        
        if searchercatchflag
            break
        end
        pause(1/60)
    end
else   
    leftendpoint = endpointCollision(searcher,leftangle);
    rightendpoint = endpointCollision(searcher,rightangle);
    plot(searcher(1),searcher(2),'*r');
%     plot(leftendpoint(1),leftendpoint(2),'*k');
%     plot(rightendpoint(1),rightendpoint(2),'*k')
    plot([searcher(1),leftendpoint(1)],[searcher(2),leftendpoint(2)],'-r');
    plot([searcher(1),rightendpoint(1)],[searcher(2),rightendpoint(2)],'-r');
    if direction(1) == 1
        swipeflagl = polygon_isSelfOccluded(searcher,leftendpointPrev,leftendpoint,evader);
        if leftendpointPrev(1) - leftendpoint(1) < tol && leftendpointPrev(2) - leftendpoint(2) < tol
            if searcher(1) > min(leftendpoint(1),evader(1)) && searcher(1) < max(leftendpoint(1),evader(1))
                swipeflagl = 1;
            end
        end
    else
        swipeflagl = polygon_isSelfOccluded(searcher,leftendpoint,leftendpointPrev,evader);
        if leftendpointPrev(1) - leftendpoint(1) < tol && leftendpointPrev(2) - leftendpoint(2) < tol
            if searcher(1) > min(leftendpoint(1),evader(1)) && searcher(1) < max(leftendpoint(1),evader(1))
                swipeflagl = 1;
            end
        end
    end
        
    if direction(2) == 1
        swipeflagr = polygon_isSelfOccluded(searcher,rightendpointPrev,rightendpoint,evader);
        if rightendpointPrev(1) - rightendpoint(1) < tol && rightendpointPrev(2) - rightendpoint(2) < tol
            if searcher(1) > min(rightendpoint(1),evader(1)) && searcher(1) < max(rightendpoint(1),evader(1))
                swipeflagr = 1;
            end
        end
    else
        swipeflagr = polygon_isSelfOccluded(searcher,rightendpoint,rightendpointPrev,evader);
        if rightendpointPrev(1) - rightendpoint(1) < tol && rightendpointPrev(2) - rightendpoint(2) < tol
            if searcher(1) > min(rightendpoint(1),evader(1)) && searcher(1) < max(rightendpoint(1),evader(1))
                swipeflagr = 1;
            end
        end
    end
end
