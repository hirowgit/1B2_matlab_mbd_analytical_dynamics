% Copyright (c) 2016, Wagatsuma Lab@Kyutech and Hiroaki Wagatsuma 
% All rights reserved.
% Redistribution and use in source and binary forms, with or without
% modification, are permitted under the terms of the Creative Commons License
% Attribution, BY "Wagatsuma Lab@Kyutech and Hiroaki Wagatsuma "

clear all
syms t omega l1 l2 l3 theta1
N=3;
xj = sym('x',[1 N]);
yj = sym('y',[1 N]);
phij = sym('phi',[1 N]);
xjP = sym('xp',[1 N]);
yjP = sym('yp',[1 N]);
qpre = [xj; yj; phij]; q=qpre(:);

dq=makeDiffVal(q);
qAll=[q; dq];

Rot = @(phi) ([cos(phi) -sin(phi); sin(phi) cos(phi)]);

% PhiKj = sym('PhiK',[N 1]);
rj=[xj; yj]; sj=[xjP; yjP];
kj=1:N; 
 si(:,1)=[l1 0]'; si(:,2)=[0 0]'; 
 sj(:,2)=[0 l2]'; sj(:,3)=[0 l3]';

% subs(sj,[]);

for k=1:N-1
  PhiKj(:,k)= rj(:,k) + Rot(phij(k))*si(:,k) - rj(:,k+1) - Rot(phij(k+1))*sj(:,k+1);

  nPhiKj(:,k)=expand(PhiKj(:,k));
  nPhiKj2=subs(nPhiKj(:,k),conj(l3),l3');
  nPhiKj2=subs(nPhiKj(:,k),conj(l1),l1');
  nPhiKj2=subs(nPhiKj(:,k),conj(l2),l2');
  
  nPhiKj(:,k)=nPhiKj2;
  display(['[ Kinematic Constraints for Body ',num2str(k),' and Body ',num2str(k+1),' connecting at Node R',num2str(k),' ]:'])
  display(nPhiKj(:,k));
  end



display('----------------');
st1='[ Body O1P and O2P provides additional constraints at x_1, y_1, y_2 to be zero';
st2='because it is set on the origin (angle is set along the baseline) and the slider constraints. Therefore the whole kinematic constraints are given as:]:';
sprintf('%s\n%s',st1,st2)

newPhiKj=[xj(1); yj(1); yj(2); nPhiKj(:) ];

display('----------------');
st1=['[ Since DOF is derived from nc - nh, where nc = ',num2str(length(q)),' and #constraints (nh) = ',num2str(size(newPhiKj,1))];
st11=[', and then nc - nh = ',num2str(length(q)-size(newPhiKj,1)),'.'];
st2 = ['Therefore, ',num2str(length(q)-size(newPhiKj,1)),' constraint needs to be added such as:'];
sprintf('%s%s\n%s',st1,st11,st2)

PhiDj=[phij(1)-omega*t; phij(2)-theta1]
display(['where PhiDj==0']);

display('----------------');
st1='[The final form of the constraint with the enough number of equations are ';
sprintf('%s',st1)

display('[ Phiq = ]:');
Phij=[newPhiKj(:);  PhiDj]

Phij=subs(Phij,conj(l3),l3);
Phij=subs(Phij,conj(l1),l1);
Phij=subs(Phij,conj(l2),l2);


display('{\bm \Phi^K} =');
convert2TeXF(Phij(1:7),qAll)


display('{\bm \Phi} =');
convert2TeXF(Phij,qAll)

display('----------------');
display('[ Phiq = ]:');
Phiq=jacobian(Phij,q)

display('{\bm \Phi_q}  =');
convert2TeXF(Phiq,qAll)

display('----------------');
display('[ Phiq*dq = ]:');
Phiq_dq=Phiq*dq

display('{\bm \Phi_q} \dot q =');
convert2TeXF(Phiq_dq,qAll)

display('----------------');
display('[ (Phiq*dq)q = ]:');
Phiq_dq_q=jacobian(Phiq_dq,q)

display('\left({\bm \Phi_q} \dot q\right)_q  =');
convert2TeXF(Phiq_dq_q,qAll)

display('----------------');
display('[ (Phiq*dq)q*dq = ]:');
Phiq_dq_q*dq

display('\left({\bm \Phi_q} \dot q\right)_q  \dot q=');
convert2TeXF(Phiq_dq_q*dq,qAll)

display('----------------');



