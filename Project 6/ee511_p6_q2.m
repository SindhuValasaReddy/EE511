% Date : March 30 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #6 - Continuous Sampling
% Question 2

clc;
clear all;
close all;
N = 1000;                                    % No of samples
% To calculate value of c: c <= f(x)/g(x) 
fx = @(x) 1/(sqrt(pi) * 29.5312) .* x.^(9/2) .* exp(-x); % one-line function handle for f(x)
gx = @(y) 2/11 * exp(-2*y/11); % one-line function handle for g(x)
t = 0:0.01:20;
ratio = fx(t)./gx(t);
c = max(ratio);                             % find the maximum ratio
% Accept reject method to generate random variables
for i = 1:N, z = 0;
    accept = false;
    while accept == false, z = z + 1;
        Y = exprnd(11/2);
        u = rand();
        if c*u <= fx(Y)/gx(Y)
           X(i) = Y;
           C(i) = z;
           accept = true;
        end
    end
end
figure(1);
subplot(2,1,1);
yyaxis left
hist(X);
yyaxis right
A = [0:0.1:20];
P = gampdf(A,11/2,1);                   % Generate theoretical PDF
plot(A,P);
legend('Histogram of X','PDF of X');
title('PDF of X overlaid on Histogram of X');
xlabel('Random variable X');
ylabel('Frequency/Probability of X');
for j = 1:1:N
    if C(j) > 1
        Q(j) = 0;
    else
        Q(j) = C(j);
    end
end
% To calculate the acceptance ratio in %
no_of_accept = sum(Q);
acceptance_rate = (no_of_accept/N)*100 ;
display('The acceptance rate in %');
disp(acceptance_rate);
subplot(2,1,2);
plot(t,fx(t),'linewidth',2);
hold on
plot(t,gx(t),'linewidth',2);
plot(t,c * gx(t),'r--','linewidth',2);
legend('pdf of Gamma(11/2,1)', 'pdf of Exponential(11/2)', 'c \cdot pdf of Exponential(11/2)')
hold off
