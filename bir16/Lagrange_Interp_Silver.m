syms x y x0 f0 L0 Ltop Lbottom pn

xx=[0 1 2 3 4];
fg=[0 1 3 2 0];

N=length(xx)-1;
xi = sym('x',[1 N]);
fi = sym('f',[1 N]);
Li = sym('L',[1 N]);

Ltop=(x-x0); 
for i=1:N
    Ltop = Ltop*(x-xi(i));
end

Lbottom=1;
for j=1:N
    Lbottom=Lbottom*(x0-xi(j)); 
end
L0=Ltop/((x-x0)*Lbottom);

for i=1:N
     Lbottom=(xi(i)-x0);
    for j=1:N
        if i~=j Lbottom=Lbottom*(xi(i)-xi(j)); end
    end
    Li(i)=Ltop/((x-xi(i))*Lbottom);
end

pn=L0*f0;
for i=1:N
    pn=pn+Li(i)*fi(i);
end

% px=subs(pn,[x0 xi],xx);
% pf=subs(px,[f0 fi],fg);

pnL=subs(pn,[x0 xi f0 fi],[xx fg]);
display(pnL);

pnMF = matlabFunction(pnL);

% Ans:
% p1=@(x) (3*x.*(x - 1).*(x - 3).*(x - 4))/4 - (x.*(x - 1).*(x - 2).*(x - 4))/3 - (x.*(x - 2).*(x - 3).*(x - 4))/6;

figure(9); clf

x=-1:0.1:5;

% p1=@(x) (3*x.*(x - 1).*(x - 3).*(x - 4))/4 - (x.*(x - 1).*(x - 2).*(x - 4))/3 - (x.*(x - 2).*(x - 3).*(x - 4))/6;
% p1=@(x) pnL;

plot(x,pnMF(x),'b-'), hold on;
plot(xx,fg,'r.','MarkerSize',20), hold on;
set(gca,'xlim',[-1,5],'ylim',[-2,6]);
title('Answer: Lagrange Interpolating Polynomial ');




