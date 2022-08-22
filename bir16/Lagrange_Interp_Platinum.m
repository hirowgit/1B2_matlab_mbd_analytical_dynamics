syms x y x0 f0 L0 Ltop Lbottom pn
myFont='Helvetica'; myFsize=16;
myFont2='Times';

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

pnL=subs(pn,[x0 xi f0 fi],[xx fg]);
display(pnL);

pnMF = matlabFunction(pnL);
display(pnMF);

% Ans:
% p1=@(x) (3*x.*(x - 1).*(x - 3).*(x - 4))/4 - (x.*(x - 1).*(x - 2).*(x - 4))/3 - (x.*(x - 2).*(x - 3).*(x - 4))/6;

figure(9); clf

x=-1:0.1:5;
plot(x,pnMF(x),'b-'), hold on;
plot(xx,fg,'r.','MarkerSize',20), hold on;
set(gca,'xlim',[-1,5],'ylim',[-2,6]); grid on;
set ( gca, 'FontName',myFont,'FontSize',myFsize );
xlabel( 'x', 'FontName',myFont2,'FontSize',myFsize,'FontAngle', 'italic'); 
ylabel( 'f', 'FontName',myFont2,'FontSize',myFsize,'FontAngle', 'italic'); 
title('Answer: Lagrange Interpolating Polynomial ');

stfunc=char(pnL);  stfunc2=strrep(stfunc,'*','\cdot');
splitStr2=splitFname2cell_Gold(stfunc2);
splitStrL=splitStr2;
splitStrL=cellfun(@(x) (['    ', x]),splitStrL,'UniformOutput', false);
stemp=splitStrL{1}; splitStrL{1}=['f=',stemp(5:end)];
%  text(xx(3)+0.05,fg(3)+1,splitStrL,'FontSize',myFsize*0.8)
 text(xx(3)-0.18,fg(3)+1,splitStrL,'FontSize',myFsize*0.9)



