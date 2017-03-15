
function[t,Ts]= generate_Ts(T,Ts)
t=Ts;
lambda=20;
while(t<T)
    u1 = rand();                            %Generate random number [0,1]
    t = t-log(u1)/lambda;                   %Obtain arrival time using inverse transform method
    u2 = rand();
    if mod(t,10)<=5
        t1=mod(t,10);
        if u2 <= (mod(4+3*t1,10)/lambda)    
            Ts = t;                         %Calculate inter arrival time
            break;
        end
    else 
        t1=mod(t,10);
        if u2 <= (mod(19-3*(t1-5),10)/lambda)
            Ts = t;
            break;
        end
    end    
end
end