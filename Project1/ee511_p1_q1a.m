% Date : January 15 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #1 - Coin Flips
% Question 1a : Tossing a fair coin 50 times for 20, 100,200 and 1000 times
% and to generate a histogram for each showing no of heads in 50 flips

 clc
 clear all;
 
 No_of_heads_20_50 = ee511_p1_q1a_function(20);    % No of heads in 50 flips 20 trials 
 figure(1);  
 hist(No_of_heads_20_50,50);
 title(['Histogram for 20 trials of 50 flips']);
 xlabel('No of Heads in 50 flips');
 ylabel(['Frequency in 20 trials']);
    
 No_of_heads_100_50 = ee511_p1_q1a_function(100);  % No of heads in 50 flips 100 trials
 figure(2);  
 hist(No_of_heads_100_50,50);
 title(['Histogram for 100 trials of 50 flips']);
 xlabel('No of Heads in 50 flips');
 ylabel(['Frequency in 100 trials']);
 
 No_of_heads_200_50 =ee511_p1_q1a_function(200);   % No of heads in 50 flips 200 trials 
 figure(3);  
 hist(No_of_heads_200_50,50);
 title(['Histogram for 200 trials of 50 flips']);
 xlabel('No of Heads in 50 flips');
 ylabel(['Frequency in 200 trials']);
 
 No_of_heads_1000_50 =ee511_p1_q1a_function(1000); % No of heads in 50 flips 1000 trials
 figure(4);  
 hist(No_of_heads_1000_50,50);
 title(['Histogram for 1000 trials of 50 flips']);
 xlabel('No of Heads in 50 flips');
 ylabel(['Frequency in 1000 trials']);

    
