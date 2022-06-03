clear;clc;
a=1;b=2;k=1;
while (b-a)>0.5*10^(-5)
c=(a+b)/2;
fc=sin(c)-c^2/2;
fa=sin(a)-a^2/2;
if fa*fc>0
    a=c;
else
    b=c
end
k=k+1;
end
c=(a+b)/2;