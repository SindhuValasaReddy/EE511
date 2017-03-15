
clc;
clear all;
mean=1/25;
t=0;
NA=0;                                   % Number of arrivals
ND=0;                                   % Number of deppartures
n=0;
i=1;
T=100;
Ts=0;
A=0;
D=0;
break_duration=0;
total_break=0;
[ta,Ts]=generate_Ts(T,Ts);              % Function to generate arrival time and inter arrival time
break_time=ta;
td=inf;                                 % Departure time
while ta<=T                             % Simulate for first 100 hours 
    if ta<=td &&ta<=T                   % Case1:if arrival is before departure
        t=ta;
        NA=NA+1;                        % update counter for number of arrivals
        n=n+1;
        x(1,NA+ND)=t;
        x(2,NA+ND)=n;
        [ta,Ts]=generate_Ts(T,Ts);      % calculate arrival and inter arrival time
        if n==1
            td=break_time+exprnd(mean);  % calculate break time
        end
            A(NA)=t;                    % calculate arrival rate
    elseif ta>td && td<=T               % Case2:if arrival is after departure
        t=td;
        n=n-1;
        ND=ND+1;
        x(1,NA+ND)=t;
        x(2,NA+ND)=n;
        D(ND)=t;
        if n==0                         % if no jobs to serve take a break
            td=inf;
            break_time=t;
            while break_time<ta
                break_duration=0.3*rand;
                break_time=break_time+break_duration;
                total_break=total_break+break_duration;
            end
        else
            td=t+exprnd(mean);
        end
    end
end
    

while min(ta,td)>T&& n>0               % Case3:arrival or departure time > 100 and jobs present
    t=td;
    n=n-1;
    ND=ND+1;
    td=t+exprnd(mean);
    D(ND)=t;
    x(1,NA+ND)=t;
    x(2,NA+ND)=n;
end
if n==0 && min(ta,td)>T                % Case4:when no jobs present and arriavl or departure time > 100
    Tp=max(T-t,0);                     % Collect output data
end

figure(1);
stairs([0 x(1,:)],[0 x(2,:)],'linewidth',1.5);
xlim([0 T]);
title('Number of jobs and subsequent arrival times during the 1st 100 hours');
xlabel('First 100 hours');
ylabel('Number of jobs');
display('The expected amount of time server is on break in hours');
disp(total_break);









