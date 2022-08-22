f0=0; f1=1; f2=3; f3=2; f4=0;
x0=0; x1=1; x2=2; x3=3; x4=4;

fg=[0 1 3 2 0];
xx=[0 1 2 3 4];

% st ans
figure(8); clf
x1 = -1:0.001:0;
x2 = 0:0.001:1;
x3 = 1:0.001:2;
x4 = 2:0.001:3;
x5 = 3:0.001:4;
x6 = 4:0.001:5;

y1 = (15*x1)/28;
y2 = (13*x2.^3)/28 + (15*x2)/28;
y3 = (93*x3)/28 - (6*(x3 - 1).^3)/7 - (13*(x3 - 2).^3)/28 - 39/14;
y4 = (6*(x4 - 3).^3)/7 - (x4 - 2).^3/28 - (51*x4)/28 + 15/2;
y5 = (x5 - 4).^3/28 - (57*x5)/28 + 57/7;
y6 =  57/7 - (57*x6)/28;



plot(x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6), hold on;


plot(xx,fg,'r.','MarkerSize',20), hold on;
title('this Answer & true answer');

figure(9); clf

subplot(1,2,1); 
x=-1:0.1:5;
p1= @(x) (x.*(x-1).*(x-3).*(x-4))/4-(x.*(x-1).*(x-2).*(x-4))/2-(x.*(x-2).*(x-3).*(x-4))/6;

plot(x,p1(x),'b-'), hold on;
plot(xx,fg,'r.','MarkerSize',20), hold on;
set(gca,'xlim',[-1,5],'ylim',[-2,6]);
title('this Answer');

p1=@(x) (3*x.*(x - 1).*(x - 3).*(x - 4))/4 - (x.*(x - 1).*(x - 2).*(x - 4))/3 - (x.*(x - 2).*(x - 3).*(x - 4))/6;
subplot(1,2,2); 
  plot(x,p1(x),'b-'), hold on;
plot(xx,fg,'r.','MarkerSize',20), hold on;
set(gca,'xlim',[-1,5],'ylim',[-2,6]);
title('True Answer');



