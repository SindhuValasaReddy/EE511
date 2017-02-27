% Date : February 14 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #4 - Integrals and Intervals
% Question 1 : Approximate the following integrals using a Monte Carlo simulation.  Compare your estimates with the exact 
% values (if known):
% a) integral -2 to 2 exp(x+x^2)dx
% b) integral -infinity to infinity exp(-x^2)dx
% c) double integral 0 to 1 exp(-(x+y)^2)dydx

clc;
clear all;

N = 1000;                                       % No of samples
sum_1 = 0;
sum_2 = 0;
sum_3 = 0;

% Approximation of Integral using Monte Carlo simulation for Part(a)

x_a_1 = -2;                                     % lower limit of x
x_b_1 = 2;                                      % upper limit of x
y_a_1 = exp(x_a_1 + (x_a_1^2));                 % lower limit of y
y_b_1 = exp(x_b_1 + (x_b_1^2));                 % upper limit of y


fun = @(z) exp(z + (z.^2));
a = integral (@(z) fun(z),x_a_1,x_b_1);         % theoretical integration of funtion(x)

for i =1:1:N
   x_N_1 = x_a_1 + (x_b_1-x_a_1).*rand();       % generate random number between x limit
   y_N_1 = y_a_1 + (y_b_1-y_a_1).*rand();       % generate random number between y limit
   f_N_1(i) = exp(x_N_1 + (x_N_1^2));           % calculate f(x)
   if f_N_1(i) > y_N_1                          % check if random point lies in the curve or not
    sum_1 = sum_1 + 1;                          % count points lying in the curve
   end
   
end
area_1 = (x_b_1-x_a_1) * (y_b_1-y_a_1);
points_1 = sum_1*area_1/N;                      % integral result using monte carlo sim

display('Integral result using Monte Carlo Simulation for Part(a)');
disp(points_1);
display('Integral result theoretically for Part(a)');
disp(a);

% Approximation of Integral using Monte Carlo Simulation for Part(b)

x_a_2 = -Inf;                                   % lower limit of x
x_b_2 = Inf;                                    % upper limit of x
y_a_2 = exp(-x_a_2^2);                          % lower limit of y
y_b_2 = exp(-x_b_2^2);                          % upper limit of y


fun_2 = @(z) exp(-z.^2);
b = integral (@(z) fun_2(z),x_a_2,x_b_2);       % theoretical integration of funtion(x)

for i =1:1:N
   x_N_2 = rand();                              % generate random number
   y_N_2 = rand();                              
   f_N_2(i) = exp(-x_N_2^2);                    % calculate f(x)
   if f_N_2(i) > y_N_2                          % check if random point lies in the curve or not
    sum_2 = sum_2+1;                            % count points lying in the curve
   end
   
end

points_2 = sum_2*2/N;                           % 2*integral 0 to inf, integral result using monte carlo sim


display('Integral result using Monte Carlo Simulation for Part(b)');
disp(points_2);
display('Integral result theoretically for Part(b)');
disp(b);

% Approximation of Integral using Monte Carlo simulation for Part(c)

x_a_3 = 0;                                      % lower limit of x
x_b_3 = 1;                                      % upper limit of x
y_a_3 = 0;                                      % lower limit of y
y_b_3 = 1;                                      % upper limit of y
k_a_3 = exp(-(x_a_3 + y_a_3)^2);                % lower limit of k
k_b_3 = exp(-(x_b_3 + y_b_3)^2);                % upper limit of k


fun = @(x,y) exp(-(x + y).^2);                  % theoretical integration of funtion(x,y)
c = integral2 (@(x,y)fun(x,y),x_a_3,x_b_3,y_a_3,y_b_3);

for i =1:1:N
   x_N_3 = x_a_3 + (x_b_3-x_a_3).*rand();       % generate random number between x limit
   y_N_3 = y_a_3 + (y_b_3-y_a_3).*rand();       % generate random number between y limit
   k_N_3 = k_a_3 + (k_b_3-k_a_3).*rand();       % generate random number between k limit
   f_N_3(i) = exp(-(x_N_3 + y_N_3)^2);          % calculate f(x)
   if f_N_3(i) > k_N_3                          % check if random point lies in the curve or not
    sum_3 = sum_3+1;                            % count points lying in the curve
   end
   
end
area_3 = (x_b_3-x_a_3) * (y_b_3-y_a_3) * (k_a_3-k_b_3);
points_3= sum_3*area_3/N;                       % integral result using monte carlo sim

display('Integral result using Monte Carlo Simulation for Part(c)');
disp(points_3);
display('Integral result theoretically for Part(c)');
disp(c);









