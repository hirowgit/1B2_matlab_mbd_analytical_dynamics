function res=gcfunc_3Link(n,I,m,L,Lg,t)
switch n
    case 1
        res=L(1)*m(2)*cos(t(1)) + L(1)*m(3)*cos(t(1)) + Lg(1)*m(1)*cos(t(1)) + Lg(3)*m(3)*cos(t(1) + t(2) + t(3)) + L(2)*m(3)*cos(t(1) + t(2)) + Lg(2)*m(2)*cos(t(1) + t(2));
    case 2
        res=Lg(3)*m(3)*cos(t(1) + t(2) + t(3)) + L(2)*m(3)*cos(t(1) + t(2)) + Lg(2)*m(2)*cos(t(1) + t(2));
    case 3
        res=Lg(3)*m(3)*cos(t(1)+t(2)+t(3));
    otherwise
        res=0;
end 
end