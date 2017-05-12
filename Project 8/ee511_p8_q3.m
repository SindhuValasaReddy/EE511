% Date : May 10 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #8 - Markov Chain Monte Carlo
% Question 3


clc;
clear all;
close all;
% Generate a row vector of 100 linearly equally spaced points between -500 and 500
x1 = linspace(-500,500); 
x2 = linspace(-500,500);
% Obtain 100x100 pairs of points in matrix form from vectors x and y
[X1,X2] = meshgrid(x1,x2);  
Z=418.9829*2 - (X1.*sin(sqrt(abs(X1))) + X2.*sin(sqrt(abs(X2))));  
figure(1);
contour(X1,X2,Z); % Plot a contour plot
colorbar;
title('Contour plot');
figure(2)
mesh(X1,X2,Z); % Plot a mesh plot
colorbar;
title('Mesh plot');
xlim([-500 500]);
ylim([-500 500]);
n=50;
T_o=100;
x_t=zeros(n);
y_t=zeros(n);
x_t_star=zeros(n);
y_t_star=zeros(n);
itr=1;

while (itr<n)
x_t_star(itr+1)=x_t(itr)+normrnd(0,10);
y_t_star(itr+1)=y_t(itr)+normrnd(0,10);
value=compute(x_t_star(itr+1),y_t_star(itr+1))-compute(x_t_(itr),y_t(itr));
alpha=exp(value);
if value<=0

end
x_t(itr+1)=x_t_star(itr+1);
y_t(itr+1)=y_t_star(itr+1);
T(itr+1) = alpha * T_o/log(itr+1);
end