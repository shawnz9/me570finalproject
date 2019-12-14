function search_animate
% loading the room
load FreeSpace_data_R1.mat
% load evaderPath.mat
load InitialConditions.mat
% initial value
[evader] = evaderstart;
% get the path of searcher and guard
searcherpath = CreateSearcherpath(graphVector,rspec,door);
guardpath = CreateGuardpath(graphVector,rspec,door);
% evaderPath = xPath1;

for round=50:200
    polygon_plot(room,'k-');
    plot(evader(1),evader(2),'*b');
    plot(door(1),door(2),'oc');
    hold on
    
    % searcher go and plot
    searcher = searcherpath(:,round);
    [searchradpathleft,searchradpathright,searcheranglePrev,angleflag,direction] = searcherView(searcher,searcheranglePrev,angleflag);
    [searcherleftenpointPrev,searcherrightenpointPrev,searchercatchflag,searcherpreflag,searcherswipeflagl,searcherswipeflagr] =searcher_plot(searcher,searchradpathleft,searchradpathright,evader,searcherpreflag,searcherleftenpointPrev,searcherrightenpointPrev,direction,plot_info_1,plot_info_2);
    if searchercatchflag
        break
    end
    [searchercatchflag,searcherpreflag] = ifpursuersee(evader,searcher,searcherleftenpointPrev,searcherrightenpointPrev,searcherpreflag,searcherswipeflagl,searcherswipeflagr);
    if searchercatchflag
        break
    end
    
    % guard go and plot
    guard = guardpath(:,round);
    [guardradpathleft,guardradpathright,guardanglePrev] = guardView(guard,guardanglePrev);
    [guardleftenpointPrev,guardrightenpointPrev] = guard_plot(guard,guardradpathleft,guardradpathright);
    [guardcatchflag,guardpreflag] = ifpursuersee(evader,guard,guardleftenpointPrev,guardrightenpointPrev,guardpreflag,guardswipeflagl,guardswipeflagr);
    if guardcatchflag
        break
    end
    pause(fps)
    
    % evader go and plot
    evader = nextevader(evader,graphVector,blacklist);
    [evaderscatchflag,evaderspreflag] = IfevaderSeen(evader,searcher,searcherleftenpointPrev,searcherrightenpointPrev,evaderspreflag);
    if evaderscatchflag
        break
    end 
    [evadergcatchflag,evadergpreflag] = IfevaderSeen(evader,guard,guardleftenpointPrev,guardrightenpointPrev,evadergpreflag);
    if evadergcatchflag
        break
    end
    plot_info_2 = [guardleftenpointPrev,guardrightenpointPrev];
    plot_info_1 = [evader,guard];
    pause(fps)
    hold off
end
disp('see')

%catch loop
center = searcher;
hold off
while 1
    polygon_plot(room,'k-');
    plot(door(1),door(2),'oc');
    plot(evader(1),evader(2),'*b')
    hold on
    
    %searcher position & plot
    searcher = searcherCatchPosition(searcher,evader,center,graphVector);
    searchercatch_plot(searcher,evader);
    
    %guard position & plot
    [guard,roomnumber] = nextguard(guard,evader,graphVector);
    [guardradpathleft,guardradpathright,guardanglePrev] = guardcaptureView(guard,guardanglePrev,roomnumber);
    [~,~] = guard_plot(guard,guardradpathleft,guardradpathright);
    
    %evader position
    evader = evaderescape(evader,searcher,graphVector,blacklist);
    pause(fps)
    hold off
    
    if ifcatch(searcher,evader)
        break
    end
end
disp('catch')