 clc;
 clear all;
 No_of_times = 10000;
 p = 0.5;
 casei = 1;                         % Casei = 1 when r = 0.5, Casei = 2 when r1 = 0.75, r2 = 0.25
 N1_pkt = zeros(1,No_of_times);
 N2_pkt = zeros(1,No_of_times);
 Throughput = zeros(1,No_of_times);
 for i=1:No_of_times
 [ N1_pkt(i), N2_pkt(i), Throughput(i) ] = load_func ( p ,casei );
 end
 Mean_N1_pkt = mean(N1_pkt);       % Calculate mean no of packets at 1 per slot
 Mean_N2_pkt = mean(N2_pkt);       % Calculate mean no of packets at 2 per slot
 th = mean(Throughput) * 100;      % Calculate throughput or processed packets per slot
 display('Mean of no of packets in buffer at input 1 per time slot');
 disp(Mean_N1_pkt);
 display('Mean of no of packets in buffer at input 2 per time slot');
 disp(Mean_N2_pkt);
 display('Throughput in %');
 disp(th);
 figure(1);
 subplot(4,1,1);
 A=0:1:5;
 [a,b]=hist(N1_pkt,A);
 bar(b,a);
 grid on;
 title('Histogram of the no of packets in the buffer at input 1');
 xlabel('Number of packets');
 ylabel('Frequency');
 subplot(4,1,2);
 A=0:1:5;
 [a,b]=hist(N2_pkt,A);
 bar(b,a);
 grid on;
 title('Histogram of the no of packets in the buffer at input 2');
 xlabel('Number of packets');
 ylabel('Frequency');
 subplot(4,1,3);
 A=0:1:5;
 [a,b]=hist(Throughput,A);
 bar(b,a);
 grid on;
 title('Histogram of the no of processed packets');
 xlabel('Number of packets');
 ylabel('Frequency');
 Mean_Throughput = mean(Throughput);
 subplot(4,1,4);
 A=unique(Throughput);
 Throughput_dist = histc(Throughput,A);
 a = Throughput_dist/sum(Throughput_dist);
 plot(A,a);
 grid on;
 title('Distribution of the no of packets processed per slot by the switch.');
 xlabel('PPS');
 ylabel('Frequency');


    

    
