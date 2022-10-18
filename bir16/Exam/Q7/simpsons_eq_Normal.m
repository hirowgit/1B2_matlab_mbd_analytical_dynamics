% h=0.1;
ndiv=10;
x0=0; x1=1;
h=(x1-x0)./ndiv;
% if x0>x1 h=-h; end;

x=x0:h:x1;
f=@(x) sqrt(1-x.^2);

for i=1:2:length(x)-2
    A(i)=h/3*(f(x(i))+4*f(x(i+1))+f(x(i+2)));
    
end

format long
IntegA=sum(A)
%     0.78174
    