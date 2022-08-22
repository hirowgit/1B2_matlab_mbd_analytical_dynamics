fg=[0 1 3 2 0];
xx=[0 1 2 3 4];

figure(9); clf

subplot(1,2,1); 
x=-1:0.1:5;

p1= @(x) (x.^3 - 2*x2 -3*x.^2 +6*x -4*x.^2 +20*x-8)/(-6) +3*(x.^3 - x.^2 -7*x.^2 +17*x -12)/(2) +2*(x.^3 - 7*x.^2+12*x -8)/(-4)

plot(x,p1(x),'b-'), hold on;
plot(xx,fg,'r.','MarkerSize',20), hold on;
% set(gca,'xlim',[-1,5],'ylim',[-2,6]);
title('your answer');

p1=@(x) (3*x.*(x - 1).*(x - 3).*(x - 4))/4 - (x.*(x - 1).*(x - 2).*(x - 4))/3 - (x.*(x - 2).*(x - 3).*(x - 4))/6;
subplot(1,2,2); 
  plot(x,p1(x),'b-'), hold on;
plot(xx,fg,'r.','MarkerSize',20), hold on;
set(gca,'xlim',[-1,5],'ylim',[-2,6]);
title('Right answer');



