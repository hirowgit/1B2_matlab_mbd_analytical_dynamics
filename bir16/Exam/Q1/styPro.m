figure(1); clf
b=0.1; d=0.2; m=0.05; g=1;

g=0.01; b=0.02; d=0.03; m= 0.05;

func1 = @(n,c) (((1+b/c)*(1-d/c)+m)*n);
func2 = @(n) (g*(1-(1/n)));
n1=2;  pn=[];
for i=1:10
    c1=func2(n1);
    n1=func1(n1,c1);
    pn=[pn; n1 c1];
end
plot(pn);
xlabel('t');
ylabel('n,c');
