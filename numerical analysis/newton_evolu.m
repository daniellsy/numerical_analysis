clear;clc;
x0=0.52;N=15;k=1;
while k<=N
f1=(x0-1)^2*(2*x0-1);
f2=2*(x0-1)*(2*x0-1)+2*(x0-1)^2;
x1=x0-2*f1/f2;
if abs(x1-x0)<0.5*10^(-5)
    break
end
k=k+1;
x0=x1;
end
x=x1;