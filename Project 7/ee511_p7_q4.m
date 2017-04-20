% Date : April 20 2017
% Name : Sindhu Valasa Reddy
% USC ID : 8047774699
% Email : valasare@usc.edu
% EE 511 : Project #7 - Expectation Maximization
% Question 4

clc;
clear all; 
close all; 
Maximum_Data = 272;
Sources = 2;
Cluster1_RowIndex= 1;
Cluster2_RowIndex= 1;
Eruption_Time= [3.600 1.800 3.333 2.283 4.533 2.883 4.700 3.600 1.950 4.350 1.833 3.917 4.200 1.750 4.700 2.167 1.750 4.800 1.600 4.250 1.800 1.750 3.450 3.067 4.533 3.600 1.967 4.083 3.850 4.433 4.300 4.467 3.367 4.033 3.833 2.017 1.867 4.833 1.833 4.783 4.350 1.883 4.567 1.750 4.533 3.317 3.833 2.100 4.633 2.000 4.800 4.716 1.833 4.833 1.733 4.883 3.717 1.667 4.567 4.317 2.233 4.500 1.750 4.800 1.817 4.400 4.167 4.700 2.067 4.700 4.033 1.967 4.500 4.000 1.983 5.067 2.017 4.567 3.883 3.600 4.133 4.333 4.100 2.633 4.067 4.933 3.950 4.517 2.167 4.000 2.200 4.333 1.867 4.817 1.833 4.300 4.667 3.750 1.867 4.900 2.483 4.367 2.100 4.500 4.050 1.867 4.700 1.783 4.850 3.683 4.733 2.300 4.900 4.417 1.700 4.633 2.317 4.600 1.817 4.417 2.617 4.067 4.250 1.967 4.600 3.767 1.917 4.500 2.267 4.650 1.867 4.167 2.800 4.333 1.833 4.383 1.883 4.933 2.033 3.733 4.233 2.233 4.533 4.817 4.333 1.983 4.633 2.017 5.100 1.800 5.033 4.000 2.400 4.600 3.567 4.000 4.500 4.083 1.800 3.967 2.200 4.150 2.000 3.833 3.500 4.583 2.367 5.000 1.933 4.617 1.917 2.083 4.583 3.333 4.167 4.333 4.500 2.417 4.000 4.167 1.883 4.583 4.250 3.767 2.033 4.433 4.083 1.833 4.417 2.183 4.800 1.833 4.800 4.100 3.966 4.233 3.500 4.366 2.250 4.667 2.100 4.350 4.133 1.867 4.600 1.783 4.367 3.850 1.933 4.500 2.383 4.700 1.867 3.833 3.417 4.233 2.400 4.800 2.000 4.150 1.867 4.267 1.750 4.483 4.000 4.117 4.083 4.267 3.917 4.550 4.083 2.417 4.183 2.217 4.450 1.883 1.850 4.283 3.950 2.333 4.150 2.350 4.933 2.900 4.583 3.833 2.083 4.367 2.133 4.350 2.200 4.450 3.567 4.500 4.150 3.817 3.917 4.450 2.000 4.283 4.767 4.533 1.850 4.250 1.983 2.250 4.750 4.117 2.150 4.417 1.817 4.467];
Eruption_Waiting_time= [79 54 74 62 85 55 88 85 51 85 54 84 78 47 83 52 62 84 52 79 51 47 78 69 74 83 55 76 78 79 73 77 66 80 74 52 48 80 59 90 80 58 84 58 73 83 64 53 82 59 75 90 54 80 54 83 71 64 77 81 59 84 48 82 60 92 78 78 65 73 82 56 79 71 62 76 60 78 76 83 75 82 70 65 73 88 76 80 48 86 60 90 50 78 63 72 84 75 51 82 62 88 49 83 81 47 84 52 86 81 75 59 89 79 59 81 50 85 59 87 53 69 77 56 88 81 45 82 55 90 45 83 56 89 46 82 51 86 53 79 81 60 82 77 76 59 80 49 96 53 77 77 65 81 71 70 81 93 53 89 45 86 58 78 66 76 63 88 52 93 49 57 77 68 81 81 73 50 85 74 55 77 83 83 51 78 84 46 83 55 81 57 76 84 77 81 87 77 51 78 60 82 91 53 78 46 77 84 49 83 71 80 49 75 64 76 53 94 55 76 50 82 54 75 78 79 78 78 70 79 70 54 86 50 90 54 54 77 79 64 75 47 86 63 85 82 57 82 67 74 54 83 73 73 88 80 71 83 56 79 78 84 58 83 43 60 75 81 46 90 46 74];
Eruption_Time= Eruption_Time.';

