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
termin=1e-8;% ����
n=100;
T=zeros(n);
a=range(1);
b=range(2);
%T(1,1)=(b-a)/2*eval(subs(f,x,a)+subs(f,x,b));
 T(1,1)=(b-a)/2*eval(subs(f,x,a+termin)+subs(f,x,b));% Division by zero.ʱʹ��
for i=1:n
 % ����������е���͹�ʽ sigma
 sigma=0;
 for j=1:2^(i-1) % ע��ѭ���յ�
sigma=sigma+eval(subs(f,x,a+(b-a)/(2^(i-1))*(j-0.5)));%�е㸴�ӣ�д����������
 end
 T(1,i+1)=0.5*T(1,i)+(b-a)/2^i*sigma;
 % ��ʼ��ڶ��м������У�ÿ���¼���һ��ֵ
 for k=1:i
 T(k+1,i-k+1)=(4^k*T(k,i-k+2)-T(k,i-k+1))/(4^k-1);
 end
 if abs(T(i+1,1)-T(i,1))<termin
 break;
 end
end
T(:,i+2:n)=[];% ȥ������Ĳ���
T(i+2:n,:)=[];
T=vpa(T,15);
disp(' ���ֽ��Ϊ��');
disp(T(i+1,1));
toc;