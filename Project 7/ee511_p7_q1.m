% Date : April 20 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #7 - Expectation Maximization
% Question 1

clc;
clear all;
close all;
N = 1000;                           % No of samples
M = [3 -1 1 ; -1 5 3 ; 1 3 4];      % Covariance Matrix
A = chol(M,'lower');                % Choleski decomposition
U = [1;2;3];                        % Mean vector
for i=1:N
    Z = randn([3 1]);               % Standard normal random variable
    x = mtimes(A,Z) + U;            % Calculate X=A*Z + U
    X1(i)=x(1);
    X2(i)=x(2);
    X3(i)=x(3);
end
X(1) = mean(X1);                    % Determine sample mean
X(2) = mean(X2);
X(3) = mean(X3);
display('X is');
disp(X);
display('Sample Mean');
disp(X);
display('Covariance of X1,X2=');
disp(cov(X1,X2));
display('Covariance of X2,X3=');
disp(cov(X2,X3));
display('Covariance of X3,X1=');
disp(cov(X1,X3));




