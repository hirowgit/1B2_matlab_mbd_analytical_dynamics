figure(1); clf
clear all % この場合、プログラムの最初には変数をクリア

b=0.5; d=0.2; m=3; g=1;

c = @(n) g*(1-1/n)*n
func1 = @(n) n+b/c(n)*n
func2 = @(n) n-d*c(n)*n
func3 = @(n) n+m

 
n1=10; 
% n2=0; n3=0; n4=0; 不用
% c=3; 誤り 
pn=[];
for i=1:10
    
    n1=func1(n1);
    n2=func2(n1);
    n3=func3(n2);
%     n4=func4(n3);
    n4=c(n1);
 
    pn=[pn; n1 n2 n3 n4];
end
 
plot(pn);
 
xlabel('t');
ylabel('n1,n2,n3,n4');