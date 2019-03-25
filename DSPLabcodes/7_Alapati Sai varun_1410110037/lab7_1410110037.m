%%Alapti Sai Varun
%%1410110037
%%Discussed :
%%
clc;
clear all;
close all;
%% Input
%xdata= input('Enter 1st Input Sequence: ');
% hData= input('Enter 2nd Input Sequence: ');
load noiseData.mat
h2Data=flip(noiseData);
xdata=[1 3 -2 1 2 -1 4 4 2];
hData=[2 -1 4 1 -2 3];
h1Data=flip(xdata);
%% Auto Corelation
[m,n]=size(xdata);
[a,b]=size(h1Data);
r = (2*n)-1;
H=zeros(r,n);
for i=1:n
    H(:,i)=[zeros(i-1,1);h1Data';zeros(r-(b+i-1),1)];
end
%% Cross Corelation
[a1,b1]=size(hData);
r = (n+b1)-1;
H1=zeros(r,n);
for i=1:n
    H1(:,i)=[zeros(i-1,1);hData';zeros(r-(b1+i-1),1)];
end
H=flip(H);
%%  Auto Corelation
[m1,n1]=size(noiseData);
r1 = (2*n1)-1;
H2=zeros(r1,n1);
for i=1:n1
    H2(:,i)=[zeros(i-1,1);h2Data';zeros(r1-(n1+i-1),1)];
end

%% Output
% 1st y=Hx
x=H*xdata';
y=H1*xdata';
z=H2*noiseData';

%% Plotting
figure(1);

axis=0:1:(n-1);
subplot(1,3,1);stem(axis,xdata);
axis=-(n-1):1:0;
subplot(1,3,2);stem(axis,h1Data);
axis=-(n-1):1:(n-1);
subplot(1,3,3);stem(axis,x);
%axis=-(n-1):1:(n-1);
%z=autocorr(xdata);
%subplot(1,8,7);stem(axis3,z);
figure(2);
axis=0:1:(n-1);
subplot(1,3,1);stem(axis,xdata);
axis=0:1:(b1-1);
subplot(1,3,2);stem(axis,hData);
axis=-(r-1)/2:1:(r-1)/2;
subplot(1,3,3);stem(axis,y);
%axis=-(r-1)/2:1:(r-1)/2;
%z1=xcorr(hData)
%subplot(1,8,8);stem(axis7,z1);
figure(3);
axis=0:1:(n1-1);
subplot(1,3,1);stem(axis,noiseData);
axis=-(n1-1):1:0;
subplot(1,3,2);stem(axis,h2Data);
axis=-(n1-1):1:(n1-1);
subplot(1,3,3);stem(axis,z);

peaks=findpeaks(z);
fprintf('We found the differne between two peak indices after max peak is 10. So periodicty is 10');