% Storing the Eruption Time and Eruption waiting time in 2 columns %
for Row_Index = 1:Maximum_Data
    EruptionTime_WaitingTime_Merged(Row_Index,1)= Eruption_Time(Row_Index);
    EruptionTime_WaitingTime_Merged(Row_Index,2)= Eruption_Waiting_time(Row_Index);
end   

% This is the raw plot of the data points of the eruption time and the waiting times %
figure(1);
subplot(2,2,1);
[Clustered_data,Estimated_KMEAN]= kmeans(EruptionTime_WaitingTime_Merged,Sources); 
plot(EruptionTime_WaitingTime_Merged(:,1), EruptionTime_WaitingTime_Merged(:,2), 'k*');
title('Raw data of Waiting time for eruptions vs Eruption duration');
xlabel('Waiting time for Eruption in minutes');
ylabel('Eruption Duration in minutes');

% The scattered plot of the two clusters specifying the centroids %
subplot(2,2,2);
plot(EruptionTime_WaitingTime_Merged(Clustered_data==1,1),EruptionTime_WaitingTime_Merged(Clustered_data==1,2), 'x');
hold on
plot(EruptionTime_WaitingTime_Merged(Clustered_data==2,1),EruptionTime_WaitingTime_Merged(Clustered_data==2,2), 'o');
plot(Estimated_KMEAN(1,1),Estimated_KMEAN(1,2), 'rx','LineWidth',2); % Plotting the estimated mean for Cluster 1
plot(Estimated_KMEAN(2,1),Estimated_KMEAN(2,2), 'rx','LineWidth',2); % Plotting the estimated mean for Cluster 2
legend('Data points of Cluster 1','Data points of cluster 2');
title('The Data points(k-means()) clustered according to distribution');
hold off

% Seperating the clustered data into a matrix to pass it as an argument for gmdistribution.fit() to calculate the pdf parameters using EM approach %
for Row_Index = 1:Maximum_Data
    if(Clustered_data(Row_Index,1)==1)
        Cluster1(Cluster1_RowIndex,1)= EruptionTime_WaitingTime_Merged(Row_Index,1);
        Cluster1(Cluster1_RowIndex,2)= EruptionTime_WaitingTime_Merged(Row_Index,2);
        Cluster1_RowIndex= Cluster1_RowIndex+1;
    elseif(Clustered_data(Row_Index,1)==2)
        Cluster2(Cluster2_RowIndex,1)= EruptionTime_WaitingTime_Merged(Row_Index,1);
        Cluster2(Cluster2_RowIndex,2)= EruptionTime_WaitingTime_Merged(Row_Index,2);
        Cluster2_RowIndex= Cluster2_RowIndex+1;
    end
end

Input_Matrix_GMM= [Cluster1;Cluster2];

% Overlaying the scatter plot on the contour plot generated by EM Approach %
subplot(2,2,3);
hold on
scatter(Cluster1(:,1),Cluster1(:,2),10,'g.');
hold on 
scatter(Cluster2(:,1),Cluster2(:,2),10,'b.');
hold on
opt = statset('Display','final');
% To calculate the PDF parameters using EM approach %
Expectation_Max = gmdistribution.fit(Input_Matrix_GMM,Sources,'Options',opt);
ezcontour(@(x,y)pdf(Expectation_Max,[x y]),[0,7],[40,100]);
title('Scatter plot after convergence through Expectation Maximization'); xlabel('Range of X');
ylabel('Range of Y');
hold off

% To calculate the 3D plot of the the GMM % 
subplot(2,2,4);
pdf(Expectation_Max,Input_Matrix_GMM);
ezsurf(@(x,y)pdf(Expectation_Max,[x y]),[0,7],[40 100]);
