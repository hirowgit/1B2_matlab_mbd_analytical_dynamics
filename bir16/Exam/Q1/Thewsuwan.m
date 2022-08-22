clear;
figure(1); clf
 
b=0.5; d=0.2; m=3 ; g = 2;
 g=0.01; b=0.02; d=0.03; m= 0.05;


func1 = @(n,c) n+b./c*n;   % Birth
func2 = @(n,c) n-d*c*n;    % Predation
func3 = @(n) n + m;   % Migration
func4 = @(c,n) g * (1-1/n);   % Census
 
n1=10; n2=10; n3=10; c4=10; pn=[];
for i=1:10
   
    n1=func1(n1,c4);
    n2=func2(n2,c4);
    n3=func3(n3);
    c4=func4(c4,n3);
    
    pn=[pn; n1 n2 n3 c4];
end
 
plot(pn);
 
xlabel('t');
ylabel('Birth,Predation,Migration,Census');
 