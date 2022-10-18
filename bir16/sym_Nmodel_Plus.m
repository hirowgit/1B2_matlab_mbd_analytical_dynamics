syms t n g b d m c

c = @(n) g*(1-1/n);
B = @(n) n +b/c* n;
P = @(n) n -d*c* n;
M = @(n) n+m;

 n1=c(n)
% n1=n
n2=B(n1)
n3=P(n2)
n4=M(n3)
n5=B(n4)

display('n(t+1) = F =');
expand(n5)

