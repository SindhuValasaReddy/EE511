% Date : February 14 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #4 - Integrals and Intervals
% Question 3 : A geyser is a hot spring characterized by an intermittent
% discharge of water and steam.  Old Faithful is a famous cone geyser in 
% Yellowstone National Park, Wyoming.  It has a predictable geothermal 
% discharge and since 2000 it has erupted every 44 to 125 minutes. Refer 
% to the addendum data file that contains waiting times and the durations 
% for 272 eruptions.  Compute a 95% statistical confidence interval for the 
% waiting time using data from only the first 15 eruptions.  Compare this 
% to a 95% bootstrap confidence interval using the same 15 data samples.    
% Repeat  these  calculation  using  all  the  data  samples. Comment  on  
% the  relative  width  of  the confidence intervals when using only 15 
% samples vs using all samples

clc;
clear all;
n1 = 15;
n2 = 272;
waiting_272 = [79 54 74 62 85 55 88 85 51 85 54 84 78 47 83 52 62 84 52 79 51 47 78 69 74 83 55 76 78 79 73 77 66 80 74 52 48 80 59 90 80 58 84 58 73 83 64 53 82 59 75 90 54 80 54 83 71 64 77 81 59 84 48 82 60 92 78 78 65 73 82 56 79 71 62 76 60 78 76 83 75 82 70 65 73 88 76 80 48 86 60 90 50 78 63 72 84 75 51 82 62 88 49 83 81 47 84 52 86 81 75 59 89 79 59 81 50 85 59 87 53 69 77 56 88 81 45 82 55 90 45 83 56 89 46 82 51 86 53 79 81 60 82 77 76 59 80 49 96 53 77 77 65 81 71 70 81 93 53 89 45 86 58 78 66 76 63 88 52 93 49 57 77 68 81 81 73 50 85 74 55 77 83 83 51 78 84 46 83 55 81 57 76 84 77 81 87 77 51 78 60 82 91 53 78 46 77 84 49 83 71 80 49 75 64 76 53 94 55 76 50 82 54 75 78 79 78 78 70 79 70 54 86 50 90 54 54 77 79 64 75 47 86 63 85 82 57 82 67 74 54 83 73 73 88 80 71 83 56 79 78 84 58 83 43 60 75 81 46 90 46 74];
for i = 1:1:15
    waiting_15(i) = waiting_272(i);                             % pick first 15 samples
end

mean_15 = mean(waiting_15);                                     % calculate mean of 15 samples  
std_15 = std(waiting_15);                                       % calculate std of 15 samples
display(['Mean of ',(num2str(n1)), ' samples']);
disp(mean_15);
display(['Standard deviation of ',(num2str(n1)), ' samples']);
disp(std_15);
t_15 = tinv(0.025,n1-1);
ci1_15 = mean_15 - (std_15 * t_15/(sqrt(n1)));                  % calculate statistical ci for 15 samples
ci2_15 = mean_15 + (std_15 * t_15/(sqrt(n1)));
ci_15 = [ci2_15 ci1_15];
display(['Statistical confidence intervals for ',(num2str(n1)), ' samples']);
display(ci_15);

figure(1);
subplot(4,1,1);
hist(waiting_15);
title(['Plot of Histogram and statistical confidence intervals for waiting time for ',(num2str(n1)),' samples']);
xlabel('Waiting time');
ylabel('Frequency');
hold on;
plot(ci_15,0, 'r*', 'LineWidth', 2, 'MarkerSize', 15);
hold off;
hold on;
plot(mean_15,0, 'b*', 'LineWidth', 2, 'MarkerSize', 15);
hold off;
resampling = 10000;
[boot_ci_15, sample_mean_15] = bootci(resampling, @mean, waiting_15); % calculate bootstrap ci for 272 samples
M_15 = mean(sample_mean_15);
display(['Bootstrap confidence intervals for ',(num2str(n1)), ' samples']);
disp(boot_ci_15);

subplot(4,1,2);
hist(waiting_15);
title(['Plot of Histogram and bootstrap confidence intervals for waiting time for ',(num2str(n1)),' samples']);
xlabel('Waiting time');
ylabel('Frequency');
hold on;
plot(boot_ci_15,0, 'r*', 'LineWidth', 2, 'MarkerSize', 15);
hold off;
hold on;
plot(M_15,0, 'b*', 'LineWidth', 2, 'MarkerSize', 15);
hold off;

mean_272 = mean(waiting_272);                       % calculate mean of 272 samples
std_272 = std(waiting_272);                         % calculate std of 272 samples
display(['Mean of ',(num2str(n2)), ' samples']);
disp(mean_272);
display(['Standard deviation of ',(num2str(n2)), ' samples']);
disp(std_272);
t_272 = tinv(0.025,n2-1);
ci1_272 = mean_272 - (std_272 * t_272/(sqrt(n2)));  % calculate statistical ci for 272 samples
ci2_272 = mean_272 + (std_272 * t_272/(sqrt(n2)));
ci_272 = [ci2_272 ci1_272];
display(['Statistical confidence intervals for ',(num2str(n2)), ' samples']);
display(ci_272);

subplot(4,1,3);
hist(waiting_272);
title(['Plot of Histogram and statistical confidence intervals for waiting time for ',(num2str(n2)),' samples']);
xlabel('Waiting time');
ylabel('Frequency');
hold on;
plot(ci_272,0, 'r*', 'LineWidth', 2, 'MarkerSize', 15);
hold off;
hold on;
plot(mean_272,0, 'b*', 'LineWidth', 2, 'MarkerSize', 15);
hold off;
[boot_ci_272, sample_mean_272] = bootci(resampling, @mean, waiting_272); % calculate bootstarp ci for 272 samples
M_272 = mean(sample_mean_272);
display(['Bootstrap confidence intervals for ',(num2str(n2)), ' samples']);
disp(boot_ci_272);

subplot(4,1,4);
hist(waiting_272);
title(['Plot of Histogram and bootstrap confidence intervals for waiting time for ',(num2str(n2)),' samples']);
xlabel('Waiting time');
ylabel('Frequency');
hold on;
plot(boot_ci_272,0, 'r*', 'LineWidth', 2, 'MarkerSize', 15);
hold off;
hold on;
plot(M_272,0, 'b*', 'LineWidth', 2, 'MarkerSize', 15);
hold off;







       



