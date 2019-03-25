%%Alapti Sai Varun
%%1410110037
%%Discussed:Sumanth kakani
%% 
clc;
clear all;
close all;
%% Algorithm
N1=4;
h1=ones(1,N1);
wc=pi/4;
N2=30;
for i=-N2:1:N2
    if i==0
        h2(i+1+N2)=wc/pi;
    else
        h2(i+1+N2)=wc*(sin(wc*i))/(pi*wc*i);
    end
end

% Find Magnitude and Phase response of above LTI systems.
figure(1);

[H1 w]=freqz(h1);
subplot(2,2,1)
plot(w,abs(H1));
subplot(2,2,2)
plot(w,phase(H1));

[H2 w]=freqz(h2);
subplot(2,2,3)
plot(w,abs(H2));
subplot(2,2,4)
plot(w,phase(H2));
%% Generalized windows
N=61;
a1=0.54;
% Hamming window  is Generalized  Hamming window with ?=0.54
Hw=hwindow(a1,N);
a2=0.5;
% Hanning window  is Generalized Hamming window with ?=0.5
Hw1=hwindow(a2,N);
% Bartlet window
Baw=bartletwindow(N);
% Blackman window
Blw=blackmanwindow(N);
%% plotting

[H3 w]=freqz(Hw);
[H4 w]=freqz(Hw1);
[BAW w]=freqz(Baw);
[BLW w]=freqz(Blw);
figure;
subplot(2,1,1)
plot(w,abs(H3),'-r',w,abs(H4),'-b',w,abs(BAW),'-g',w,abs(BLW),'-y')
legend('Mag Hamming W ','Mag Hanning W ','Mag Barlet W','Mag Blackman W ')

subplot(2,1,2)
plot(w,phase(H3),'-r',w,phase(H4),'-b',w,phase(BAW),'-g',w,phase(BLW),'-y')
legend('Phase Hamming W ','Phase Hanning W ','Phase Barlet W','Phase Blackman W ')

%% Calculate the frequency response of ? h?_3^| [n] by considering each window function w[n]defined in 1(b).
h3=h2;
h3cHw=h3.*Hw;
h3cHw1=h3.*Hw1;
h3cBaw=h3.*Baw;
h3cBlw=h3.*Blw;

[h3cH3 w]=freqz(h3cHw);
[h3cH4 w]=freqz(h3cHw1);
[h3cBAW w]=freqz(h3cBaw);
[h3cBLW w]=freqz(h3cBlw);
figure;
subplot(2,1,1)
plot(w,abs(h3cH3),'-r',w,abs(h3cH4),'-b',w,abs(h3cBAW),'-g',w,abs(h3cBLW),'-y')
legend('Mag Hamming W h3','Mag Hanning W h3','Mag Barlet W h3','Mag Blackman W h3')

subplot(2,1,2)
plot(w,phase(h3cH3),'-r',w,phase(h3cH4),'-b',w,phase(h3cBAW),'-g',w,phase(h3cBLW),'-y')
legend('Phase Hamming W h3','Phase Hanning W h3','Phase Barlet W h3','Phase Blackman W h3')
%% 2-b State your observations and conclusions for the above operations?
%After obversing the four Magnitude plots, I observed that Hamming Window applied plot has less ripples and more elegant  compared to others. So this is better filter for this Function.
