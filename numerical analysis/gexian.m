clear;clc;
k=1;
x(1)=0.4;x(2)=0.6;N=15;
while k<=N
f1=x(k)*exp(x(k))-1;
f2=x(k+1)*exp(x(k+1))-1;
x(k+2)=x(k+1)-f2/(f2-f1)*(x(k+1)-x(k));
if abs(x(k+1)-x(k))<0.5*10^(-5)
    break
end
k=k+1;
end