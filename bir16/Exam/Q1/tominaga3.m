clear all
syms t n g b d m n2 c

% c = @(n) g*(1-1/n);

B = @(n) n +b/c* n;
P = @(n) n -d*c* n;
M = @(n) n+m;

display('Your answer: F(n(t),b,d,m,g)=');
ans2=g*(1-1/((1-d)*(1+b))*n+ m)

display('is expanded as');
expand(ans2)


display('True Ans: F(n(t),b,d,m,g)=');

ans1=expand(M(P(B(n))));
expand(subs(ans1,c,g*(1-1/n)))