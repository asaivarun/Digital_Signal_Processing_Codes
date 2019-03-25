%%Alapti Sai Varun
%%1410110037
%%Discussed : Sumanthkakani (1410110179)
%%
clc;
clear all;
close all;
%% Input
xdata= [1  2  0  1 ];
hData =[2  2  1  1 ] ;
%% 1st Question :	Computing the 4-point circular convolution between the given two sequences g[n]  and h[n], using matrix method. Let g[n]={1  2  0  1 }  and h[n]={2  2  1  1}.

[m,n]=size(xdata);
[a,b]=size(hData);
H(:,1)=hData';
for i=2:n
    H(:,i)=[(hData(n+2-i:n)');(hData(1:n+1-i))'];
end
H
Y=H*xdata'

%% 2nd Question  :	Verifying the above result using DFT based method
for i=0:1:n-1
    for j=0:1:n-1
        D(i+1,j+1)=exp((2*pi*1j*j*i)/n);
    end
end
DH=D';
DTFTx=DH*xdata.';
DTFTh=DH*hData.';
DTFTY=DTFTx.*DTFTh;

iDTFT1 =(D*DTFTY)/n

%% 3rd Question : Computing the linear convolution between above two sequences using circular convolution


xdata = [xdata zeros(1,b-1)];
hData =[hData zeros(1,b-1)];
[m,n]=size(xdata);
[a,b]=size(hData);
HLin(:,1)=hData';
for i=2:n
    HLin(:,i)=[(hData(n+2-i:n)');(hData(1:n+1-i))'];
end
HLin
Y=HLin*xdata'

