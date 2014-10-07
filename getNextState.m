function [ s_next,start,k ] = getNextState( s,totalCityNum )
%random get the next state
%written by Chao Fang
    k=max(randi(totalCityNum-1),2);
    
    index=1:totalCityNum+1;
    start=1+randi(size(s,1)-2-k+1,1,1);
    reversePart=flipud([start:start+k-1]');
    index(start:start+k-1)=reversePart;
    s_next=s(index,:);
    
% first=randi(size(s,1),1,1);
% second=randi(size(s,1),1,1);
%     while first==second
%         second=randi(size(s,1),1,1);
%     end
% temp=s(first,:);
% s(first,:)=s(second,:);
% s(second,:)=temp;
% s_next=s;
end

