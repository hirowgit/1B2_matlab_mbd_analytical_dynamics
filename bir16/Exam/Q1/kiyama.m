figure(1); clf
clear all
b=0.5; d=0.2; m=3; g=1;

func1=@(n,c)(n+(b/c));%B
func2=@(n,c)(n-d*c*n);%P
func3=@(n)(n+m);%M
func4=@(n)(g*(1-1/n));%c'

B = @(n) n +b/c* n;
P = @(n) n -d*c* n;
M = @(n) n+m;

c = @(n) g*(1-1/n);


n=10;
pn=[];
pn=[pn;n];%t=0ÇÃÇ∆Ç´
for i=1:10
    c=func4(n);
    n=func1(n,c);
    n=func2(n,c);
    n=func3(n);
    
    pn=[pn;n];

end

plot(0:10,pn);

xlabel('t')
ylabel('É}ÉEÉXÇÃêî')