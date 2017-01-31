% Date : January 15 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #1 - Coin Flips
% Question 3 : Tossing a fair coin 100 times. Generate a histogram showing the heads run length

clc
clear all;
No_of_tosses = 100;                              % No of tosses as given
Outcomes = rand(1,No_of_tosses) > 0.5;           % Generate random numbers between [0,1] where numbers > 0.5 are Heads and < 0.5 are Tails
csum_outcomes = cumsum(Outcomes);                % Find the cumulative sum of the Outcomes
adj_diff = diff([Outcomes 0]) == -1;             % Calculate the adjacent difference
int_calc = csum_outcomes(adj_diff);
head_run_lengths = [int_calc(1) diff(int_calc)]; % Generate the different head run lengths
display('Outcomes are : ');
disp(Outcomes);
display(' Different head run lengths are : ');
disp(head_run_lengths);
figure(1);
hist(head_run_lengths);
title(['Histogram showing Head run lengths of a fair coin tossed ',(num2str(No_of_tosses)),' times']);
xlabel('Head run length');
ylabel('Frequency');

















