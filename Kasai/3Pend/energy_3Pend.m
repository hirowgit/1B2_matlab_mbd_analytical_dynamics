%小林一行,ロボットモデリング P132 ラグランジアンの導出プログラムより


clear all;
syms theta1 theta2 L1 Lg1 L2 Lg2 d_theta1 d_theta2;
syms theta3 L3 Lg3 d_theta3;
syms l0;
%l0=0;

T01=[cos(theta1),-sin(theta1),l0;sin(theta1),cos(theta1),0;0,0,1];
T12=[cos(theta2),-sin(theta2),L1;sin(theta2),cos(theta2),0;0,0,1];
T23=[cos(theta3),-sin(theta3),L2;sin(theta3),cos(theta3),0;0,0,1];
p1g=T01*[Lg1;0;1];
p2g=T01*T12*[Lg2;0;1];
p3g=T01*T12*T23*[Lg3;0;1];
p1g=p1g(1:2);
p2g=p2g(1:2);
p3g=p3g(1:2);
dp1g=simplify(diff(p1g,theta1)*d_theta1+diff(p1g,theta2)*d_theta2+diff(p1g,theta3)*d_theta3);
dp2g=simplify(diff(p2g,theta1)*d_theta1+diff(p2g,theta2)*d_theta2+diff(p2g,theta3)*d_theta3);
dp3g=simplify(diff(p3g,theta1)*d_theta1+diff(p3g,theta2)*d_theta2+diff(p3g,theta3)*d_theta3);
syms Ic1 Ic2 grav m1 m2;
syms Ic3 m3;
k1=simplify(1/2*m1*dp1g.'*dp1g+1/2*Ic1*d_theta1^2);
k2=simplify(1/2*m2*dp2g.'*dp2g+1/2*Ic2*(d_theta1+d_theta2)^2);
k3=simplify(1/2*m3*dp3g.'*dp3g+1/2*Ic3*(d_theta1+d_theta2+d_theta3)^2);
K1=subs(k1,l0,0);
K2=subs(k2,l0,0);
K3=subs(k3,l0,0);
K=K1+K2+K3;

