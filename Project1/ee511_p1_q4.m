% Date : January 15 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #1 - Coin No_of_tossess
% Question 4 : Tossing a fair coin and count the number of tosses until
% reaching a user specified positive number of heads


clc;
clear all;
No_of_heads = input('Enter number of heads : '); % User specified no of heads
track_head = 0;                                  % Counter to track heads     
No_of_tosses = 0;                                % Counter to count no of tosses
while 1
    Outcomes = rand() > 0.5;                     % Generate random numbers between [0,1] where numbers > 0.5 are Heads and < 0.5 are Tails
    No_of_tosses = No_of_tosses + 1;             % Count no of tosses
    if Outcomes == 1
        track_head = track_head + 1;             % Count continuous heads
        if track_head == No_of_heads             % Head length same as user specified value
            break;
        end
    else
        track_head = 0;
    end
end
display('The number of tosses are');
disp(No_of_tosses);