%%Alapti Sai Varun
%%1410110037
%%Discussed :
%% 
clc;
clear all;
close all;
%% 1 	Construct a Cosine transformation matrix C of size N×N, by using the sequence?  s?_k [n]=2 cos?(?k(2n+1)/2N),0?n?N-1,0?k?N-1 . Where the first row of the matrix is?  s?_0 [n],0?n?N-1 , second row is? s?_1 [n],0?n?N-1, similarly N^th row is? s?_(N-1) [n],0?n?N-1. 
N=4;

for n=0:1:N-1
    for k=0:1:N-1
        C(n+1,k+1)=2*cos((pi*k*((2*n)+1))/(2*N));
    end
end
%% 2nd  	Verify the condition that CC^T=NI, where I is an Identity matrix.  If the condition is satisfied then, C^(-1)=1/N C^T
Con= C*C'; % C*C' = NICondition is not satisfied
%% 3rd     	Consider a N= 4 length input sequence x[n] (the example you have done in class) and compute the Cosine transformation coefficients X_DCT [K] using  X_DCT [K]=Cx[n]. Then from the obtained coefficients compute the inverse transformation, using x[n]=C^(-1) X[K].


I=[1,2,3,4]; 
CT=C.'*I'; % Calculated Cosine transform of Input matrix  
ICT=inv(C.')*CT; %Calculated inverse Cosine transform of cosine Tranpose matrix got same input value
 
%% 4	 Generate a 2N length sequence y[n]= {?(x[n],                    0?n?N-1@x[2N-1-n],         N?n?2N-1      )?and compute its DFT (using previous lab3 code), and multiply the obtained DFT coefficients with?  W?_2N^(k/2)  ,0?k?2N-1. Consider the first N coefficients and compare this with the DCT coefficients obtained in question 3, and write your observations.
ID=I;
for i=N+1:1:2*N
    ID(1,i)=I(2*N-i+1);
end
for n=0:1:2*N-1
    for k=0:1:2*N-1
        D(n+1,k+1)=exp((2*pi*(-1)*1j*k*n)/(2*N));
    end
end

DFT=D*ID';
for i=0:1:N-1
    DCT(i+1,1)=DFT(i+1,1)*exp((pi*(-1)*1j*i)/(2*N));
end

%Compared with values got in question3, Both are same.
%% 5   	Repeat Question 1 and 2 for a normalized basis function
		
B=1/sqrt(2);
B=[B ones(1,N-1)];
for n=0:1:N-1
    for k=0:1:N-1
        C1(n+1,k+1)=sqrt(2/N)*B(k+1)*cos((pi*k*((2*n)+1))/(2*N));
    end
end
%% 5-2nd 
Con1= C1*C1.';
% It satisfies the condition C*CTransport = Identity Matrix.
%%  6.	Repeat Question 3 with the newly obtained transformation matrix in Question 5.
CTN=C1.'*I';  %Calculated Cosine transform of Input matrix 
ICTN=inv(C.')*CT; %Calculated inverse Cosine transform of cosine Tranpose matrix  and got same input value



