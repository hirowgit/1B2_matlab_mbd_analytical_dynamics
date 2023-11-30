Nb=2;
xyN=Nb*2;
xID=1:2:xyN;
yID=2:2:xyN;
pRange=[-0.5 1.5; -1 1];

epsD=0.001;

rotA =@(th) [cos(th) -sin(th); sin(th) cos(th)];

L=cell(1,Nb);
L(1)={[-0.1 0;
       0 0;
       0.1 0]'};   
L(2)={[-0.3 0;
       0 0;
       0.3 0]'};  
  
Ctype={'axy','r','ay'};

Const{1}=[1 0;-1 0;0 0]; 
Const{2}=[1 2;1 -1];
Const{3}=[2;1; 0];

syms t
x = sym('x',[1 Nb]);
y = sym('y',[1 Nb]);
theta = sym('theta',[1 Nb]);
r =[x; y];

Kconst=[];
for i=1:length(Const)
    switch Ctype{i}
        case 'axy'
            key=Const{i};
            ID=key(1,1);
            Ltmp= L{ID};
            s=Ltmp(:,key(2,1)+2);
            Kconst=[Kconst;r(:,ID)+rotA(theta(ID))*s-key(3,:)'];
        case 'ax'
            key=Const{i};
            ID=key(1,1);
            Ltmp= L{ID};
            s=Ltmp(:,key(2,1)+2);
            Lp=r(:,ID)+rotA(theta(ID))*s;
            Kconst=[Kconst;Lp(1)-key(3,:)'];
        case 'ay'
            key=Const{i};
            ID=key(1,1);
            Ltmp= L{ID};
            s=Ltmp(:,key(2,1)+2);
            Lp=r(:,ID)+rotA(theta(ID))*s;
            Kconst=[Kconst;Lp(2)-key(3,:)'];
        case 'r'
            key=Const{i};
            ID1=key(1,1); ID2=key(1,2);
            Ltmp1= L{ID1};  Ltmp2= L{ID2};
            s1=Ltmp1(:,key(2,1)+2); s2=Ltmp2(:,key(2,2)+2);
            Kconst=[Kconst;r(:,ID1)+rotA(theta(ID1))*s1-(r(:,ID2)+rotA(theta(ID2))*s2)];
    end
    
end

Dconst=[theta(1)-t^2/2];
FullConst=[Kconst; Dconst];

Phi_f=matlabFunction(FullConst);
Phi_q=jacobian(FullConst,[x(1),y(1),theta(1),x(2),y(2),theta(2)]);
Phi_q_f=matlabFunction(Phi_q);

Phi_t=jacobian(FullConst,[t]);
Phi_t_f=matlabFunction(Phi_t);

dq = sym('dq',[Nb*3 1]);

Phi_q_dq_q=jacobian(Phi_q*dq,[x(1),y(1),theta(1),x(2),y(2),theta(2)]);
% Phi_q_t=jacobian(Phi_q,[t]);
Phi_t_t=jacobian(Phi_t,[t]);
gamma=-Phi_q_dq_q*dq-Phi_t_t;
gamma_f=matlabFunction(gamma);

% -Phi_q_f(0,0)\Phi_f(1,1,1,1,1,1,1)

iterN=800;
dt=0.025;

initP=[1 0;
       2 1;
       1 2;
       0 1]';
   
initTh=[0 0.5 1 1.5]*pi;

q = [0.1 0 0 0.5 0 0]';

initP=[q(1:2) q(4:5)];
initTh=[q(3) q(6)];

figure(1); clf
LinkM=[];

stepT=0;
pD=posCTranG2Lf(initP,initTh,L,Nb);
LinkM=plot(pD(xID,:)',pD(yID,:)','.-','LineWidth',2,'MarkerSize',32);
set(gca,'xlim',pRange(1,:),'ylim',pRange(2,:));
axis equal; 
grid on;
title(stepT);
axesP = gca;

cTh_full=[]
qD_full=[]
cPos_full=[]
for stepT=1:iterN
    Tdt=stepT*dt;
    
	iteration = 0; iconv = 1;
    
    dq(:)=1; k=1;
    % Newton–Raphson method
	while max(dq)>epsD && k<100
        PhiD_q=Phi_q_f(q(3),q(6));  % @(theta1,theta2)
        PhiD  =Phi_f(Tdt,q(3),q(6),q(1),q(4),q(2),q(5)); %  @(t,theta1,theta2,x1,x2,y1,y2)


		dq = -PhiD_q\PhiD;
		q  = q+dq;
        k  = k+1;
    end
    
    PhiD_q=Phi_q_f(q(3),q(6));  % @(theta1,theta2)
    etaD  = -Phi_t_f(Tdt); % @(t)
    qd    = PhiD_q\etaD;
    
    gamD  = gamma_f(qd(3),qd(6),q(3),q(6));   % @(dq3,dq6,theta1,theta2)
    qdd   = PhiD_q\gamD;
    
    cPos=[q(1:2) q(4:5)];
    cTh=[q(3) q(6)];
    pD=posCTranG2Lf(cPos,cTh,L,Nb);
    cTh_full=[cTh_full;cTh];
    qD_full=[qD_full q];
    cPos_full=[cPos_full ];
    disp(cPos)

    for j=1:Nb
        LinkM(j).XData=pD(xID(j),:); LinkM(j).YData=pD(yID(j),:);
    end
    axesP.Title.String=num2str(stepT);
    axesP.XLim=pRange(1,:);
    axesP.YLim=pRange(2,:);
    drawnow;

end
