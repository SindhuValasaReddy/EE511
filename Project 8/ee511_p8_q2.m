% Date : May 10 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #8 - Markov Chain Monte Carlo
% Question 2 

% Part a 

clc;
clear all;
No_S = 10000;
Number_Random_Variables = 3; 
Constant = 15; 
Random_Variable_Vector = 4*ones(1,Number_Random_Variables);
Co_me=1;
% Gibbs Sampler Algorithm
for Iteration_Var1 = 1 : No_S 
    R_I = ceil(Number_Random_Variables*rand);
    S = sum(Random_Variable_Vector) - R_I*Random_Variable_Vector(R_I);
    Random_Variable_Vector(R_I) = max(Constant-S,0)-log(rand)/Co_me;
    Sum_Random_Variable(Iteration_Var1) = S + Random_Variable_Vector(R_I);
end
disp('The expected value is =');
disp(mean(Sum_Random_Variable)); 
% 2*std(Sum_Random_Variable)/sqrt(No_S)]);

% Part b
No_S = 10000;
Number_Random_Variables = 3; 
Constant = 1; 
Random_Variable_Vector = 4*ones(1,Number_Random_Variables);
Co_me=1;

% Gibbs Sampler Algorithm
for Iteration_Var1 = 1 : No_S 
    R_I = ceil(Number_Random_Variables*rand);
    S = sum(Random_Variable_Vector) - R_I*Random_Variable_Vector(R_I);
    Random_Variable_Vector(R_I) = log(rand)/Co_me- max(Constant-S,0);
    Sum_Random_Variable(Iteration_Var1) = S + Random_Variable_Vector(R_I);
end
disp('The expected value is =');
disp(mean(Sum_Random_Variable));
% 2*std(Sum_Random_Variable)/sqrt(No_S)]);