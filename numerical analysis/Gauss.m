clc;clear;
tic;
format long;
%A=[1e-8,2,3;
 %-1,3.712,4.623;
 %-2,1.072,5.643];
%b=[1;2;3];
A=[4,-2,4;
-2,17,10;
-4,10,9];
b=[10;3;7];
% ��˹��ȥ��
Ab=[A b];
n=length(b);
for i=2:n
 for j=i:n
 Ab(j,:)=Ab(j,:)-Ab(i-1,:)*Ab(j,i-1)/Ab(i-1,i-1);
 end
end
x=zeros(n,1);
for k=n:-1:1 %ע��˴�д��
 x(k)=(Ab(k,n+1)-Ab(k,1:n)*x)/Ab(k,k);
end
x1=x;
% ��˹����Ԫ��ȥ��
Ab=[A b];
n=length(b);
for i=2:n
 % ѡ��Ԫ
 max=0;
 max_row=0;
 for g=i-1:n
 if abs(Ab(g,i-1))>max
 max=abs(Ab(g,i-1));%�ҵ����ֵ
 max_row=g;%��¼�����
 end
 end
 Ab([i-1,max_row],:)=Ab([max_row,i-1],:);%��������
 for j=i:n
 Ab(j,:)=Ab(j,:)-Ab(i-1,:)*Ab(j,i-1)/Ab(i-1,i-1);
 end
end
x=zeros(n,1);
for k=n:-1:1 %ע��˴�д��
 x(k)=(Ab(k,n+1)-Ab(k,1:n)*x)/Ab(k,k);
end
x2=x;
x=[vpa(x1,12) vpa(x2,12)];
disp(' ��˹��ȥ�� ��˹����Ԫ��ȥ��');
disp(x);
disp(' ���ַ��������ֵ');
disp(x1-x2);
toc;