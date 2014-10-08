close all
clear all
clc

%this is the runner function of travelling salesman problem using hill
%climbing
%written by Chao Fang
rng(1);
%choice==1-fifteen cities
%choice==2-fifty seven cities
[coords,D,totalCityNum]=prepareDataSet(1);
cityID=1:size(coords,1);

%start with any tour, e.g in input order
%assign cityID to each coordinates
s=[cityID', coords];

%attach the begining city to the end of starting sequence.
s=[s;s(1,:)];

%disp('initial string of city ID with their coords:')
%disp(s)
max_evaluations=100;
figure;
subplot(2,2,1);
plot(s(:,2),s(:,3));
title('initial routine')
xlabel('x-axis')
ylabel('y-axis')

%record initial tour as best so far
minCost=cost(s,D);
minTour=s;
candidateNum=3;

%T=0.14;
T=9999;
% beta=0.997;
beta=0.5;
%tempThreshold=0.1;
num_evaluations=1;
minCostArray=zeros(max_evaluations,1);
outputArr=zeros(max_evaluations,2);
temperatureArr=zeros(max_evaluations,1);
while (num_evaluations<max_evaluations+1)
    
    candidate=zeros(size(s,1),size(s,2),candidateNum);
    candidateCost=zeros(1,candidateNum);
    candidateStartPos=zeros(1,candidateNum);
    candidateStringLength=zeros(1,candidateNum);
    for t=1:candidateNum
        [candidate(:,:,t),candidateStartPos(1,t),candidateStringLength(1,t)]=getNextState(s,totalCityNum);
        candidateCost(1,t)=cost(candidate(:,:,t),D);
    end
    [minVal,minIndex]=min(candidateCost);
    minCandidateStartPos=candidateStartPos(1,minIndex);
    minCandidateStringLength=candidateStringLength(1,minIndex);
    
    s_next=candidate(:,:,minIndex);
    if cost(s_next,D)<cost(s,D)
        s=s_next;
        if cost(s_next,D)<minCost
            minCost=cost(s_next,D);
            minTour=s_next;
        end
        disp ('================')
        disp ('start position')
        disp (minCandidateStartPos)
        disp ('sequence length')
        disp (minCandidateStringLength)
        disp (strcat('state',int2str(num_evaluations)));
        disp (s)
        disp ('================')
        outputArr(num_evaluations,:)=[minCandidateStartPos,minCandidateStringLength];
    
    elseif (expCoinFlip(s,s_next,D,T)==1)
        s=s_next;
        disp ('================')
        disp ('start position')
        disp (minCandidateStartPos)
        disp ('sequence length')
        disp (minCandidateStringLength)
        disp (strcat('state',int2str(num_evaluations)));
        disp (s)
        disp ('================')
        outputArr(num_evaluations,:)=[minCandidateStartPos,minCandidateStringLength];
    
    end
    
    T=newTemperature(T,beta);
    temperatureArr(num_evaluations,1)=T;
    minCostArray(num_evaluations,1)=minCost;
    num_evaluations=num_evaluations+1;
    
end
%disp('after # of iteration:')
%disp(num_evaluations-1);
subplot(2,2,2)
plot(1:max_evaluations,minCostArray,'Color',[0,0.7,0.9])
title('Iteration vs Cost Plot')
xlabel('Iteration')
ylabel('Cost value')

% disp('final string of city ID with their coords:')
% disp(s)
subplot(2,2,3);
plot(s(:,2),s(:,3));
title(strcat('final routine with min cost',int2str(min(minCostArray))));
xlabel('x-axis')
ylabel('y-axis')

subplot(2,2,4);
plot(temperatureArr);
title('Temperature')
xlabel('x-axis')
ylabel('y-axis')