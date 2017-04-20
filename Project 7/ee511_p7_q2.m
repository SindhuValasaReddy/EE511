% Date : April 20 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #7 - Expectation Maximization
% Question 2

clc;
clear all; 
close all; 
N=1000;
X=zeros;
k=1;
l=1;
for i=1:N
    u=rand();
    if(u<=0.4)                     % Choose distribution 1 40% of the time
    u1(k)=normrnd(-1,1);
    X(i)=u1(k);
    k=k+1;
    else
    u2(l)=normrnd(1,1);            % Choose distribution 2 60% of the time
    X(i)=u2(l);
    l=l+1;
    end
end
figure(1);
histogram(u1);
hold on;
histogram(u2);
xlabel('Range of fx');
ylabel('Frequency');
title('PDFs of distributions overlaid on each other');
legend('N(-1,1)','N(1,1)');
figure(2); yyaxis left
histogram(X,50);
xlabel('Range of X');
ylabel('Frequency');
title('Theoretical PDF of X overlaid on the Histogram of X');
figure(2); 
yyaxis right;
r=[-5:0.1:5];
u_theo1=normpdf(r,-1,1);
u_theo2=normpdf(r,1,1);
u_theo=(u_theo1.*0.4)+(u_theo2.*0.6);
plot(r,u_theo);

