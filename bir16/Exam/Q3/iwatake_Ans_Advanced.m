clear all
fg=[0 1 3 2 0];
xx=[0 1 2 3 4];

h=0.001;
% st ans
figure(8); clf
w=1;
basex=repmat(0:h:1-h,[length(xx)+1 1])';
xn=repmat([xx(1)-w xx],[size(basex,1) 1]);
xn=xn+basex;    

yn(:,1) =  (27*xn(:,1))/28
yn(:,2) = xn(:,2).^3/28 + (27*xn(:,2))/28
yn(:,3) = (33*xn(:,3))/28 - (xn(:,3) - 1).^3/7 - (xn(:,3) - 2).^3/28 - 3/14
yn(:,4) = (9*xn(:,4))/28 - (13*(xn(:,4) - 2).^3)/28 + (xn(:,4) - 3).^3/7 + 3/2
yn(:,5) = (13*(xn(:,5) - 4).^3)/28 - (69*xn(:,5))/28 + 69/7
yn(:,6) = 69/7 - (69*xn(:,6))/28

% yn(:,1) = (15*xn(:,1))/28;
% yn(:,2) = (13*xn(:,2).^3)/28 + (15*xn(:,2))/28;
% yn(:,3) = (93*xn(:,3))/28 - (6*(xn(:,3) - 1).^3)/7 - (13*(xn(:,3) - 2).^3)/28 - 39/14;
% yn(:,4) = (6*(xn(:,4) - 3).^3)/7 - (xn(:,4) - 2).^3/28 - (51*xn(:,4))/28 + 15/2;
% yn(:,5) = (xn(:,5) - 4).^3/28 - (57*xn(:,5))/28 + 57/7;
% yn(:,6) =  57/7 - (57*xn(:,6))/28;

plot(xn,yn), hold on;


plot(xx,fg,'r.','MarkerSize',20), hold on;
title('this Answer & true answer');

% figure(9); clf
% 
% subplot(1,2,1); 
% x=-1:0.1:5;
% p1= @(x) (x.*(x-1).*(x-3).*(x-4))/4-(x.*(x-1).*(x-2).*(x-4))/2-(x.*(x-2).*(x-3).*(x-4))/6;
% 
% plot(x,p1(x),'b-'), hold on;
% plot(xx,fg,'r.','MarkerSize',20), hold on;
% set(gca,'xlim',[-1,5],'ylim',[-2,6]);
% title('this Answer');
% 
% p1=@(x) (3*x.*(x - 1).*(x - 3).*(x - 4))/4 - (x.*(x - 1).*(x - 2).*(x - 4))/3 - (x.*(x - 2).*(x - 3).*(x - 4))/6;
% subplot(1,2,2); 
%   plot(x,p1(x),'b-'), hold on;
% plot(xx,fg,'r.','MarkerSize',20), hold on;
% set(gca,'xlim',[-1,5],'ylim',[-2,6]);
% title('True Answer');
% 


