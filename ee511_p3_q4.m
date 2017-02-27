% Date : February 6 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #3 - Samples and Statistics
% Question 2 : Produce a sequence {Xk} where p(j) = p/j for j = 1,2,...60
% where p is a constant for you to determine.[This is equivalent to
% spinning the minute hand on a clock and observing the stopping position
% if P[stop on minute j] = p/j]. Generate a histogram. Define the random
% variable N(j) = min{k:X(k) = j}. Simulate sampling from N60. Estimate
% E[N60] and Var[N60]. Compare your estimates with the theoritical values

clc;
clear all;
No_of_trials = 100;
summation = 0;
for i = 1:1:60
    summation = summation + (1/i);
end
P = 1/summation;                             % calculation of P which is sum of first 60 terms of the harmonic sequence
display('The value of P is');
disp(P);
for i=1:1:60                                 % calculating probabilities of the 1st 60 given that p(j) = P/j, j=1,2,...60
    p(i) = P/i;
end

% To generate sequence Xk, Inverse Transform Method is used

cum_prob = 0;                                % variable to store cumulative probability values

for k=1:1:No_of_trials
    i = 1;
    u = rand;                                % generate uniform random number [0,1]
    prob = p(i);
    cum_prob = prob;
    while u >= cum_prob
        prob = p(i+1);
        cum_prob = cum_prob + prob;
        i = i + 1;
    end
    X(k) = i;                               
end
figure(1);
subplot(2,1,1);
hist(X,10);
title(['The histogram for sequence Xk']);
xlabel('Numbers 1 to 60');
ylabel('Frequency');
% 
% % To generate random sequence Xk using Inverse Transform Method and to find minimum no of samples required
% % to obtain sample 60
N = 0;
for a=1:1:1000
for k=1:1:No_of_trials
    i = 1;
    u = rand;                               % generate uniform random number [0,1]
    prob = p(i);
    cum_prob = prob;
    while u >= cum_prob
        prob = p(i+1);
        cum_prob = cum_prob + prob;         % calculate cumulative probabilities
        i = i + 1;
    end
    Y(k) = i;                               % assign each generated sample based on Inverse Transform method
    if i == 60;                             % check if each sample is 60
        N(a) = k;                           % assign minimum samples to N
        break;
    end
end

end
m = sum(N);
display('Obtained Mean is');
disp(m/60);
mean_th = 1/p(60);
display('Theoretical mean');
disp(mean_th);
display('Obtained variance is');
disp(var(N));
v = (1 - p(60))/(p(60) ^ 2);
display('Theoretical variance is');
display(v/100);
subplot(2,1,2);
hist(N,20);
title(['The histogram for minimum number of samples to be drawn to get X = 60']);
xlabel('Minimum number of samples');
ylabel('Frequency');

