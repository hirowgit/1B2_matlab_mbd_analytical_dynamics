% calc Phi
syms t
N=4;
xj = sym('x',[1 N]);
yj = sym('y',[1 N]);
phij = sym('phi',[1 N]);
xjP = sym('xp',[1 N]);
yjP = sym('yp',[1 N]);
qpreT=qpre'; q=qpreT(:);

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
end

fPhiKj=nPhiKj(:);
% expand(PhiKj(:,1)

jacobian(fPhiKj,q)



