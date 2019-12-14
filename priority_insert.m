%function [pQueue]=priority_insert(pQueue,key,cost)
%Add an element to the queue.
function [pQueue]=priority_insert(pQueue,key,cost)
%create a new queue including the element is going to be added
addQueue=struct('key',key,'cost',cost);
%add the new queue at the end of the old queue
pQueue=[pQueue;addQueue];