clear;clc;
x0=1.8;N=4;k=1;
format long;
while k<=N
f1=5*x0/6+5/(6*x0^2);
f2=5*f1/6+5/(6*f1^2);
x1=(x0*f2-f1^2)/(x0-2*f1+f2);
if abs(x1-x0)<0.5*10^(-7)
    break
end
k=k+1;
disp(x1);
x0=x1;
end
x=x1;