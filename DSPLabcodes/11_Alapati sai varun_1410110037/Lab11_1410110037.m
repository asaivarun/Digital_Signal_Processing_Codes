%%Alapti Sai Varun
%%1410110037
%%Discussed:Sumanth kakani
%% 
clc;
clear all;
close all;
%% 	converting the analog filter with system function H_a (s)=(s+1)/((s+0.1)^2+16) Into a  digital filter by means of the bilinear transformation. 

a=[1 1];
b=[1 0.2 16.01];
w=-10:0.5:10;
S=freqs(a,b,w);
M1=abs(S);
P1=phase(S);
figure(1);
subplot(2,2,1);
%1b.	Plot the magnitude response of the analog filter (use the Matlab keyword: freqs)
plot(w,M1);
%subplot(3,2,3);
%plot(w,P1);
Sp=tf(a,b);
subplot(2,2,2);
%1a.	Plot the pole zero locations of the analog filter(use the Matlab keyword:pzmap)
pzmap(Sp);

c=[5 2 -3];
d=[32.81 0.02 31.21];
%w1=-pi:0.5:pi;
[Z w1]=freqz(c,d);
M2=abs(Z);
P2=phase(Z);
subplot(2,2,3);
plot(w1,M2);
%subplot(3,2,4);
%plot(w1,P2);
subplot(2,2,4);
% 1c.	Plot the pole zero locations of the digital filter (use the Matlab keyword: zplane)
zplane(c,d);
%% 2.	convert the analog filter with system function H_a (s)=(1/s) Into a  digital filter by means of the bilinear transformation. 

a1=[1 ];
b1=[1 0];
w=-10:0.5:10;
S1=freqs(a1,b1,w);
M3=abs(S1);
P3=phase(S1);
figure(2);
subplot(2,2,1);
%b.	Plot the magnitude response of the analog filter (use the Matlab keyword: freqs)
plot(w,M3);
%subplot(3,2,3);
%plot(w,P3);
Sp1=tf(a1,b1);
subplot(2,2,2);
%2 a.	Plot the pole zero locations of the analog filter(use the Matlab keyword:pzmap)
pzmap(Sp1);

c1=[1 1];
d1=[10 -10];
%w1=-pi:0.5:pi;
[Z1 w1]=freqz(c1,d1);
M4=abs(Z);
P4=phase(Z);
subplot(2,2,3);
%1d.	Plot the magnitude response of the analog filter (use the Matlab keyword: freqz)
plot(w1,M4);
%subplot(3,2,4);
%plot(w1,P4);
subplot(2,2,4);
%2c.	Plot the pole zero locations of the digital filter (use the Matlab keyword: zplane)
zplane(c1,d1);
