clc, clear all
%% Load Module
[F,P] = uigetfile('*.jpg','Select the JPG image file');
FullPath=[P,F];
imdata=imread(FullPath);
%% Encrypt Module
d=datetime('today');
d=datenum(d);
d=datestr(d);
seed=str2num(d(1:2));
seedP=abs(seed^4*seed^3-3*seed^5);
rng(seedP)