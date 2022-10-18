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

display('n(t+1) = F =');
expand(n5)

newEq=subs(n5,[g b d m],[0.01 0.02 0.03 0.5]);

nd=2;
subs(newEq,n,nd)
dataAll=nd;
for i=1:10
    nd=double(subs(newEq,n,nd));
    dataAll(end+1)=nd;
end

figure(8); clf; plot(dataAll)

% b + g + m - d*g^2 - g/n + b^2/(g - g/n) + (2*d*g^2)/n - (d*g^2)/n^2 + (b*g)/(g - g*n) - b*d*g + (b*g)/(g - g/n) + (b*m)/(g - g/n) - (2*b*d*g^2)/(g - g*n) - (b^2*d*g)/(g - g*n) + (b*d*g)/n + (b*d*g^2)/(- g*n^2 + g*n) - (b*d*g^2)/(g - g/n) - (b^2*d*g)/(g - g/n)
