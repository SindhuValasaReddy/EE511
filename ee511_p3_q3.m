% Date : February 6 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #3 - Samples and Statistics
% Question 2 : Define  the  random variable N = min{n:? X(i) > 4}, (1<=i<=n) as  the smallest number of uniform  random samples 
% whose sum is greater than four. Generate a histogram using 100, 1000, and 10000 samples for N. Comment on E[N] 

clc;
clear all;
No_of_trials_1 = 100;
No_of_trials_2 = 1000;
No_of_trials_3 = 10000;
n = 10000;                                               % maximum number of random numbers to get sum > 4
summation_1 = 0;
summation_2 = 0;
summation_3 = 0;
for i=1:1:No_of_trials_1                                % find min no of samples to get sum > 4 in 100 trials
    for j=1:1:n
        X = rand;                                       % generate uniform random number[0,1]
        summation_1 = summation_1 + X;
        if summation_1 > 4                              % to check if sum > 4
            break;
        end
    end
    summation_1 = 0;
    N_1(i) = j;                                         % no of samples for sum to exceed 4
end
E_1 = mean(N_1);                                        % E[N] when N = 100
display('Expectation of N for 100 samples, E[N] is ');
disp(E_1);
figure(1);
subplot(3,1,1);
hist(N_1);
title(['The histogram for minimum random samples whose sum exceeds 4 in ',(num2str(No_of_trials_1)), ' trials']);
xlabel('Minimum number of random samples whose sum > 4');
ylabel('Frequency');

for i=1:1:No_of_trials_2                                % find min no of samples to get sum > 4 in 1000 trials
    for j=1:1:n
        X = rand;                                       % generate uniform random number[0,1]
        summation_2 = summation_2 + X;
        if summation_2 > 4                              % to check if sum > 4
            break;
        end
    end
    summation_2 = 0;
    N_2(i) = j;                                         % no of samples for sum to exceed 4
end
E_2 = mean(N_2);                                        % E[N] when N = 1000
display('Expectation of N for 1000 samples, E[N] is ');
disp(E_2);
subplot(3,1,2);
hist(N_2);
title(['The histogram for minimum random samples whose sum exceeds 4 in ',(num2str(No_of_trials_2)), ' trials']);
xlabel('Minimum number of random samples whose sum > 4');
ylabel('Frequency');

for i=1:1:No_of_trials_3                                % find min no of samples to get sum > 4 in 10000 trials
    for j=1:1:n
        X = rand;                                       % generate uniform random number[0,1]
        summation_3 = summation_3 + X;
        if summation_3 > 4                              % to check if sum > 4
            break;
        end
    end
    summation_3 = 0;
    N_3(i) = j;                                         % no of samples for sum to exceed 4
end
E_3 = mean(N_3);                                        % E[N] when N = 10000
display('Expectation of N for 10000 samples, E[N] is ');
disp(E_3);
subplot(3,1,3);
hist(N_3);
title(['The histogram for minimum random samples whose sum exceeds 4 in ',(num2str(No_of_trials_3)), ' trials']);
xlabel('Minimum number of random samples whose sum > 4');
ylabel('Frequency');