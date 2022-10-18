clear;
figure(1); clf
 
b=0.5; d=0.2; m=3 ; g = 2;
%  g=0.01; b=0.02; d=0.03; m= 0.05;


func1 = @(n,c) n+b./c*n;   % Birth
func2 = @(n,c) n-d*c*n;    % Predation
func3 = @(n) n + m;   % Migration
func4 = @(n) g * (1-1/n);   % Census
 
n1=2; pn=[n1];
for i=1:10

    c4=func4(n1);
    n1=func1(n1,c4);
    n1=func2(n1,c4);
    n1=func3(n1);
    
    pn=[pn; n1];
end
hold on;
plot(pn,'r-');
 
xlabel('t');
ylabel('Birth,Predation,Migration,Census');
 