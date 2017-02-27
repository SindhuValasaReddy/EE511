% Date : January 23 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #2 - Samples and Statistics
% Question 3 Let M = 10. Simulate (uniform) sampling with replacement from
% the outcomes 0, 1, 2, 3,...., M-1.
% 3a) Generate a histogram of the outcomes.

clc;
clear all;
No_of_samples = 1000;
rand_seq = randi([0 9],1,No_of_samples);                % Generate discrete random sequence between 0 and 9
display('The number of samples are');
disp(No_of_samples);
figure(1);
hist(rand_seq);                                                            
title(['The histogram for uniformly discrete sampling of ',(num2str(No_of_samples)),' samples']);
xlabel('Outcomes');
ylabel('Frequency');

% 3b) Perform a statistical goodness-of-fit test to conclude at the 95%
% confidence level if your data fits samples from a dicrete uniform
% distribution 0, 1, 2,..., 9


bin = zeros(1,10);
sum_each = 0;
for i=1:1:No_of_samples
    j = rand_seq(i) + 1;                                % Calculate the observed value for each sample
    bin(j) = bin(j) + 1;
end

for i=1:1:10
    sum_each(i) = (bin(i) - (No_of_samples/10))^2/(No_of_samples/10);
    chi_sq = sum(sum_each);                             % Calculate the chi-square value
end
display('The observed values for the samples');
display('0 1 2 3 4 5 6 7 8 9');
disp(bin);
display('The chi square value for the distribution is');
disp(chi_sq);
chi_sq_threshold_95 = chi2inv(0.95,9);                   % Calculate threshold value for 95% onfidence interval with 9 degrees of freedom
display('The threshold for the 95% confidence interval for 9 degrees of freedom is'); 
disp(chi_sq_threshold_95);
if chi_sq > chi_sq_threshold_95                          % To check if the data follows uniform distribution or not
    uni_dist = 0;  
    display('Does not follow uniform distribution');
else
    uni_dist = 1; 
    display('Follows uniform distribution');
end
figure(2);
x = 0:0.2:30;
y = chi2pdf(x,9);
plot(x,y);
title('The statistical goodness-of-fit test at 95% confidence interval for 9 degrees of freedom');
xlabel('Chi square');
ylabel('Probability distributed function');
hold on;
plot(chi_sq,0, 'b*', 'LineWidth', 2, 'MarkerSize', 15);
hold off;
hold on;
plot(chi_sq_threshold_95,0, 'r*', 'LineWidth', 2, 'MarkerSize', 15);
hold off;


% 3c) Repeat (3b) to see if your data(the same data from b) instead fit an
% alternate uniform distribution 1, 2,..., 10.
 
    
rand_seq_3c = rand_seq;
bin_3c = zeros(1,11);
sum_each_3c = 0;
for i=1:1:No_of_samples
    k = rand_seq_3c(i) + 1;
    bin_3c(k) = bin_3c(k) + 1;
end
int_calc = 0;
for i=2:1:10
      sum_each_3c(i) = (bin_3c(i) - (No_of_samples/10))^2/(No_of_samples/10);
      int_calc = sum(sum_each_3c);
end     

chi_sq_3c = int_calc + 10;

display('The observed values for the samples');
display('0 1 2 3 4 5 6 7 8 9 10');
disp(bin_3c);
display('The chi square value for the alternate distribution is');
disp(chi_sq_3c);
if chi_sq < chi_sq_3c                          % To check if the data follows alternate uniform distribution or not
    distb_distc = 0;  
    display('Data in 3b does not fit the alternate uniform distribution of 1,2,..,10');
else
    distb_distc = 1; 
    display('Data in 3b fits the alternate uniform distribution of 1,2,..,10');
end
figure(3);
x = 0:0.1:15;
y = chi2pdf(x,9);
plot(x,y);
title('The statistical goodness-of-fit test for an alternate uniform distribution');
xlabel('Chi square');
ylabel('Probability distributed function');
hold on;
plot(chi_sq,0, 'b*', 'LineWidth', 2, 'MarkerSize', 15);
hold off;
hold on;
plot(chi_sq_3c, 'r*', 'LineWidth', 2, 'MarkerSize', 15);
hold off;

    




