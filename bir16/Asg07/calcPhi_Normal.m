% calc Phi
syms t
N=4;
xj = sym('x',[1 N]);
yj = sym('y',[1 N]);
phij = sym('phi',[1 N]);
xjP = sym('xp',[1 N]);
yjP = sym('yp',[1 N]);

Rot = @(phi) ([cos(phi) -sin(phi); sin(phi) cos(phi)]);
% Rot = @(phi) (cos(phi));

% PhiKj = sym('PhiK',[N 1]);

rj=[xj; yj]; sj=[xjP; yjP];
kj=1:N; 
ki=circshift(kj,[0 1]);

for k=1:N
  PhiKj(:,k)= rj(:,ki(k)) + Rot(phij(ki(k)))*sj(:,ki(k)) - rj(:,kj(k)) - Rot(phij(kj(k)))*sj(:,kj(k))
end




