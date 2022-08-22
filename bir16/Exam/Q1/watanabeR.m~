clear all
syms t n g b d m n2

c = @(n) g*(1-1/n);

B = @(n) n +b/c* n;
P = @(n) n -d*c* n;
M = @(n) n+m;



display('Your answer: F(n(t),b,d,m,g)=');
ans2=(n+(b/c)*(1+d*g*(1-1/n)))

display('is expanded as');
expand(ans2)


display('True Ans: F(n(t),b,d,m,g)=');

ans1=expand(M(P(B(n))))


% ans2-M(P(B(n)))

c = @(n) g*(1-1/n);

B = @(n) n +b/c(n)* n;
P = @(n) n -d*c(n)* n;
M = @(n) n+m;



% display('Your answer: F(n(t),b,d,m,g)=');
% ans2=(n+(b/c)*(1+d*g*(1-1/n)))
% 
% display('is expanded as');
% expand(ans2)
% 

display('True Ans: F(n(t),b,d,m,g)=');

ans2=expand(M(P(B(n))))



