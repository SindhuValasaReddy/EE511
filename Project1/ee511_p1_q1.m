% Date : January 15 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #1 - Coin Flips
% Question 1 : Tossing a fair coin 50 times. Count the no of heads and
% record the longest run of heads. Generate a histogram for the Bernoulli
% outcomes


clc;
clear all;
No_of_tosses = 50;                      % No of tosses as given
track_head = 0;                         % Initialise the tracking of heads count to 0
count(1,No_of_tosses+1) = 0;            % Initialise a counter to count the head run lengths
Outcomes = rand(1,No_of_tosses) > 0.5;  % Generate random numbers between [0,1] where numbers > 0.5 are Heads and < 0.5 are Tails
No_of_heads = sum(Outcomes);            % Calculate no of Heads
for i = 1:1:No_of_tosses;               
       if Outcomes(i) == 0;             
          track_head = 0;  
       else                             % Count continuous Heads
          track_head = track_head + 1; 
       end
       
       count(i) = track_head;           % Record all continuous Head lengths     
end
Longest_run_heads = max(count);         % Find the longest run of heads
display('Outcomes are : ');
disp(Outcomes);
display('Number of heads : ');
disp(No_of_heads');
display('Longest run of heads is : ');
disp(Longest_run_heads);
figure(1);
hist(Outcomes,2);
title(['The histogram for the Bernoulli outcomes of a fair coin tossed ',(num2str(No_of_tosses)),' times']);
xlabel('Bernoulli Outcomes - Head (>0.5) Tail (<0.5)');
ylabel('Frequency');
















