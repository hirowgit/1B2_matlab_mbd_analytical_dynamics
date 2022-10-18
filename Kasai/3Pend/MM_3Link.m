function res=MM_3Link(n,I,m,L,Lg,t)
switch n
    case 11
        res=I(1) + I(2) + I(3) + L(1)^2*m(2) + L(1)^2*m(3) + L(2)^2*m(3) + Lg(1)^2*m(1) + Lg(2)^2*m(2) + Lg(3)^2*m(3) + 2*L(1)*Lg(3)*m(3)*cos(t(2) + t(3)) + 2*L(1)*L(2)*m(3)*cos(t(2)) + 2*L(1)*Lg(2)*m(2)*cos(t(2)) + 2*L(2)*Lg(3)*m(3)*cos(t(3));  
    case 12
        res=m(3)*L(2)^2 + 2*m(3)*cos(t(3))*L(2)*Lg(3) + L(1)*m(3)*cos(t(2))*L(2) + m(2)*Lg(2)^2 + L(1)*m(2)*cos(t(2))*Lg(2) + m(3)*Lg(3)^2 + L(1)*m(3)*cos(t(2) + t(3))*Lg(3) + I(2) + I(3); 
    case 13
        res=I(3) + Lg(3)^2*m(3) + L(1)*Lg(3)*m(3)*cos(t(2) + t(3)) + L(2)*Lg(3)*m(3)*cos(t(3));
    case 21
        res=m(3)*L(2)^2 + 2*m(3)*cos(t(3))*L(2)*Lg(3) + L(1)*m(3)*cos(t(2))*L(2) + m(2)*Lg(2)^2 + L(1)*m(2)*cos(t(2))*Lg(2) + m(3)*Lg(3)^2 + L(1)*m(3)*cos(t(2) + t(3))*Lg(3) + I(2) + I(3); 
    case 22
        res=m(3)*L(2)^2 + 2*m(3)*cos(t(3))*L(2)*Lg(3) + m(2)*Lg(2)^2 + m(3)*Lg(3)^2 + I(2) + I(3);
    case 23
        res=m(3)*Lg(3)^2 + L(2)*m(3)*cos(t(3))*Lg(3) + I(3);
    case 31
        res=I(3) + Lg(3)^2*m(3) + L(1)*Lg(3)*m(3)*cos(t(2) + t(3)) + L(2)*Lg(3)*m(3)*cos(t(3));
    case 32
        res=m(3)*Lg(3)^2 + L(2)*m(3)*cos(t(3))*Lg(3) + I(3);
    case 33
        res=m(3)*Lg(3)^2 + I(3);
    otherwise
        res=0;
end 
end