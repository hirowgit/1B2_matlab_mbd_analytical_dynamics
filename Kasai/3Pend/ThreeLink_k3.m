close all; clear all;

clf
%maxL=50000;
maxL=2000;
itr = 1;

%movie
Flag_write_Movie=1; 
Flag_draw_fig=1; 
Nm=3;

ttt = clock;
timeStampStr = sprintf('%d_%02d%02d_%02d%02d', ttt(1), ttt(2), ttt(3), ttt(4), ttt(5));

f_prefix=strcat('outMovie',timeStampStr);
if Flag_write_Movie == 1 && Flag_draw_fig==1
    MovieFileName = strcat(f_prefix,num2str(Nm),'_body1.mov'); 
    fprintf('Creating the movie file %s.\n', MovieFileName);
    MakeQTMovie('start',MovieFileName);
    MakeQTMovie('size', [480 360]);
%     MakeQTMovie('size', [G_width G_height]);
    MakeQTMovie('quality', 1.0);
%     fps = 50; 
    fps = 30;
end

% Runge Kutta Gill's parameters  
cq = [2.0 1.0 1.0 2.0];
ch = [0.5 0.0 0.5 0.0];
ckq = [0.5 0.29289321881345248 1.70710678118654752 0.16666666666666666];
ck = [0.5 0.29289321881345248 1.70710678118654752 0.5];
h = 0.005;

% figure setting
% figure(2);clf; 
figure(1);clf;

subplot(2,1,1);
% set(gcfunca,'xlim',[0 maxL],'ylim',[0 2*pi]), hold on;
% set(gcfunca,'xlim',[0 maxL]), hold on;

subplot(2,1,2);
% set(gcfunca,'xlim',[0 maxL],'ylim',[-1 1]),hold on;
% set(gcfunca,'xlim',[0 maxL]),hold on;

% initial values

A = 0*(pi./180); 
B = 0*(pi./180); 
C = 0*(pi./180); 
T1 = 0; 
T2 = 0; 
T3 = 0; 
grav=9.8;
m=[1; 1; 1];
L=[1; 1; 1];
Lg=L./2;
I=m.*L.^2./12;
tau=[0 0 0];
theta=[0*(pi./180); 0*(pi./180); 0*(pi./180)];
% theta=[0*(pi./180); 0*(pi./180); 0*(pi./180)];
d_theta=[0; 0; 0];
dd_theta=[0; 0; 0];

qtheta=zeros(size(theta));
qd_theta=zeros(size(d_theta));
qdd_theta=zeros(size(dd_theta));

pre_theta=theta;
pre_d_theta=d_theta;
pre_dd_theta=dd_theta;

for i=1:maxL %150

	% Runge Kutta method to calculate differential equations	
	for jr=1:4 
		F_theta =d_theta;

        ak= h .* F_theta ;
		rth = (ak - cq(jr).* qtheta) .* ckq(jr) ; theta = theta + rth ;
		qtheta = qtheta + 3.0 .* rth - ck(jr) .* ak ;
        
        Mm=[MM_3Link(11,I,m,L,Lg,theta) MM_3Link(12,I,m,L,Lg,theta) MM_3Link(13,I,m,L,Lg,theta); MM_3Link(21,I,m,L,Lg,theta) MM_3Link(22,I,m,L,Lg,theta) MM_3Link(23,I,m,L,Lg,theta); MM_3Link(31,I,m,L,Lg,theta) MM_3Link(32,I,m,L,Lg,theta) MM_3Link(33,I,m,L,Lg,theta)]; invM=Mm^(-1);
        tau=[T1; T2; T3];  hh=[ccfunc_3Link(1,I,m,L,Lg,theta,d_theta); ccfunc_3Link(2,I,m,L,Lg,theta,d_theta); ccfunc_3Link(3,I,m,L,Lg,theta,d_theta)]; gg=[gcfunc_3Link(1,I,m,L,Lg,theta); gcfunc_3Link(2,I,m,L,Lg,theta); gcfunc_3Link(3,I,m,L,Lg,theta)];
        dd_theta =invM*(tau-hh-grav.*gg);
        
        F_d_theta=dd_theta;
        ak= h .* F_d_theta ;
		rd = (ak - cq(jr).* qd_theta) .* ckq(jr) ; d_theta = d_theta + rd ;
		qd_theta = qd_theta + 3.0 .* rd - ck(jr) .* ak ;

    end
 
