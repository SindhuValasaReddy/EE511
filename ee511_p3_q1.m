% Date : February 6 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #3 - Samples and Statistics
% Question 1 : A components manufacturer delivers a batch of 125 microchips to a parts distributor.  The distributor checks 
% for lot conformance by counting the number of defective chips in a random sampling (without replacement) 
% of the lot.  If the distributor finds any defective chips in the sample it rejects the entire lot.  Suppose that there 
% are six defective units in the lot of 125 microchips.  Simulate the lot sampling to estimate the probability that 
% the distributor will reject the lot if it tests five microchips.  What is the fewest number of microchips that the 
% distributor should test to reject this lot 95% of the time? 

clc;
clear all;

No_of_trials = 100;
No_of_chips_picked = 5;                                     % No of microchips picked
count_reject = 0;
for i=1:1:No_of_trials
    chosen_chips = randi(125,1,No_of_chips_picked);         % Choose microchips randomly between 1 and 125
    for i = 1:1:No_of_chips_picked
        if chosen_chips(i) < 7                              % Assuming samples 1 to 6 are defective
            count_reject = count_reject + 1;                % No of times the lot is rejected
            break;
        end
        
    end
end
prob_rejection = count_reject/No_of_trials;                 % Calculate P[rejection]
display('The number of trials are');
disp(No_of_trials);
display('The number of microchips picked');
disp(No_of_chips_picked);
display('The number of times the lot has been rejected');
disp(count_reject);
display('The probability of rejection');
disp(prob_rejection);


    
