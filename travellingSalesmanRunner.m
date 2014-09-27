%this is the runner function of travelling salesman problem using hill
%climbing
%written by Chao Fang
rng(1);
%choice==1-fifteen cities
%choice==2-fifty seven cities
[coords,D]=prepareDataSet(2);
cityID=1:size(coords,1);

%start with any tour, e.g in input order
%assign cityID to each coordinates
s=[cityID', coords];


%disp('initial string of city ID with their coords:')
%disp(s)

figure;
subplot(2,2,1);
plot(s(:,2),s(:,3));
title('initial routine')
xlabel('x-axis')
ylabel('y-axis')

%record initial tour as best so far
minCost=cost(s,D);
minTour=s;

T=9999;
beta=0.99;
max_evaluations=5000;
num_evaluations=1;
best_score=0;
minCostArray=zeros(max_evaluations,1);
while (num_evaluations<max_evaluations+1)
    s_next=randomNextState(s);
    if cost(s_next,D)<cost(s,D)
        s=s_next;
        if cost(s_next,D)<minCost
            minCost=cost(s_next,D);
            minTour=s_next;
        end
    elseif (expCoinFlip(s,s_next,D,T)==1)
        s=s_next;
    end
    T=newTemperature(T,beta);
    
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
title('final routine')
xlabel('x-axis')
ylabel('y-axis')