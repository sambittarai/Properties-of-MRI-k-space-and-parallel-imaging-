clear all
close all
clc

%AR - Algebraic Reconstruction
%N - Number of iterations
%MSE - Mean Squared Error
%MSE_18 - Mean Squared Error for 18 projection image
%MSE_60 - Mean Squared Error for 60 projection image


original_image = importdata("original_image_128.mat");
Iteration = [1:10];


%% Reconstruction from 60 projection image
% Part D



AR_image_1 = importdata("128_60_N=1.mat"); 
AR_image_2 = importdata("128_60_N=2.mat");
AR_image_3 = importdata("128_60_N=3.mat");
AR_image_4 = importdata("128_60_N=4.mat");
AR_image_5 = importdata("128_60_N=5.mat");
AR_image_6 = importdata("128_60_N=6.mat");
AR_image_7 = importdata("128_60_N=7.mat");
AR_image_8 = importdata("128_60_N=8.mat");
AR_image_9 = importdata("128_60_N=9.mat");
AR_image_10 = importdata("128_60_N=10.mat");

MSE1 = immse(original_image,AR_image_1);
MSE2 = immse(original_image,AR_image_2);
MSE3 = immse(original_image,AR_image_3);
MSE4 = immse(original_image,AR_image_4);
MSE5 = immse(original_image,AR_image_5);
MSE6 = immse(original_image,AR_image_6);
MSE7 = immse(original_image,AR_image_7);
MSE8 = immse(original_image,AR_image_8);
MSE9 = immse(original_image,AR_image_9);
MSE10 = immse(original_image,AR_image_10);

%MSE_60 - mean squared error for 60 projection image
MSE_60 = [MSE1, MSE2, MSE3, MSE4, MSE5, MSE6, MSE7, MSE8, MSE9, MSE10];

disp("MSE_60 :");
disp(MSE_60);

figure(1);
plot(Iteration, MSE_60); %Plotting "Number of iterations" vs "MSE"
xlabel("Number of Iterations");
ylabel("MSE for 60 projection data");

%% Reconstruction from 18 projection image

AR_image_1 = importdata("128_18_N=1.mat");
AR_image_2 = importdata("128_18_N=2.mat");
AR_image_3 = importdata("128_18_N=3.mat");
AR_image_4 = importdata("128_18_N=4.mat");
AR_image_5 = importdata("128_18_N=5.mat");
AR_image_6 = importdata("128_18_N=6.mat");
AR_image_7 = importdata("128_18_N=7.mat");
AR_image_8 = importdata("128_18_N=8.mat");
AR_image_9 = importdata("128_18_N=9.mat");
AR_image_10 = importdata("128_18_N=10.mat");

MSE1 = immse(original_image,AR_image_1);
MSE2 = immse(original_image,AR_image_2);
MSE3 = immse(original_image,AR_image_3);
MSE4 = immse(original_image,AR_image_4);
MSE5 = immse(original_image,AR_image_5);
MSE6 = immse(original_image,AR_image_6);
MSE7 = immse(original_image,AR_image_7);
MSE8 = immse(original_image,AR_image_8);
MSE9 = immse(original_image,AR_image_9);
MSE10 = immse(original_image,AR_image_10);

MSE_18 = [MSE1, MSE2, MSE3, MSE4, MSE5, MSE6, MSE7, MSE8, MSE9, MSE10];
disp("MSE_18 :");
disp(MSE_18);

figure(2);
plot(Iteration, MSE_18); %Plotting "Number of iterations" vs "MSE"
xlabel("Number of Iterations");
ylabel("MSE for 18 projection data");


%%

%Plotting both the graph on the same plot
figure(3);
plot(Iteration, MSE_18, 'b');
hold on;
plot(Iteration, MSE_60, 'r');
xlabel("Number of Iterations");
ylabel("MSE");

