function [ N1 ] = popbuffer ( N1 )
 %% if the number of packets in the buffer > 1 then pop one
%%packet out
 %% if number <= 1 then number becomes 0 after pop
 if(N1>1)
 N1 = N1 - 1;
 else
 N1 = 0;
 end
end