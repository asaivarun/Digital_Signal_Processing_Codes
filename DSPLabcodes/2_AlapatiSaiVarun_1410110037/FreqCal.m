function [Xejw w] = FreqCal(x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
w =-pi:pi/100:pi
Xejw = 0;
for ii= 1:length(x)
Xejw = Xejw + x(ii)*exp(-j*w*(ii-1));
end
end

