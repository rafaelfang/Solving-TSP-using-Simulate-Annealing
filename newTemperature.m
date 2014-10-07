function [ T_new ] = newTemperature( T,beta)
%temperature decrease
%written by Chao Fang
 T_new=beta*T;
 %T_new=T-beta;
%T_new = 9*log10(T);
end

