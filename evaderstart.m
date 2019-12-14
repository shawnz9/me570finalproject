function [evader] = evaderstart
x1 = randi([92,99],1);
x2 = randi([2,8],1);
picky = rand;

if picky > 0.5
    evader = [x1;randi([27,54],1)];
else
    evader = [x2;randi([36,64],1)];
end

