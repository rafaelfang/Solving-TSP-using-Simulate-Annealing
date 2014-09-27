function [ totalCost ] = cost( s,D )
%the cost function calculate the total cost of 
% s, which is a path
%written by Chao Fang
totalCost=0;
    for i=1:size(s,1)-1
        totalCost=totalCost+D(s(i,1),s(i+1,1));
    end
    totalCost=totalCost+D(s(1,1),s(size(s,1),1));
end

