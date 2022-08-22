syms t n g b d m n2

B = @(n) n +b/c* n;
P = @(n) n -d*c* n;
M = @(n) n+m;

c = @(n) g*(1-1/n);


display('Your answer: F(n(t),b,d,m,g)=');
ans2=n*(1+b/c*n)*(1-d*g*(n-1))+m

display('is expanded as');
expand(ans2)


display('True Ans: F(n(t),b,d,m,g)=');

expand(M(P(B(n))))


