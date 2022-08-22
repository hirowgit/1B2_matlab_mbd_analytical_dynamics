display('IntegA [0 1] by Simpson Eq')
ndiv=10;
x0=0; x1=1;
h=(x1-x0)./ndiv;

x=x0:h:x1;
f=@(x) sqrt(1-x.^2);

for i=1:2:length(x)-2
    A(i)=h/3*(f(x(i))+4*f(x(i+1))+f(x(i+2)));
    
end

format long
IntegA=sum(A)
%     0.78174
% Ans= 0.781752039675810

% h=-0.1;
display('IntegA [1 0] by Simpson Eq')
ndiv=10;
x0=1; x1=0;
h=(x1-x0)./ndiv;
% if x0>x1 h=-h; end;

x=x0:h:x1;
f=@(x) sqrt(1-x.^2);

for i=1:2:length(x)-2
    A(i)=h/3*(f(x(i))+4*f(x(i+1))+f(x(i+2)));
    
end

format long
IntegA=sum(A)

% Ans= -0.781752039675810

