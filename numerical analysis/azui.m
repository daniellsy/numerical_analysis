clc;clear;
tic;
format long;
x_data=[3 4 5 6 7 8 9];
f_data=[2.01 2.98 3.50 5.02 5.47 6.02 7.05];
data=[x_data;f_data];
count=size(x_data,2);
m=5;% ��Ͻ����������Ϊ x^3
syms x phi f;
% ������϶���ʽ�е�phi=1;x;x^2...
phi = sym('x',[m+1,1]);
for i=0:m
 phi(i+1)=x^i;
end
% ��� phi ��Ӧ x ��ֵ������Ϊ x������Ϊ phi ��ֵͬ
phi_value=zeros(m+1,count);
for i=1:count
phi_value(:,i)=eval(subs(phi,x,x_data(i)));
end
% �����һ�������þ���һ�μ�����Ⱥ���ߵ� phi ����
% ������ñʱȻ�һ�¾�������
phi_matrix =phi_value*phi_value';
f_phi = phi_value*f_data';% �����ʽ�ұ� f_phi
aj=phi_matrix\f_phi;% ���ϵ�� aj
f=phi'*aj;% �õ�����Ϻ���
% ��ͼ
plot(x_data,f_data,'.');% ������ݵ�
hold on;
j=x_data(1):0.01:x_data(count);
y=eval(subs(f,x,j));
plot(j,eval(subs(f,x,j)));% ��ֵ����ͼ��%
ezplot(f,[x_data(1),x_data(count)
]); %Ҳ����ֱ��������ָ��
legend('��ϵ�','��Ϻ���'); 
title('��С���˷����������ͼ��')
hold on;
% ����Ϻ�������ĳ�����ֵ
x_test=5.5;
f_test=eval(subs(f,x,x_test));
fprintf('�ڵ� %f �ĺ���ֵΪ��\n%f\n',x_test,f_test);