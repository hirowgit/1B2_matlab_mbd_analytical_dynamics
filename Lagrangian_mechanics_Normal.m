% Lagrangian mechanics

La=subs(L,[diff(phi_i(1), t),diff(phi_i(2), t)],[sym('dp1'),sym('dp2')]);
symvar(L)
symvar(La)

dLa=diff(La,'dp1')

dLa2=subs(dLa,['dp1','dp2'],[diff(phi_i(1), t),diff(phi_i(2), t)]);
symvar(dLa2)

dLa3=diff(dLa2,t)

Lb=subs(L,[phi_i(1),phi_i(2)],[sym('p1'),sym('p2')]);
symvar(L)
symvar(Lb)

dLb=diff(Lb,'p1')

dLb2=subs(L,['p1','p2'],[phi_i(1),phi_i(2)]);
symvar(dLb2)

dLb3=diff(dLb2,t)


Lm=1/2*(2*m_i(2)*L_i(1)*Lc_i(2)*cos(phi_i(2)))*diff(phi_i(1), t)^2+m_i(2)*L_i(1)*Lc_i(2)*cos(phi_i(2))*diff(phi_i(1), t)*diff(phi_i(2), t);

Lma=subs(Lm,[diff(phi_i(1), t),diff(phi_i(2), t)],[sym('dp1'),sym('dp2')]);
dLma=diff(Lma,'dp1')
dLma2=subs(dLma,['dp1','dp2'],[diff(phi_i(1), t),diff(phi_i(2), t)]);
dLma3=diff(dLma2,t)

convertTddotTeXF(dLma3)


% tmp= 2*dthi(1)*l(1)*lg(2)*cos(thi(2))+dthi(2)*l(1)*lg(2)*cos(thi(2));
tmp= 2*diff(phi_i(1), t)*L_i(1)*Lc_i(2)*cos(phi_i(2))+diff(phi_i(2), t)*L_i(1)*Lc_i(2)*cos(phi_i(2));
dTmp=diff(tmp,t)

convertTddotTeXF(tmp)
convertTddotTeXF(dTmp)

tmp= diff(phi_i(2), t)*L_i(1)*Lc_i(2)*cos(phi_i(2));
dTmp=diff(tmp,t)

convertTddotTeXF(tmp)
convertTddotTeXF(dTmp)

tmp= 2*diff(phi_i(1), t)*L_i(1)*Lc_i(2)*cos(phi_i(2));
dTmp=diff(tmp,t)

convertTddotTeXF(tmp)
convertTddotTeXF(dTmp)


