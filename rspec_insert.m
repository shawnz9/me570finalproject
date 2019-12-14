%function [pQueue]=priority_insert(pQueue,key,cost)
%Add an element to the queue.
function [pQueue]=rspec_insert(pQueue,essential,entrance,essindex,entindex,guardpoint,guardindex)
pQueue=[pQueue;struct('essential',essential,'entrance',entrance,'essindex',essindex,'entindex',entindex,'guardpoint',guardpoint,'guardindex',guardindex)];
