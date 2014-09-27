function [ s_next ] = randomNextState( s )
%random get the next state
%written by Chao Fang

first=randi(size(s,1),1,1);
second=randi(size(s,1),1,1);
    while first==second
        second=randi(size(s,1),1,1);
    end
temp=s(first,:);
s(first,:)=s(second,:);
s(second,:)=temp;
s_next=s;
end

