function [ N1, N2, Throughput ] = load_func ( p , casei )
 n_slot = 1000;
 P1 = rand(1,n_slot);
 P2 = rand(1,n_slot);
 R11 = rand(1,n_slot);
 R21 = rand(1,n_slot);
 pps = zeros(1,n_slot);             % Packets processed per slot
 Throughput=0;
 N1 = 0;                            % Number of packets in the buffer1
 N2 = 0;                            % Number of packets in the buffer2
 if ( casei == 1)

r = 0.5; 
 else
r = 0.75;
 end
   for i = 1:n_slot
%% CaseA that input1 & input2 both have packets
       if ( P1(i) < p && P2(i) < p)
%% Input1 switches to output1 & input2 switches to output2
          if(R11(i) < r && R21(i) > r)
             pps(i) = 2;
             [N1] = buf_out(N1);
             [N2] = buf_out(N2);
          end
%% Input1 switches to output1 & input2 switches to output2
          if(R11(i)>r && R21(i)>r)
             P_sel = rand(1);
%% Select packet with the same probability
             if(P_sel <= 0.5)
              pps(i) = 1;
              [N1] = buf_out(N1);
              [N2] = buf_in(N2);
             else
              pps(i) = 1;
              [N1] = buf_in(N1);
              [N2] = buf_out(N2);
             end
          end
%% Input1 switches to output2 & input2 switches to output1
          if(R11(i)>r && R21(i)<r)
             pps(i) = 2;
             [N1] = buf_out(N1);
             [N2] = buf_out(N2);
          end
%% Input1 switches to output1 & input2 switches to output1
          if(R11(i)<r && R21(i)<r)
             P_sel = rand(1);
             if(P_sel <= 0.5)
              pps(i) = 1;
              [N1] = buf_out(N1);
              [N2] = buf_in(N2);
             else
              pps(i) = 1;
              [N1] = buf_in(N1);
              [N2] = buf_out(N2);
             end
          end
end
%% CaseB that input1 have packet but input2 don't have
       if ( P1(i) < p && P2(i) > p)
           pps(i) = 1;
           [N1] = buf_out(N1);
       end
%% CaseC that input2 have packet but input1 don't have
       if ( P1(i) > p && P2(i) < p)
             pps(i) = 1;
             [N2] = buf_out(N2);
       end
%% CaseD that input1 & input2 both don't have packets
       if ( P1(i) > p && P2(i) > p)
             pps(i) = 0;
       end
   end
Throughput = sum(pps)/n_slot;
end




 
 