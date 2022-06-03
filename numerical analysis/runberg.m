clc;clear;
tic;
format long;
syms x f;
 %f=x^3;
 %range=[6 100];
 %f=sin(x)/x;
 %range=[0 1];
f=sin(x^2);
range=[0 1];
termin=1e-8;% 精度
n=100;
T=zeros(n);
a=range(1);
b=range(2);
%T(1,1)=(b-a)/2*eval(subs(f,x,a)+subs(f,x,b));
 T(1,1)=(b-a)/2*eval(subs(f,x,a+termin)+subs(f,x,b));% Division by zero.时使用
for i=1:n
 % 先求出递推中的求和公式 sigma
 sigma=0;
 for j=1:2^(i-1) % 注意循环终点
sigma=sigma+eval(subs(f,x,a+(b-a)/(2^(i-1))*(j-0.5)));%有点复杂，写出来就明白
 end
 T(1,i+1)=0.5*T(1,i)+(b-a)/2^i*sigma;
 % 开始求第二行及后面行，每行新计算一个值
 for k=1:i
 T(k+1,i-k+1)=(4^k*T(k,i-k+2)-T(k,i-k+1))/(4^k-1);
 end
 if abs(T(i+1,1)-T(i,1))<termin
 break;
 end
end
T(:,i+2:n)=[];% 去掉多余的部分
T(i+2:n,:)=[];
T=vpa(T,15);
disp(' 积分结果为：');
disp(T(i+1,1));
toc;