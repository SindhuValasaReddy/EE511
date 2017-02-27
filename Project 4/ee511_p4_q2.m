% Date : February 14 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #4 - Integrals and Intervals
% Question 2 : Define  the  random  variable X = Z1^2 + Z2^2 + Z3^2 + Z4^2
% where Zk ~ N(0,1) then X ~ chi^2(4). Generate 10 samples from X by first
% sampling Zi for i = 1,2,3,4 and then computing X. Plot the empirical
% distribution F*10(x) for your samples and overlay the theoretical
% distribution F(x). Estimate a lower bound for ||F*10(x) - F(x)||infinity
% by computing the maximum difference at each of your samples:
% max{||F*10(x) - F(x)||}. Then find the 25th, 50th and 90th
% percentiles using your empirical distribution and compare the value to
% the theoretical percentile values for chi^2(4). Repeat the bove using 100
% and 1000 samples from X.


clc;
clear all;
n = 10;
X = 0;
for i = 1:1:n
    sum = 0;
    for j = 1:1:4
        Z(j) = randn() ^ 2;             % Generate standard normal random numbers
        sum = sum + Z(j);
    end
    X(i) = sum;                         % Generate the samples in X
end
X = sort(X);                            % Sort the samples in X
sum = 0;
for i = 1:1:n
    F(i) = i/n;                         % Generate the empirical dist for X    
end

t = 1:1:10;

P = chi2cdf(X,4);                       % Generate the theoretical chi square dist
for i = 1:1:n
    diff(i) = (F(i) - P(i));            % Calculate diff for each emp and theoretical dist
end

display('Number of samples');
disp(n);

max_diff = max(diff);                   % Calculate max diff for emp and theoretical dist
display('Maximum difference is');
disp(max_diff);

figure(1);
stairs(X,1/n:1/n:1,'b','linewidth',2);
hold on;
grid on;
plot(t,P,'r--','linewidth',2);
hold off;
legend('Empirical cdf','Theoretical cdf');
ylim([0 1.05]);
title('Distribution of Chi-square(4) for 1000 samples');
xlabel('X');
ylabel('F(x)');

c1_th = chi2inv(0.25,4);                % Calculate the 25th percentile
display('Theoretical value of 25th percentile');
disp(c1_th);

display('Empirical value of 25th percentile');
disp(X(2));

c2_th = chi2inv(0.50,4);                % Calculate the 50th percentile
display('Theoretical value of 50th percentile');
disp(c2_th);

display('Empirical value of 50th percentile');
disp(X(5));

c3_th = chi2inv(0.90,4);                % Calculate the 90th percentile
display('Theoretical value of 90th percentile');
disp(c3_th);

display('Empirical value of 90th percentile');
disp(X(9));


        