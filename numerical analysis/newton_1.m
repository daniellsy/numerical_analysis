clear;clc;
x0=0.5;N=15;k=1;
while k<=N
f1=x0*exp(x0)-1;
f2=(x0+1)*exp(x0);
x1=x0-f1/f2;
if abs(x1-x0)<0.5*10^(-5)
    break
end
k=k+1;
x0=x1;
end
x=x1;