 % tominaga
clear all
syms t n g b d m

B = @(n) n +b/c* n;
P = @(n) n -d*c* n;
M = @(n) n+m;

c = @(n) g*(1-1/n);

display('True Ans: F(n(t),b,d,m,g)=');
Fn=M(P(B(n)));
expand(Fn)

display('Your answer: F(n(t),b,d,m,g)=');
Fny=g*(1-1/(1-d)*(1+b)*n+m);
expand(Fny)

% display('Your answer: F(n(t),b,d,m,g)=');
% Fny2=g*(1-1/((1-d)*(1+b))*n+m);
% expand(Fny2)

g0=1; b0=0.5; d0=0.2; m0=3; 

newEq=subs(Fn,[g b d m],[g0 b0 d0 m0]);

nd=10;
subs(newEq,n,nd)
dataAll=nd;
for i=1:10
    nd=double(subs(newEq,n,nd));
    dataAll(end+1)=nd;
end
hold on;
 plot(dataAll,'r-')