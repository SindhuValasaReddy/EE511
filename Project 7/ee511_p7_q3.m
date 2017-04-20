% Date : April 20 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #7 - Expectation Maximization
% Question 3

clc; 
clear all; 
close all;
mean = [0 5;2 0];                       % Choose the mean for subpopulations
sigma = cat(3,[3 1;1 1],[1 0;0 1]);     % Covariance matrices for subpopulations
weights = [0.95,0.05];                    % Symmetric components
obj = gmdistribution(mean,sigma,weights); % Perform GMM distribution
Y = random(obj,300);                      % Generate GMM-EM estimates
figure(1);
subplot(2,2,1);
hold on
opt = statset('Display','final');
Expectation_Max = gmdistribution.fit(Y,2,'Options',opt); 
h = ezcontour(@(x,y)pdf(Expectation_Max,[x y]),[-10 10],[-10 10]);
title('Scatter plot after convergence'); xlabel('Range of X'); ylabel('Range of Y');
hold off
subplot(2,2,2);
y = pdf(Expectation_Max,Y);
ezsurf(@(x,y)pdf(Expectation_Max,[x y]),[-10 10],[-10 10])




