% Date : January 23 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #2 - Samples and Statistics
% Question 2 : Produce a sequence X by drawing samples from a standard
% uniform random variable
% 2a) Compute Cov[Xk,Xk+1]. Are Xk and Xk+1 uncorrelated? What can you conclude about the independence of Xk and Xk+1? 

clc;
clear all;
No_of_samples = 1000;
X = rand(1,No_of_samples);                  % Generate random samples
X_shifted = 0;
for i=2:1:No_of_samples
    X_shifted(i) = X(i-1);                  % Generate Xk+1 sequence by shifting sequence X once to the right
end
display('The number of samples is');
disp(No_of_samples);

cov_Xk = cov(X,X_shifted); % Calculate the covariance between Xk and Xk+1
display('Covariance of Xk and Xk+1 is');
disp(cov_Xk);
if cov_Xk == 0
    display('Xk and Xk+1 are uncorrelated');
else
    display('Xk and Xk+1 are correlated');
end

% 2b) Compute a new sequence Y where:
% Y[k] = X[k] - 2*X[k-1] + 0.5*X[k-2] - X[k-3]. Assume X[k] = 0 for k <= 0
% Compute Cov[Xk,Yk]. Are Xk and Yk uncorrelated?
    

Y(1) = X(1);
Y(2) = X(2) - 2*X(1);
Y(3) = X(3) - 2*X(2) + 0.5*X(1);
for k = 4:1:No_of_samples
    Y(k) = X(k) - 2*X(k-1) + 0.5*X(k-2) - X(k-3);       % Using the expression given generate sequence Y from sequence X
end

cov_XY = cov(X,Y);                                   % Calculate covariance between Xk and Yk
display('Covariance of X and Y');
disp(cov_XY);
if cov_XY == 0
    display('Xk and Yk are uncorrelated');
else
    display('Xk and Yk are correlated');
end


