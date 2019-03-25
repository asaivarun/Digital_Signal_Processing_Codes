function [w] = hwindow(a,N)
for i=0:1:N-1;
    w(i+1)=a-((1-a)*cos((2*pi*i)/(N-1)));
end