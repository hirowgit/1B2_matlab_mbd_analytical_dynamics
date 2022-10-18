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
  display(nPhiKj(:,k));
end

fPhiKj=[nPhiKj(:); xj(N); yj(N); phij(N); phij(1)-omega*t];

% expand(PhiKj(:,1)

Phiq=jacobian(fPhiKj,q)

dq_pre=strrep(char(q),'matrix([[','');
dq_pre=strrep(dq_pre,' [','');
dq_pre=strrep(dq_pre,']])','');
dq=strsplit(dq_pre,'],');
dq_label=cellfun(@(x) ['d', x], dq,'UniformOutput', false);
dq=sym(dq_label);  dq=dq(:);

Phiq_dq=Phiq*dq

Phiq_dq_q=jacobian(Phiq_dq,q)

Phiq_dq_q*dq

