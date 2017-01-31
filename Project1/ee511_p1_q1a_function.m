% Date : January 15 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu        
% EE 511 : Project #1 - Coin Flips
% User Defined Function which calculates and returns the number of heads in 50 flips
% when given the No of Trials of 50 flips


function No_of_heads = ee511_p1_q1a_function(No_of_trials) 
    Outcomes = rand(1, (No_of_trials*50)) > 0.5;                    % Generate random numbers between [0,1] where numbers > 0.5 are Heads and < 0.5 are Tails 
    No_of_heads = zeros(1,No_of_trials);
    start_from = 1;                                                 % Initialise start position of 50 flips
    end_at = 50;                                                    % Initialise end position of 50 flips
    trial_num = 1;
    for i=1:1:(No_of_trials);
         No_of_heads(trial_num) = sum(Outcomes(start_from:end_at)); % No of heads for 50 flips
         start_from = start_from + 50;                              
         end_at = end_at + 50;                                      
         trial_num = trial_num + 1;                                 % Start the next trial
    end
end    
    
            
            
            
    
    