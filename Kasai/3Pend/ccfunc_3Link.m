function res=ccfunc_3Link(n,I,m,L,Lg,t,dt)
switch n
    case 1
        res=-dt(2)^2*L(1)*Lg(3)*m(3)*sin(t(2)+t(3)) -dt(3)^2*L(1)*Lg(3)*m(3)*sin(t(2)+t(3)) -dt(2)^2*L(1)*L(2)*m(3)*sin(t(2)) -dt(2)^2*L(1)*Lg(2)*m(2)*sin(t(2)) - dt(3)^2*L(2)*Lg(3)*m(3)*sin(t(3)) - 2*dt(1)*dt(2)*L(1)*Lg(3)*m(3)*sin(t(2)+t(3)) -2*dt(1)*dt(3)*L(1)*Lg(3)*m(3)*sin(t(2)+t(3)) -2*dt(2)*dt(3)*L(1)*Lg(3)*m(3)*sin(t(2)+t(3)) -2*dt(1)*dt(2)*L(1)*L(2)*m(3)*sin(t(2)) - 2*dt(1)*dt(2)*L(1)*Lg(2)*m(2)*sin(t(2)) - 2*dt(1)*dt(3)*L(2)*Lg(3)*m(3)*sin(t(3)) - 2*dt(2)*dt(3)*L(2)*Lg(3)*m(3)*sin(t(3));
    case 2
        res=dt(1)^2*L(1)*Lg(3)*m(3)*sin(t(2)+t(3)) +dt(1)^2*L(1)*L(2)*m(3)*sin(t(2)) + dt(1)^2*L(1)*Lg(2)*m(2)*sin(t(2)) - dt(3)^2*L(2)*Lg(3)*m(3)*sin(t(3)) - 2*dt(1)*dt(3)*L(2)*Lg(3)*m(3)*sin(t(3)) - 2*dt(2)*dt(3)*L(2)*Lg(3)*m(3)*sin(t(3));
    case 3
        res=Lg(3)*m(3)*(dt(1)^2*L(1)*sin(t(2) + t(3)) + dt(1)^2*L(2)*sin(t(3)) + dt(2)^2*L(2)*sin(t(3)) + 2*dt(1)*dt(2)*L(2)*sin(t(3)));
    otherwise
        res=0;
end 
end