% Date : February 6 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #3 - Samples and Statistics
% Question 1 : Use the accept?reject method to sample from the following distribution pj by sampling from the (non?optimal) 
% uniform auxiliary distribution (qj = 0.05 for j=1,...,20):
%           p1=p2=p3=p4=p5=0.06, p6=p9=0.15, p7=p10=0.13, p8=0.14

% Generate a histogram and overlay the target distribution pj. Compute the sample mean and sample variance 
% and compare these values to the theoretical values.  Estimate the efficiency of your sampler with the following 
% ratio: 
%           Efficiency = #accepted/(#accepted + #rejected) 
% Compare your estimate of the efficiency to the theoretical efficiency given your choice for the constant c 


clc;
clear all;
m = 10;                                                 % no of samples in target dist
n = 20;                                                 % no of samples in auxillary dist
N = m*n;
for i=1:1:20                                            % pmf of auxillary dist
    q(i) = 0.05;
end
p = [0.06 0.06 0.06 0.06 0.06 0.15 0.13 0.14 0.15 0.13];% pmf of target dist
for i=11:1:20
    p(i) = 0;
end

% Using accept-reject method to generate samples from pj by sampling from
% qj

c = 3;                                                % constant c: p(j) <= cq(j)
C = 0;
X = 0;

for i=1:1:N
    k = 0;
    while(1)
        k = k + 1;
        Y = randi(20);                                  % generate random integer between 1 and 20
        u = rand;
        if c*u < p(Y)/q(Y)                              % check if sample belongs to target dist or not
            X(i) = Y;                                   % accept sample if it belongs to target dist
            C(i) = k;                                   % variable used to calculate efficiency
            break;
        end
    end
end

mean_X = mean(X);                                       % calculate mean for sequence X
mean_X_th = sum(p.*[1:20]);                             % theoretical calculations for mean for sequence X
var_X = var(X);                                         % calculate variance for sequence X
s = 0;
for i=1:1:10                                            % theoretical calculations for variance for sequence X
    s = s + (i-mean_X_th)^2;
end
var_X_th = s/10;
mean_C = mean(C);
diff = abs(c-mean_C);                                   % calculate efficiency
eff = diff * 100;
P_acceptance = 1/c;                                     % probability of acceptance
P_rejection = 1 - P_acceptance;
eff_theoretical = P_acceptance * 100;                   % theoretical calculations for efficiency

figure(1);
x1 = 1:1:10;
y1 = hist(X);
x2 = 1:1:20;
y2 = p;
plotyy(x1,y1,x2,y2,'bar','stem');
title(['Overlay of histogram for X and target distribution pj']);
xlabel('Samples');
ylabel('Frequency / Probability');

display('Mean of X');
disp(mean_X);
display('Theoritical Mean of X');
disp(mean_X_th);
display('Variance of X');
disp(var_X);
display('Theoretical Variance of X');
disp(var_X_th);
display('Mean of C');
disp(mean_C);
display('Efficiency');
disp(eff);
display('Theoretical Efficiency');
disp(eff_theoretical);



