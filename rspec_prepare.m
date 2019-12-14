%function [pQueue]=priority_prepare()
%Create an empty structure array for the queue.
function [pQueue]=rspec_prepare()
pQueue=repmat(struct('essential',[],'entrance',[],'essindex',[],'entindex',[],'guardpoint',[],'guardindex',[]),0,1);

