syms t n g b d m n2

c = @(n) g*(1-1/n);
B = @(n) n +b/c(n)* n;
P = @(n) n -d*c(n)* n;
M = @(n) n+m;


display('Your answer: F(n(t),b,d,m,g)=');
ans2=n+b*n^2/(g*(n+1))+d*b*n/(n+1)+d*g*(1-n)+m

display('is expanded as');
expand(ans2)


display('True Ans: F(n(t),b,d,m,g)=');

expand(M(P(B(n))))


% ans2-M(P(B(n)))
