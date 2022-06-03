clc;clear;
tic;
format long;
x_data=[3 4 5 6 7 8 9];
f_data=[2.01 2.98 3.50 5.02 5.47 6.02 7.05];
data=[x_data;f_data];
count=size(x_data,2);
m=5;% 拟合阶数，即最高为 x^3
syms x phi f;
% 生成拟合多项式中的phi=1;x;x^2...
phi = sym('x',[m+1,1]);
for i=0:m
 phi(i+1)=x^i;
end
% 求出 phi 对应 x 的值，横向为 x，纵向为 phi 不同值
phi_value=zeros(m+1,count);
for i=1:count
phi_value(:,i)=eval(subs(phi,x,x_data(i)));
end
% 神奇的一步，利用矩阵一次计算出等号左边的 phi 矩阵
% 具体的用笔比划一下就明白了
phi_matrix =phi_value*phi_value';
f_phi = phi_value*f_data';% 计算等式右边 f_phi
aj=phi_matrix\f_phi;% 求解系数 aj
f=phi'*aj;% 得到的拟合函数
% 绘图
plot(x_data,f_data,'.');% 拟合数据点
hold on;
j=x_data(1):0.01:x_data(count);
y=eval(subs(f,x,j));
plot(j,eval(subs(f,x,j)));% 插值函数图象%
ezplot(f,[x_data(1),x_data(count)
]); %也可以直接用这条指令
legend('拟合点','拟合函数'); 
title('最小二乘法的曲线拟合图像')
hold on;
% 用拟合函数计算某个点的值
x_test=5.5;
f_test=eval(subs(f,x,x_test));
fprintf('在点 %f 的函数值为：\n%f\n',x_test,f_test);