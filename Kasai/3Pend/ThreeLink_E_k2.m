close all; clear all;

clf
%maxL=50000;
maxL=2000;
itr = 1;



% Runge Kutta Gill's parameters  
cq = [2.0 1.0 1.0 2.0];
ch = [0.0 0.5 0.5 1.0];
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
Ic=I;
tau=[T1 T2 T3];
theta=[A;B;C];
% theta=[0*(pi./180); 0*(pi./180); 0*(pi./180)];
d_theta=[0; 0; 0];
Mm=[MM_3Link(11,I,m,L,Lg,theta) MM_3Link(12,I,m,L,Lg,theta) MM_3Link(13,I,m,L,Lg,theta); MM_3Link(21,I,m,L,Lg,theta) MM_3Link(22,I,m,L,Lg,theta) MM_3Link(23,I,m,L,Lg,theta); MM_3Link(31,I,m,L,Lg,theta) MM_3Link(32,I,m,L,Lg,theta) MM_3Link(33,I,m,L,Lg,theta)]; invM=Mm^(-1);
tau=[T1; T2; T3];  hh=[ccfunc_3Link(1,I,m,L,Lg,theta,d_theta); ccfunc_3Link(2,I,m,L,Lg,theta,d_theta); ccfunc_3Link(3,I,m,L,Lg,theta,d_theta)]; gg=[gcfunc_3Link(1,I,m,L,Lg,theta); gcfunc_3Link(2,I,m,L,Lg,theta); gcfunc_3Link(3,I,m,L,Lg,theta)];
dd_theta =invM*(tau-hh-grav.*gg);

qtheta=zeros(size(theta));
qd_theta=zeros(size(d_theta));
qdd_theta=zeros(size(dd_theta));

pre_theta=theta;
pre_d_theta=d_theta;
pre_dd_theta=dd_theta;

%ポテンシャルエネルギー
U1=m(1)*grav*Lg(1)*(sin(theta(1))+1);
U2=m(2)*grav*(L(1)*sin(theta(1))+Lg(2)*sin(theta(1)+theta(2))+L(1)+Lg(2));
U3=m(3)*grav*(L(1)*sin(theta(1))+L(2)*sin(theta(1)+theta(2))+Lg(3)*sin(theta(1)+theta(2)+theta(3))+L(1)+L(2)+Lg(3));
U=U1+U2+U3;

%運動エネルギー
K1=1/2*m(1)*Lg(1)^2*d_theta(1)^2+1/2*Ic(1)*d_theta(1)^2;
K2=1/2*m(2)*(L(1)^2*d_theta(1)^2+2*L(1)*Lg(2)*cos(theta(2))*(d_theta(1)^2+d_theta(1)*d_theta(2))+Lg(2)^2*(d_theta(1)+d_theta(2))^2)+1/2*Ic(2)*(d_theta(1)+d_theta(2))^2;
dpc3=[-L(1)*sin(theta(1))*d_theta(1)-L(2)*sin(theta(1)+theta(2))*(d_theta(1)+d_theta(2))-Lg(3)*sin(theta(1)+theta(2)+theta(3))*(d_theta(1)+d_theta(2)+d_theta(3));
    L(1)*cos(theta(1))*d_theta(1)+L(2)*cos(theta(1)+theta(2))*(d_theta(1)+d_theta(2))+Lg(3)*cos(theta(1)+theta(2)+theta(3))*(d_theta(1)+d_theta(2)+d_theta(3))];

