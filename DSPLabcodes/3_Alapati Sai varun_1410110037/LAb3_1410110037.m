%%Alapti Sai Varun
%%1410110037
%%Discussed :
%%
clc;
clear all;
close all;
%% creating D
N=50;

for n=0:1:N-1
    for k=0:1:N-1
        D(n+1,k+1)=exp((2*pi*1j*k*n)/N);
    end
end
%% checking othognal or not

for k=1:1:N
    
    for n=1:1:N
        orthg(k,n)=(ctranspose(D(:,k))*D(:,n));
       
    end   
end
%% 3rd Verifying 
I=inv(D)*D;
Dh = D';
Num=D*Dh;
%% 4th
Nm=[1 -1 1 -1];
N=4;
for n=0:1:N-1
    for k=0:1:N-1
        D4(n+1,k+1)=exp((2*pi*1j*k*n)/N);
    end
end

Xk4= D4'*Nm.';
k=0:1:N-1;
subplot(2,1,1);
stem(k,Xk4);
Xn4=(D4*Xk4)/N;

%% 5th
load inputData;
Xk= Dh*inputData.';
N=50;
Xn=(D*Xk)/N;
k=0:1:N-1;
subplot(2,1,2);
stem(k,Xk);




