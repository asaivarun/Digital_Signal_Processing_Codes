function [w] = bartletwindow(N)
for i=0:1:N-1;
    if(i<=(N-1)/2)
        w(i+1)=((2*i)/(N-1));
    else
        w(i+1)=2-((2*i)/(N-1));
    end    
end