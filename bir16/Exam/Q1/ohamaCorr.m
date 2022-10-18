clear all
figure(1); clf

% [g b d m]
g=0.01; b=0.02; d=0.03; m= 0.05; %c=1;
% b=0.5; c=1; d=0.2; m=3; g=0.5;
func1 = @(n,b,c) (((n+m)-d*c*(n+m))*b/c*((n+m)-d*c*(n+m)));
func2 = @(n,g) (g*(1-1/n));

n=2; pn=[];
for i=1:10
    c=func2(n,g);
    n=func1(n,b,c);
    pn=[pn; n];
end
 
plot(pn);
xlabel('t');
ylabel('n');