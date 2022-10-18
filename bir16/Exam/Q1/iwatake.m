% iwatake

B = @(n) n +b/c* n;
P = @(n) n -d*c* n;
M = @(n) n+m;

c = @(n) g*(1-1/n);

expand((1-d*g)*(1+b/(g*(1-1/n)))*n+d*g)

display('True Ans: F(n(t),b,d,m,g)=');
expand(M(P(B(n))))

display('Your answer: F(n(t),b,d,m,g)=');
ans2=(1-d*(g*(1-1/n)))*(1+b/(g*(1-1/n)))*n+m;
expand(ans2)