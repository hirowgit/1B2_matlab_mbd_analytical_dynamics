%ft
syms f(t) t
PhiKj=[xj(1)-sin(phij(1)); yj(1)+cos(phij(1)); phij(1)-f(t);]; 
dxj=sym('dx',[1 3]);
dyj=sym('dy',[1 3]);
dphij=sym('dphi',[1 3]);
dq=[dxj; dyj; dphij];
 dq(:,1)

qsub=[xj(1) yj(1) phij(1)]; qsub=qsub(:);
dqsub=[xj(1) yj(1) phij(1)]; qsub=qsub(:);


jacobian(PhiKj,qsub)
jacobian(PhiKj,qsub)* dq(:,1)
kL=jacobian((jacobian(PhiKj,qsub)* dq(:,1)),qsub)
kL*dq(:,1)