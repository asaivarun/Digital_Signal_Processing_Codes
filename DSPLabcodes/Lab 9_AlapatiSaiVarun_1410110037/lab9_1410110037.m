%%Alapti Sai Varun
%%1410110037
%%Discussed : Sumanth Kakani 
%%
clc;
clear all;
close all;
%% 	The one-dimensional signal used for the comparison is any row/column of the 512×512 image called “Goldhill” (given by TA). Use the keyword “imread” to read an image in MATLAB.	The one-dimensional signal used for the comparison 	The one-dimensional signal used for the comparison is any row/column of the 512×512 image called “Goldhill” (given by TA). Use the keyword “imread” to read an image in MATLAB.is any row/column of the 512×512 image called “Goldhill” (given by TA). Use the keyword “imread” to read an image in MATLAB.
I = imread('goldhill.png');
A=double(I(:,36));
%% 2.	Then use the previous lab codes to compute DCT/DFT coefficients of the signal. While calculating the DCT, use the DCT matrix which is not satisfying the unitary property
N=512;
for n=0:1:N-1
    for k=0:1:N-1
        C(n+1,k+1)=2*cos((pi*k*((2*n)+1))/(2*N));
        D(n+1,k+1)=exp((2*pi*(-1)*1j*k*n)/(N));
    end
end
DCT=C.'*A;
DFT=D.'*A;
gDCT=[];
gDFT=[];
%% Now vary the L values form 101 to 500, for each value of L reconstruct the signal from the newly obtained DCT/DFT Coefficients. Then calculate the mean squared error between the original signal and the reconstructed signal.

for L=101:2:500
    mDCT=zeros(N,1);
    mDFT=zeros(N,1);
    for n=0:1:N-L-1
        mDCT(n+1,1) = DCT(n+1,1);
    end
    for n=0:1:((N-L-1)/2)
        mDFT(n+1,1) = DFT(n+1,1);
    end
    for n=((N+L+1)/2):1:N-1
        mDFT(n+1,1) = DFT(n+1,1);
    end
    iDFT=inv(D.')*mDFT;
    iDCT=inv(C.')*mDCT;
    eDCT=abs(A-iDCT).^2;
    gDCT=[gDCT ((sum(eDCT))/N)];
    eDFT=abs(A-iDFT).^2;
    gDFT=[gDFT ((sum(eDFT))/N)];
end
%% 	Plot mean square error vs. L, and write your observations on the graph obtained by using DFT and DCT.
plot(gDFT); hold on 
plot(gDCT);
legend('DFT error','DCT error');

