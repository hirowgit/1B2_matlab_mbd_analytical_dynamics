figure;clf;
clear all;close all
t=0:0.05:1;
x = t; x1 = 1; x2 = 2 ;x3 = 3; x4 = 4;
f = 0; f1 = 1; f2 = 3; f3 = 2; f4 = 0;
count = 1;
for t = 0:0.05:1 
p1 = ((t-x2)*(t-x3)./(x1-x2)*(x1-x3)).*f1 + ((x1-x1)*(x1-x3)./(x2-x1)*(x2-x3)).*f2 + ((x1-x1)*(x1-x2)./(x3-x1)*(x3-x2)).*f3;
p2 = ((x2-x2)*(x2-x3)./(x1-x2)*(x1-x3)).*f1 + ((x2-x1)*(x2-x3)./(x2-x1)*(x2-x3)).*f2 + ((x2-x1)*(x2-x2)./(x3-x1)*(x3-x2)).*f3;
p3 = ((x3-x2)*(x3-x3)./(x1-x2)*(x1-x3)).*f1 + ((x3-x1)*(x3-x3)./(x2-x1)*(x2-x3)).*f2 + ((x3-x1)*(x3-x2)./(x3-x1)*(x3-x2)).*f3;

P3(count,1) = p1+p2+p3;
count = count+1;
end
plot(P3),hold on
xlabel('t')
ylabel('P3')

fg=[0 1 3 2 0];
xx=[0 1 2 3 4];
plot(xx,fg,'r.','MarkerSize',20), hold on;
% set(gca,'xlim',[-1,5],'ylim',[-2,6]);
title('your answer');