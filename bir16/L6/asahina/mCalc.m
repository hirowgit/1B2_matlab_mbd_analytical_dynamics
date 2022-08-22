clear
syms x1 y1 phi1 x2 y2 phi2 x3 y3 phi3 x4 y4 phi4 w t;
syms x_1 y_1 phi_1 x_2 y_2 phi_2 x_3 y_3 phi_3 x_4 y_4 phi_4;
PhiK=[-x1+cos(phi1)+x4;
    -y1+sin(phi1)+y4;
    -x1-cos(phi1)+x2-2*cos(phi2);
    -y1-sin(phi1)+y2-2*sin(phi2);
    -x2-2*cos(phi2)+x3+2*cos(phi3);
    -y2-2*sin(phi2)+y3+2*sin(phi3);
    -x3+2*cos(phi3)+x4+2*cos(phi4);
    -y3+2*sin(phi3)+y4+2*sin(phi4);
    x4;
    y4;
    phi4];

PhiD=[phi1-w*t];

Phi=[PhiK;
    PhiD];

q=[x1 y1 phi1 x2 y2 phi2 x3 y3 phi3 x4 y4 phi4]';
q_1=[x_1 y_1 phi_1 x_2 y_2 phi_2 x_3 y_3 phi_3 x_4 y_4 phi_4]';

Phit=diff(Phi,t);
Fq=jacobian(Phi,q');


Fqq_1=Fq*q_1;
Fqq_1q=jacobian(Fqq_1,[x_1 y_1 phi_1 x_2 y_2 phi2 x_3 y_3 phi3 x_4 y_4 phi_4]);
Fqq_1q(1:4,3)=diff(Fqq_1q(1:4,3),phi1);
Fqq_1q(7:8,12)=diff(Fqq_1q(7:8,12),phi4);
Fqq_1q(1,3)=Fqq_1q(1,3)*phi_1;
Fqq_1q(3,3)=Fqq_1q(3,3)*phi_1;
Fqq_1q(2,3)=Fqq_1q(2,3)*-phi_1;
Fqq_1q(4,3)=Fqq_1q(4,3)*-phi_1;
Fqq_1q(7,12)=Fqq_1q(7,12)*phi_4;
Fqq_1q(8,12)=Fqq_1q(8,12)*phi_4;
Fqq_1q
F=Fqq_1q*q_1