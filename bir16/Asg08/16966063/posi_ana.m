%�ʒu���
%posi_ana.m

function [x,d,q,Aq]=posi_ana (x0,t)

%�^���w�S�����̗v�f
z1=x0(1)-1.5*cos(x0(3));
z2=x0(2)-1.5*sin(x0(3));
z3=x0(4)-1.5*cos(x0(3))-2*cos(x0(6));
z4=x0(5)-1.5*sin(x0(3))-2*sin(x0(6));
z5=x0(5)+1;
z6=x0(3)-(pi/6)*t-(5*pi/3);

%���R�r�s��̗v�f
a1=[1,0,1.5*sin(x0(3)),0,0,0];
a2=[0,1,-1.5*cos(x0(3)),0,0,0];
a3=[0,0,1.5*sin(x0(3)),1,0,2*sin(x0(6))];
a4=[0,0,-1.5*cos(x0(3)),0,1,-2*cos(x0(6))];
a5=[0,0,0,0,1,0];
a6=[0,0,1,0,0,0];

A=-[z1;z2;z3;z4;z5;z6];%�^���w�S����
Aq=[a1;a2;a3;a4;a5;a6];%���R�r�s��
dx=Aq\A;
x=x0+dx;
[d]=max(abs(dx));
b=[z1;z2;z3;z4;z5;z6];
[q]=max(abs(b));