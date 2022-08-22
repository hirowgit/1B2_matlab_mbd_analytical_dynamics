fg=[0 1 3 2 0];
xx=[0 1 2 3 4];

figure(9); clf

subplot(1,2,1); 
x=-1:0.1:5;

p1= @(X) 3*(X/2 - 2).*(X - 1).*(X - 3) - (X/2 - 3/2).*(X/3 - 4/3).*(X - 2) - 2*(X/2 - 1/2).*(X - 2).*(X - 4)

plot(x,p1(x),'b-'), hold on;
plot(xx,fg,'r.','MarkerSize',20), hold on;
set(gca,'xlim',[-1,5],'ylim',[-2,6]);
title('your answer');

p1=@(x) (3*x.*(x - 1).*(x - 3).*(x - 4))/4 - (x.*(x - 1).*(x - 2).*(x - 4))/3 - (x.*(x - 2).*(x - 3).*(x - 4))/6;
subplot(1,2,2); 
  plot(x,p1(x),'b-'), hold on;
plot(xx,fg,'r.','MarkerSize',20), hold on;
set(gca,'xlim',[-1,5],'ylim',[-2,6]);
title('Right answer');