K3=1/2*m(3)*(dpc3.'*dpc3)+1/2*Ic(3)*(d_theta(1)+d_theta(2)+d_theta(3))^2;

K=K1+K2+K3;

%力学的エネルギー
E=U+K;

pre_U=U;
pre_K=K;
pre_E=E;

for i=1:maxL %150

	% Runge Kutta method to calculate differential equations	
	for jr=1:4 
        
        Mm=[MM_3Link(11,I,m,L,Lg,theta) MM_3Link(12,I,m,L,Lg,theta) MM_3Link(13,I,m,L,Lg,theta); MM_3Link(21,I,m,L,Lg,theta) MM_3Link(22,I,m,L,Lg,theta) MM_3Link(23,I,m,L,Lg,theta); MM_3Link(31,I,m,L,Lg,theta) MM_3Link(32,I,m,L,Lg,theta) MM_3Link(33,I,m,L,Lg,theta)]; invM=Mm^(-1);
        tau=[T1; T2; T3];  hh=[ccfunc_3Link(1,I,m,L,Lg,theta,d_theta); ccfunc_3Link(2,I,m,L,Lg,theta,d_theta); ccfunc_3Link(3,I,m,L,Lg,theta,d_theta)]; gg=[gcfunc_3Link(1,I,m,L,Lg,theta); gcfunc_3Link(2,I,m,L,Lg,theta); gcfunc_3Link(3,I,m,L,Lg,theta)];
        dd_theta =invM*(tau-hh-grav.*gg);
        
        F_d_theta=dd_theta;
        ak= h .* F_d_theta ;
		rd = (ak - cq(jr).* qd_theta) .* ckq(jr) ; d_theta = d_theta + rd ;
		qd_theta = qd_theta + 3.0 .* rd - ck(jr) .* ak ;
        
        F_theta =d_theta;
        ak= h .* F_theta ;
		rth = (ak - cq(jr).* qtheta) .* ckq(jr) ; theta = theta + rth ;
		qtheta = qtheta + 3.0 .* rth - ck(jr) .* ak ;

    end
    
    U1=m(1)*grav*Lg(1)*(sin(theta(1))+1);
    U2=m(2)*grav*(L(1)*sin(theta(1))+Lg(2)*sin(theta(1)+theta(2))+L(1)+Lg(2));
    U3=m(3)*grav*(L(1)*sin(theta(1))+L(2)*sin(theta(1)+theta(2))+Lg(3)*sin(theta(1)+theta(2)+theta(3))+L(1)+L(2)+Lg(3));
    U=U1+U2+U3;
    
    %運動エネルギー
    K1=1/2*m(1)*Lg(1)^2*d_theta(1)^2+1/2*Ic(1)*d_theta(1)^2;
    K2=1/2*m(2)*(L(1)^2*d_theta(1)^2+2*L(1)*Lg(2)*cos(theta(2))*(d_theta(1)^2+d_theta(1)*d_theta(2))+Lg(2)^2*(d_theta(1)+d_theta(2))^2)+1/2*Ic(2)*(d_theta(1)+d_theta(2))^2;
    dpc3=[-L(1)*sin(theta(1))*d_theta(1)-L(2)*sin(theta(1)+theta(2))*(d_theta(1)+d_theta(2))-Lg(3)*sin(theta(1)+theta(2)+theta(3))*(d_theta(1)+d_theta(2)+d_theta(3));
        L(1)*cos(theta(1))*d_theta(1)+L(2)*cos(theta(1)+theta(2))*(d_theta(1)+d_theta(2))+Lg(3)*cos(theta(1)+theta(2)+theta(3))*(d_theta(1)+d_theta(2)+d_theta(3))];

    K3=1/2*m(3)*(dpc3.'*dpc3)+1/2*Ic(3)*(d_theta(1)+d_theta(2)+d_theta(3))^2;
    K=K1+K2+K3;

    %力学的エネルギー
    E=U+K;
    
 
% show time course
    
    figure(1);  
    subplot(3,1,1);
	plot([i-1,i],[pre_U,U],'Color',[0 0 0]), hold on;
% 	plot([i-1,i],[pre_yy(1),yy(1)],'Color',[0 0.5 1]), hold on;
    xlabel('sec'),hold on;
    ylabel('ポテンシャルエネルギー[J]'),hold on;
    
    subplot(3,1,2);
	plot([i-1,i],[pre_K,K],'Color',[0 0 0]), hold on;
	xlabel('sec'),hold on;
    ylabel('運動エネルギー[J]'),hold on;
    
    subplot(3,1,3);
	plot([i-1,i],[pre_E,E],'Color',[0 0 0]), hold on;
    ylim([40 50]),hold on;
	xlabel('sec'),hold on;
    ylabel('力学的エネルギー[J]');
    
    figure(2);
    plot([0 cos(theta(1))],[0 sin(theta(1))],[cos(theta(1)) cos(theta(1)+theta(2))+cos(theta(1))],[sin(theta(1)) sin(theta(1)+theta(2))+sin(theta(1))],[cos(theta(1)+theta(2))+cos(theta(1)) cos(sum(theta))+cos(theta(1)+theta(2))+cos(theta(1))],[sin(theta(1)+theta(2))+sin(theta(1)) sin(sum(theta))+sin(theta(1)+theta(2))+sin(theta(1))],'LineWidth',3);
    grid on; axis equal;     axis([-3.5 3.5 -3.5 3.5]); 
    
%     if (mod(i,100)==0) drawnow; end
	
    pre_theta=theta;
    pre_d_theta=d_theta;
    pre_dd_theta=dd_theta;
    pre_U=U;
    pre_K=K;
    pre_E=E;
    
    
    if itr==0 break; end
end
drawnow;


% end