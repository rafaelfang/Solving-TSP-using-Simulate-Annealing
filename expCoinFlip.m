function [ result ] = expCoinFlip( s,s_next,D,T )
%jump to s_next even if it is worse
%written by Chao Fang
p=exp(-(cost(s_next,D)-cost(s,D))/T);
u=rand;
    if u<p
        result=1;
    else
        result=0;
    end
end

