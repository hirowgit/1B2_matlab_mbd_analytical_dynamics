syms x

f=@(n) (sin(n));

res=diff('sin(x)',x);


f2=@(x) (res);

sin(x)