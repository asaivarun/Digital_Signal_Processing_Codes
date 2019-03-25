%%Alapti Sai Varun
%%1410110037
%%Discussed :
%%
clc;
clear all;
close all;
%% Input
load xdata.mat;
load hData.mat;
%% Algorithm Method
[m,n]=size(xdata);
[a,b]=size(hData);
r = (n+b)-1;
H=zeros(r,n);
for i=1:n
    H(:,i)=[zeros(i-1,1);hData';zeros(r-(b+i-1),1)];
end
Xdata=zeros(m,n);
for i=0:(n-1)
    Xdata(1,i+1)=xdata(1,n-i);
end
r1 = (2*n)-1;
H1=zeros(r1,n);
for i=1:n
    H1(:,i)=[zeros(i-1,1);Xdata';zeros(r1-(n+i-1),1)];
end
%% Output
% 1st y=Hx
y=H*xdata'
%2nd  
q2=H'*y
% 3rd
q3=inv(H'*H)
%4th
x1=q3*q2;
dif=abs(x1-xdata');
q4=dif'*dif
%5th
y1=H1*xdata'
%% Plotting
figure(1);
subplot(1,3,1);plot(xdata);
subplot(1,3,2);plot(hData);
subplot(1,3,3);plot(y);
figure(2);
subplot(1,3,1);plot(xdata);
x=-n:1:-1;
subplot(1,3,2);plot(x,Xdata);
x1=-n:1:n-2;
subplot(1,3,3);plot(x1,y1);