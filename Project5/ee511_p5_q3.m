clc;
clear all;
N = 100;
k = (2*N) + 1;
init_dist_a = zeros(1,k);       % Initial distribution for Case 1
init_dist_a(N+1) = 1;       

% Generate the Transition Matrix

P = zeros(2*N+1,2*N+1); 
for i = 1:2*N+1
    for j = 1:2*N+1
        P(i,j) = nchoosek(2*N,j-1)*((i-1)/(2*N))^(j-1)*(1-(i-1)/(2*N))^(2*N-j+1);
    end
end
n = 5000;                     % number of time steps to take
t = 0:n;                      % time indices
No_of_times = 100;
x_a = zeros(n+1,2*N+1);       % clear any old values       
x_a(1,:) = init_dist_a;       % generate first output value
i = 0;
while(No_of_times > 0)                
    for i=1:n,
        x_a(i+1,:) = x_a(i,:)*P;
    %a tolerance check to  automatically stop the simulation when the density is close to its steady-state
        LIT_a = ismembertol(x_a(i+1,:),x_a(i,:));
        if all(LIT_a == 1)     
            break;
        end
    end
    No_of_times = No_of_times - 1;
end

figure (1);
subplot(2,1,1);
plot(t,x_a);
title('Population?s genetic drift using a Markov chain simulation for Case 1');
xlabel('time');
ylabel('x(t)');

%For a different initial distribution

init_dist_b = zeros(1,k);           % Initial distribution for Case 2
init_dist_b(4) = 1;
n = 7000;  
t = 0:n;
x_b = zeros(n+1,2*N+1);         
No_of_times = 100;
x_b(1,:) = init_dist_b;
i = 0;
while(No_of_times > 0)
    for i=1:n,
        x_b(i+1,:) = x_b(i,:)*P;
        LIT_b = ismembertol(x_b(i+1,:),x_b(i,:));
        if all(LIT_b == 1)     
            break;
        end
    end
    No_of_times = No_of_times - 1;
end
 
subplot(2,1,2);
title('Population?s genetic drift using a Markov chain simulation for Case 2');
plot(t,x_b);
xlabel('time');
ylabel('x(t)');

% The Perron?Frobenius theorem

a = zeros(n+1,2*N+1);
b = zeros(n+1,2*N+1);
Pt = transpose(P);
for i = 1:n
    a(i,:) = x_b(i,:) * P;
end
for i = 1:n
    for j = 1:n
        b(j,:) = x_b(j,:) * Pt; 
    end
end

if a == b
    display('Follows the assertions of the Perron-Frobenius theorem');
else 
    display('Hence defies the assertions of the Perron-Frobenius theorem');
end


% The Markov chain Ergodic theorem

Y = zeros(n+1,2*N+1); 
Pn = P ^ N;
X = x_b(1,:);
Y = X * Pn;
if Y == X
    display('Follows assertions of Markov chain Ergodic theorem');
else
    display('Hence defies assertions of Markov chain Ergodic theorem');
end