% show time course
    figure(1);  
    subplot(3,1,1);
	plot([i-1,i],[pre_theta(1),theta(1)],'Color',[0 0 0]), hold on;
	plot([i-1,i],[pre_theta(1)+pre_theta(2),theta(1)+theta(2)],'Color',[0 0.5 1]), hold on;
    plot([i-1,i],[sum(pre_theta),sum(theta)],'Color',[1 0 1]), hold on;
% 	plot([i-1,i],[pre_yy(1),yy(1)],'Color',[0 0.5 1]), hold on;
    title('t - ƒÆ'),hold on;
    xlabel('ŽžŠÔ'),hold on;
    ylabel('Šp“x[rad]'),hold on;
    
    subplot(3,1,2);
	plot([i-1,i],[pre_d_theta(1),d_theta(1)],'Color',[0 0 0]), hold on;
	plot([i-1,i],[pre_d_theta(2),d_theta(2)],'Color',[0 0.5 1]), hold on;
    plot([i-1,i],[pre_d_theta(3),d_theta(3)],'Color',[1 0 1]), hold on;
	title('t - dƒÆ/dt'),hold on;
    xlabel('ŽžŠÔ'),hold on;
    ylabel('Šp‘¬“x[rad/s]'),hold on;
    
    subplot(3,1,3);
	plot([i-1,i],[pre_dd_theta(1),dd_theta(1)],'Color',[0 0 0]), hold on;
	plot([i-1,i],[pre_dd_theta(2),dd_theta(2)],'Color',[0 0.5 1]), hold on;
    plot([i-1,i],[pre_dd_theta(3),dd_theta(3)],'Color',[1 0 1]), hold on;
	title('t - d/dt(dƒÆ/dt)'),hold on;
    xlabel('ŽžŠÔ'),hold on;
    ylabel('Šp‰Á‘¬“x[rad/s^2]');
    
    figure(2);
    %plot([0 cos(theta(1))],[0 sin(theta(1))],[cos(theta(1)) cos(theta(1)+theta(2))+cos(theta(1))],[sin(theta(1)) sin(theta(1)+theta(2))+sin(theta(1))],[cos(theta(1)+theta(2))+cos(theta(1)) cos(sum(theta))+cos(theta(1)+theta(2))+cos(theta(1))],[sin(theta(1)+theta(2))+sin(theta(1)) sin(sum(theta))+sin(theta(1)+theta(2))+sin(theta(1))],'LineWidth',3),hold on;
    plot([cos(pre_theta(1)) cos(theta(1))],[sin(pre_theta(1)) sin(theta(1))],'Color',[0 0 0]),hold on;
    plot([cos(pre_theta(1))+cos(pre_theta(1)+pre_theta(2)) cos(theta(1))+cos(theta(1)+theta(2))],[sin(pre_theta(1))+sin(pre_theta(1)+pre_theta(2)) sin(theta(1))+sin(theta(1)+theta(2))],'Color',[0 0.5 1]),hold on;
    plot([cos(pre_theta(1))+cos(pre_theta(1)+pre_theta(2))+cos(pre_theta(1)+pre_theta(2)+pre_theta(3)) cos(theta(1))+cos(theta(1)+theta(2))+cos(theta(1)+theta(2)+theta(3))],[sin(pre_theta(1))+sin(pre_theta(1)+pre_theta(2))+sin(pre_theta(1)+pre_theta(2)+pre_theta(3)) sin(theta(1))+sin(theta(1)+theta(2))+sin(theta(1)+theta(2)+theta(3))],'Color',[1 0 1]),hold on;
    grid on; axis equal;     axis([-3.5 3.5 -3.5 3.5]); 
    
%     if (mod(i,100)==0) drawnow; end
	
    pre_theta=theta;
    pre_d_theta=d_theta;
    pre_dd_theta=dd_theta;
    
    if Flag_write_Movie == 1 && Flag_draw_fig==1
        MakeQTMovie('addfigure');
    end
    
    if itr==0 break; end
end
drawnow;

if Flag_write_Movie == 1 && Flag_draw_fig==1
    MakeQTMovie('addfigure');
    MakeQTMovie('addfigure');
end    

if Flag_write_Movie == 1 && Flag_draw_fig==1
    MakeQTMovie('framerate', fps);
    MakeQTMovie('finish');
end
% end