function [flag] = ifcatch(searcher,evader)

if norm(searcher-evader) <= 1
    flag = true;
else
    flag = false;
end