% calc
syms t n g b d m

c = @(n) g*(1-1/n);
B = @(n) n +b/c* n;
P = @(n) n -d*c* n;
M = @(n) n+m;

n1=c(n)
n2=B(n1)
n3=P(n2)
n4=M(n3)
n5=B(n4)

expand(n5)

newEq=subs(n5,[g b d m],[0.1 0.2 0.3 1]);


% plot
% clear all 
%  global g b d m
%  g=0.1;  b=0.2;  d=0.3;  m=1; 
 
c = @(n) global g; g.*(1-1./n);
B = @(n) n +b/c* n;
P = @(n) n -d.*c.* n;
M = @(n) n+m;

[a, b], [sym('alpha'), 2]

subs(n5,g,0.1)

n=2;
 for i=1:100
    n=c(n)
    n=B(n)
    n=P(n)
    n=M(n)
    n=B(n)

 end
