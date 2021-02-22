%% Thresholding algorithm for zone prediction
% Author: Hrishikesh Ugale
% Contact: hrishikeshugle3331@gmail.com

%% Clearing the environment
clc;
clear all;
close all;

% Reading and plotting raw data
good = csvread('pro_good3.csv');
bad = csvread('pro_bad3.csv');

good = good(1:length(good)-1,:);
bad = bad(1:length(bad)-1,:);

good(:,size(good,2)) = 1;

mean_good = mean(good);
mean_bad = mean(bad);

Tset = [];
for i = 1:1:100
    T = (mean_good + mean_bad)/i;
    Tset(i,:) = T;
end

data = [good;bad];
acc = [];
ra = [];
ga = [];
for i = 1:1:length(Tset)
    T = Tset(i,:);
    [t, g, r] = apply_thres(data, T);
    acc = [acc, t];
    ra = [ra, r];
    ga = [ga, g];
end

plot(acc);
hold on;
plot(ra, 'r');
hold on;
plot(ga, 'g');
legend({'Overall Accuracy', 'Red Zone Accuracy', 'Green Zone Accuracy'})