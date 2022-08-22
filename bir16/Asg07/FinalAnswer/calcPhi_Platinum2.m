% Copyright (c) 2016, Wagatsuma Lab@Kyutech and Hiroaki Wagatsuma 
% All rights reserved.
% Redistribution and use in source and binary forms, with or without
% modification, are permitted under the terms of the Creative Commons License
% Attribution, BY "Wagatsuma Lab@Kyutech and Hiroaki Wagatsuma "

clear all
syms t omega
N=4;
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
si(:,4)=[0 0]'; si(:,1)=[1 0]'; si(:,2)=[2 0]'; si(:,3)=[-2 0]';
sj(:,1)=[-1 0]'; sj(:,2)=[-2 0]'; sj(:,3)=[2 0]'; sj(:,4)=[2 0]';

ki=circshift(kj,[0 1]);

% subs(sj,[]);

for k=1:N
  PhiKj(:,k)= rj(:,ki(k)) + Rot(phij(ki(k)))*si(:,ki(k)) - rj(:,kj(k)) - Rot(phij(kj(k)))*sj(:,kj(k));
  nPhiKj(:,k)=expand(PhiKj(:,k));
  display(['[ Kinematic Constraints for Body ',num2str(ki(k)),' and Body ',num2str(kj(k)),' connecting at Node R',num2str(k),' ]:'])
  display(nPhiKj(:,k));
  display('--');
  convert2TeXF2(nPhiKj(:,k),qAll)

end
display('----------------');
st1='[ Body 4 provides additional constraints at x_4, y_4, phi_4 to be zero';
st2='because it is set on the origin (angle is set along the baseline). Therefore the whole kinematic constraints are given as:]:';
sprintf('%s\n%s',st1,st2)

newPhiKj=[nPhiKj(:); xj(N); yj(N); phij(N); ];
% convert2TeXF2(newPhiKj,qAll)


display('----------------');
st1=['[ Since DOF is derived from nc - nh, where nc = ',num2str(length(q)),' and #constraints (nh) = ',num2str(size(newPhiKj,1))];
st11=[', and then nc - nh = ',num2str(length(q)-size(newPhiKj,1)),'.'];
st2 = ['Therefore, ',num2str(length(q)-size(newPhiKj,1)),' constraint needs to be added such as:'];
sprintf('%s%s\n%s',st1,st11,st2)

PhiDj=[phij(1)-omega*t]
display(['where PhiDj==0']);

display('----------------');
st1='[The final form of the constraint with the enough number of equations are ';
sprintf('%s',st1)

display('[ Phiq = ]:');
Phij=[newPhiKj(:);  phij(1)-omega*t]

display('{\bm \Phi} =');
convert2TeXF2(Phij,qAll)

display('----------------');
display('[ Phiq = ]:');
% Phiq=jacobian(Phij,q)
Phiq=jacobian(Phij,qAll)
% Phiq=jacobian(Phij,qAll(1:12))
Phiq=Phiq(1:12,1:12);


display('{\bm \Phi_q}  =');
convert2TeXF2(Phiq,qAll)

display('----------------');
display('[ Phiq*dq = ]:');
Phiq_dq=Phiq*dq

display('{\bm \Phi_q} \dot q =');
convert2TeXF2(Phiq_dq,qAll)

display('----------------');
display('[ (Phiq*dq)q = ]:');
% Phiq_dq_q=jacobian(Phiq_dq,q)
Phiq_dq_q=jacobian(Phiq_dq,qAll);
Phiq_dq_q=Phiq_dq_q(1:12,1:12);


display('\left({\bm \Phi_q} \dot q\right)_q  =');
convert2TeXF2(Phiq_dq_q,qAll)

display('----------------');
display('[ (Phiq*dq)q*dq = ]:');
Phiq_dq_q*dq

display('\left({\bm \Phi_q} \dot q\right)_q  \dot q=');
convert2TeXF2(Phiq_dq_q*dq,qAll)

display('----------------');

