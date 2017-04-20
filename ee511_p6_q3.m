% Date : March 30 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #6 - Continuous Sampling
% Question 3

clc;
clear all;
close all;
N = 1000;                           % No of samples

% Generate rv from stable dist(alpha,beta,gamma,delta,No_of_samples) using stblrnd function
% Calculate the theoretical PDF using the stblpdf function
% Overlay theoretical PDF and Histogram 
% Plot time series using timeseries() function

% alpha = 0.5, beta = 0.75/0, gamma = 1, delta = 0
X = stblrnd(0.5,0.75,1,0,N,1);      
figure(1);
subplot(4,2,1);
yyaxis left
hist(X);
yyaxis right
A = [-10:0.1:20];
P = stblpdf(A,0.5,0.75,1,0,N,1);    
plot(A,P);
legend('Histogram of X','PDF of X');
title('PDF of X overlaid on Histogram of X, alpha=0.5 beta=0.75');
xlabel('Random variable X');
ylabel('Frequency/Probability of X');
t=timeseries(X);
figure(2);
subplot(4,2,1);
plot(t);
title('Time series plot with alpha = 0.5, beta = 0.75');
xlabel('Time');
ylabel('Random Variable X');

% alpha = 1, beta = 0.75/0, gamma = 1, delta = 0
X = stblrnd(1,0.75,1,0,N,1);
figure(1);
subplot(4,2,2);
yyaxis left
hist(X);
yyaxis right
A = [-200:0.1:700];
P = stblpdf(A,1,0.75,1,0,N,1);
plot(A,P);
legend('Histogram of X','PDF of X');
title('PDF of X overlaid on Histogram of X,alpha=1 beta = 0.75');
xlabel('Random variable X');
ylabel('Frequency/Probability of X');
t=timeseries(X);
figure(2);
subplot(4,2,2);
plot(t);
title('Time series plot with alpha = 1, beta = 0.75');
xlabel('Time');
ylabel('Random Variable X');

% alpha = 1.8, beta = 0.75/0, gamma = 1, delta = 0
X = stblrnd(1.8,0.75,1,0,N,1);
figure(1);
subplot(4,2,3);
yyaxis left
hist(X);
yyaxis right
A = [-10:0.1:30];
P = stblpdf(A,1.8,0.75,1,0,N,1);
plot(A,P);
legend('Histogram of X','PDF of X');
title('PDF of X overlaid on Histogram of X,alpha=1.8 beta=0.75');
xlabel('Random variable X');
ylabel('Frequency/Probability of X');
t=timeseries(X);
figure(2);
subplot(4,2,3);
plot(t);
title('Time series plot with alpha = 1.8, beta = 0.75');
xlabel('Time');
ylabel('Random Variable X');

% alpha = 2, beta = 0.75/0, gamma = 1, delta = 0
X = stblrnd(2,0.75,1,0,N,1);
figure(1);
subplot(4,2,4);
yyaxis left
hist(X);
yyaxis right
A = [-10:0.1:10];
P = stblpdf(A,2,0.75,1,0,N,1);
plot(A,P);
legend('Histogram of X','PDF of X');
title('PDF of X overlaid on Histogram of X,alpha=2 beta = 0.75');
xlabel('Random variable X');
ylabel('Frequency/Probability of X');
t=timeseries(X);
figure(2);
subplot(4,2,4);
plot(t);
title('Time series plot with alpha = 2, beta = 0.75');
xlabel('Time');
ylabel('Random Variable X');



