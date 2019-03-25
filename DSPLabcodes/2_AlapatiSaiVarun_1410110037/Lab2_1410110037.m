%%Alapti Sai Varun
%%1410110037
%%Discussed :
%%
clc;
clear all;
close all;
%% creating sin
f=50;
n=0:0.1/49:0.1
y=sin(2*pi*f*n);
subplot(3,2,1);
stem(n,y); %% discrete 
%% Upsampling by 3
 us=3;
 up=zeros(1,us*f);
 j=1;
for i=1:us*f
    if mod(i,us) == 1
        up(1,i) = n(1,j);
        j=j+1;
    end
end
yup=sin(2*pi*f*up);
subplot(3,2,3);
n1=0:0.1/(length(yup)-1):0.1
stem(n1,yup);
%% DownSampling by 3
 ds=3;
 do=[];
 k=1;
for i=1:f
    if mod(i,ds) == 1
        do(1,k) = n(1,i);
        k=k+1;
    end
end
ydo=sin(2*pi*f*do);
subplot(3,2,5);
n2=0:0.1/(length(ydo)-1):0.1
stem(n2,ydo);
w =-pi:pi/100:pi;
subplot(3,2,2);
stem(w,abs(FreqCal(y)));
subplot(3,2,4);
stem(w,abs(FreqCal(yup)));
subplot(3,2,6);
stem(w,abs(FreqCal(ydo)));
     