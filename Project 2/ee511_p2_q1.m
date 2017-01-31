% Date : January 23 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #2 - Samples and Statistics
% Question 1 : Simulate sampling uniformly on the interval [-3,2].
% 1a) Generate a histogram of the outcomes

clc;
clear all;
No_of_samples = 100;                                                                 

a = -3;                                                                    % The lower interval of a random number
b = 2;                                                                     % The upper interval of a random number
rand_seq = a + (b-a).*rand(No_of_samples,1);                               % Generate random numbers in the interval [a,b]
figure(1);
hist(rand_seq);                                                            
title(['The histogram for uniformly sampling of ',(num2str(No_of_samples)),' samples']);
xlabel('Outcomes');
ylabel('Frequency');

% 1b) Compute the sample mean and sample variance for your samples. How do
% these values compare to the theoretical values? If you repeat the
% experiment will you compute a different sample mean or sample variance?

display('Number of samples');
disp(No_of_samples);
sample_mean = mean(rand_seq);                                              % Calculation of sample mean 
sample_variance = var(rand_seq);                                           % Calculation of sample variance 
theoretical_sample_mean = (b+a)/2;                                         % Calculation of theoretical mean 
theoretical_sample_variance = ((b-a)^2)/12;                                % Calculation of theoretical variance
display('The sample mean is');
disp(sample_mean);
display('The theoretical sample mean is');
disp(theoretical_sample_mean);
display('The sample variance is');
disp(sample_variance);
display('The theoretical sample variance is');
disp(theoretical_sample_variance);


% 1c) Compute the bootstrap confidence interval (what width?) for the
% sample mean and sample standard deviation.

resampling = 10000;                                                        % The number of resamples 
display('The number of times resampling is done is');
disp(resampling);

[ci_sample_mean, resamples_mean] = bootci(resampling, @mean, rand_seq);    % To determine the confidence interval of sample mean and the mean of the resamples
[ci_sample_std, resamples_std] = bootci(resampling, @std, rand_seq);       % To determine the confidence interval of sample standard deviation and the standard deviation of the resamples


display('The bootstrap confidence interval(CI) for the sample mean is');
disp(ci_sample_mean);

display('The bootstrap confidence interval(CI) for sample standard deviation is');
disp(ci_sample_std);

figure(2);
hist(resamples_mean);
title('The histogram showing bootstrap confidence interval for sample mean');
xlabel('Sample mean');
ylabel('Frequency');
hold on;
plot(ci_sample_mean,0, 'r*', 'LineWidth', 2, 'MarkerSize', 15);
hold off;


figure(3);
hist(resamples_std);
title('The histogram showing bootstrap confidence interval for standard deviation');
xlabel('Sample Standard Deviation');
ylabel('Frequency');
hold on;
plot(ci_sample_std,0, 'r*', 'LineWidth', 2, 'MarkerSize', 15);
hold off;
