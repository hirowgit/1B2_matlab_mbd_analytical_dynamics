syms t n g b d m n2

% n'(t) = n(t) +b/c(t)*n(t)
n1=(1+b/(g*(1-1/n)))*n

display('Your answer: n1(t)=');
expand(n1)

B = @(n) n +b/c* n;
P = @(n) n -d*c* n;
M = @(n) n+m;

c = @(n) g*(1-1/n);

display('True Ans: n1(t)=');
expand(B(n))

display('Your answer: n2(t)=');
expand((1-d*g)*(1+b/(g*(1-1/n)))*n+d*g)

display('True Ans: n2(t)=');
expand(P(B(n)))


expand(M(P(B(n))))

ans2=(1-d*(g*(1-1/n)))*(1+b/(g*(1-1/n)))*n+m;
expand(ans2)