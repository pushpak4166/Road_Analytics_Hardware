%% Preprocessing of collected dataset
% Author: Hrishikesh Ugale
% Contact: hrishikeshugle3331@gmail.com

%% Clearing the environment
clc;
clear all;
close all;

%% Reading and plotting raw data
smooth = csvread('smooth.csv');
medium = csvread('medium.csv');
bad = csvread('bad.csv');

figure;
subplot(3,1,1)
plot(smooth);
title('Smooth');

subplot(3,1,2)
plot(medium);
title('Medium');

subplot(3,1,3)
plot(bad);
title('Bad');

%% Backup of orignal data

s1 = 0.001*smooth;
s2 = 0.001*medium;
s3 = 0.001*bad;

%% Levelizing all paramters around zero
s1 = levelize(s1);
s2 = levelize(s2);
s3 = levelize(s3);

figure;
subplot(3,1,1)
plot(s1);
title('Smooth');

subplot(3,1,2)
plot(s2);
title('Medium');

subplot(3,1,3)
plot(s3);
title('Bad');

%% Normalizing values
    
%s1 = normalized(s1);
%s2 = normalized(s2);
%s3 = normalized(s3);

%figure;
%subplot(3,1,1)
%plot(s1);
%title('Smooth');

%subplot(3,1,2)
%plot(s2);
%title('Medium');

%subplot(3,1,3)
%plot(s3);
%title('Bad');

%% Filtering effect of noise

W = 10;

s1 = filtering(s1, W);
s2 = filtering(s2, W);
s3 = filtering(s3, W);

figure;
subplot(3,1,1)
plot(s1);
title('Smooth');

subplot(3,1,2)
plot(s2);
title('Medium');

subplot(3,1,3)
plot(s3);
title('Bad');

%% Derivative of values

Ts = 2;

s1 = derivative(s1, Ts);
s2 = derivative(s2, Ts);
s3 = derivative(s3, Ts);

figure;
subplot(3,1,1)
plot(s1);
title('Smooth');

subplot(3,1,2)
plot(s2);
title('Medium');

subplot(3,1,3)
plot(s3);
title('Bad');

%% Squaring

s1 = squaring(s1);
s2 = squaring(s2);
s3 = squaring(s3);

figure;
subplot(3,1,1)
plot(s1);
title('Smooth');

subplot(3,1,2)
plot(s2);
title('Medium');

subplot(3,1,3)
plot(s3);
title('Bad');

%% Saving processed dataset
% class 0 - s1 (smooth)
% class 1 - s2 (medium)
% class 2 - s3 (bad)

dataset = [];
bad_data = [];
medium_data = [];
good_data = [];

ptr = 1;
for i = 1:1:size(s1,1)
    dataset(ptr, :) = [s1(i,:), 0];
    good_data(i, :) = [s1(i,:), 0];
    ptr = ptr + 1;
end

for i = 1:1:size(s2,1)
    dataset(ptr, :) = [s2(i,:), 1];
    medium_data(i, :) = [s2(i,:), 1];
    ptr = ptr + 1;
end

for i = 1:1:size(s3,1)
    dataset(ptr, :) = [s3(i,:), 2];
    bad_data(i, :) = [s3(i,:), 2];
    ptr = ptr + 1;
end

sdataset = shuffle_data(dataset);

csvwrite('dataset3.csv',dataset);
csvwrite('dataset3s.csv',sdataset);
csvwrite('pro_good3.csv', good_data);
csvwrite('pro_med3.csv', medium_data);
csvwrite('pro_bad3.csv', bad_data);