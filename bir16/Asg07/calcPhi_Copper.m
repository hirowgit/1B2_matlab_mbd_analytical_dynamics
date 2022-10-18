% calc Phi
clear all
syms t omega
N=4;
xj = sym('x',[1 N]);
yj = sym('y',[1 N]);
phij = sym('phi',[1 N]);
xjP = sym('xp',[1 N]);
yjP = sym('yp',[1 N]);
qpre = [xj; yj; phij];
q=qpre(:);

Rot = @(phi) ([cos(phi) -sin(phi); sin(phi) cos(phi)]);

% PhiKj = sym('PhiK',[N 1]);
rj=[xj; yj]; sj=[xjP; yjP];
kj=1:N; 
si(:,1)=[1 0]'; si(:,2)=[2 0]'; si(:,3)=[-2 0]'; si(:,4)=[0 0]';
sj(:,1)=[-1 0]'; sj(:,2)=[-2 0]'; sj(:,3)=[2 0]'; sj(:,4)=[2 0]';

ki=circshift(kj,[0 1]);

% subs(sj,[]);

for k=1:N
  PhiKj(:,k)= rj(:,ki(k)) + Rot(phij(ki(k)))*si(:,ki(k)) - rj(:,kj(k)) - Rot(phij(kj(k)))*sj(:,kj(k));
  nPhiKj(:,k)=expand(PhiKj(:,k));
  display(['[ Kinematic Constraints for Body ',num2str(ki(k)),' and Body ',num2str(kj(k)),' connecting at Node R',num2str(k),' ]:'])
  display(nPhiKj(:,k));
end
st1='[ Body 4 provides additional constraints at x_4, y_4, phi_4 to be zero';
st2='because it is set on the origin (angle is set along the baseline). Therefore the whole kinematic constratints are given as:]:';
sprintf('%s\n%s',st1,st2)

newPhiKj=[nPhiKj(:); xj(N); yj(N); phij(N); ];

st1=['[ Since DOF is derived from nc - nh, where nc = ',num2str(length(q)),' and #constraints (nh) = ',num2str(size(newPhiKj,1))];
st11=[', nc - nh = ',num2str(length(q)-size(newPhiKj,1)),'.'];
st2 = ['Therefore',num2str(length(q))-size(newPhiKj,1),' constraint needs to be added such as:'];
sprintf('%s%s\n%s',st1,st11,st2)

PhiDj=[phij(1)-omega*t]
display(['PhiDj==0']);

st1='[The final form of the constratint with the enough number of equations are ';
sprintf('%s',st1)

Phij=[newPhiKj(:);  phij(1)-omega*t]

% expand(PhiKj(:,1)

Phiq=jacobian(Phij,q)

dq_pre=strrep(char(q),'matrix([[','');
dq_pre=strrep(dq_pre,' [','');
dq_pre=strrep(dq_pre,']])','');
dq=strsplit(dq_pre,'],');
dq_label=cellfun(@(x) ['d', x], dq,'UniformOutput', false);
dq=sym(dq_label);  dq=dq(:);

display('[ Phiq*dq = ]');
Phiq_dq=Phiq*dq

display('[ (Phiq*dq)q = ]');
Phiq_dq_q=jacobian(Phiq_dq,q)

display('[ (Phiq*dq)q*dq = ]');
Phiq_dq_q*dq

