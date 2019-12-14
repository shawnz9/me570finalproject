function  searchercatch_plot(searcher,evader)
catchangle=calrad(evader,searcher);
if ifblock(evader,searcher)
    endpoint = endpointCollision(searcher,catchangle);
    plot(searcher(1),searcher(2),'*r');
    plot([searcher(1),endpoint(1)],[searcher(2),endpoint(2)],'-r');
    plot(evader(1),evader(2),'*b');
else
    plot(searcher(1),searcher(2),'*r');
    plot([searcher(1),evader(1)],[searcher(2),evader(2)],'-r');
    plot(evader(1),evader(2),'*b');
end
    