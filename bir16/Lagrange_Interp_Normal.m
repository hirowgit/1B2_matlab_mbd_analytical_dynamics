syms x y x0 Ltop Lbottom pn
N=5;
xi = sym('x',[1 N]);
fi = sym('f',[1 N]);
Li = sym('L',[1 N]);
Lie = sym('Le',[1 N]);

Ltop=(x-x0); 
for i=1:N
    Ltop = Ltop*(x-xi(i));
end
for i=1:N
     Lbottom=(xi(i)-x0);
    for j=1:N
        if i~=j Lbottom=Lbottom*(xi(i)-xi(j)); end
    end
    Li(i)=Ltop/((x-xi(i))*Lbottom);
    Lie(i)=expand(Li(i));
end
% Lbottom=

pn=0;
for i=1:N
    pn=pn+Li(i)*fi(i);
end

xi=[0 1 2 3 4];
fi=[0 1 3 2 0];


p1= @(x) (x.*(x-1).*(x-3).*(x-4))/4-(x.*(x-1).*(x-2).*(x-4))/2-(x.*(x-2).*(x-3).*(x-4))/6;
