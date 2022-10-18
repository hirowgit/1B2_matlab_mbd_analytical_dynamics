%n変数のニュートンラプソン法(位置，速度，加速度解析)    
%newton_n1.m
clear
At=[0.0,0.0,0.0,0.0,0.0,pi/6]';%運動学拘束式の時間tによる

k=1;
for t=0.0:0.1:1.5
  x0=[0.5,-0.866,pi*5/3+pi*t/6,1.5,-1.0,6.14]';%xの初期値とyの初期値
  angle(k)=(5/3+t/6)*180;
  
    %位置解析
    while(1)
      [x,d,q,Aq]=posi_ana(x0,t);
      if d<=0.001 && q<=0.001
          x;
          break;
      end;
      x0=x;
    end
 
    %速度解析
    dx=Aq\At;
    
    %加速度解析
    y1=[0,0,1.5*dx(3)*cos(x(3)),0,0,0];
    y2=[0,0,1.5*dx(3)*sin(x(3)),0,0,0];
    y3=[0,0,1.5*dx(3)*cos(x(3)),0,0,2*dx(6)*cos(x(6))];
    y4=[0,0,1.5*dx(3)*sin(x(3)),0,0,2*dx(6)*sin(x(6))];
    y5=[0,0,0,0,0,0];
    y6=[0,0,0,0,0,0];
    
    bq=-[y1;y2;y3;y4;y5;y6];
    bq_dq=bq*dx;
    ddx=Aq\bq_dq;
    
    X1(k)=x(4);
    DX1(k)=dx(4);
    DDX1(k)=ddx(4);
    k=k+1;
end

figure(1);
subplot(311);
plot(angle,X1,'k');
grid on;
xlabel('角度[deg]');
ylabel('変位');
title('ボディ2のx方向の変位');
subplot(312);
plot(angle,DX1,'k');
grid on;
xlabel('角度[deg]');
ylabel('速度');
title('ボディ2のx方向の速度');
subplot(313);
plot(angle,DDX1,'k');
grid on;
xlabel('角度[deg]');
ylabel('加速度');
title('ボディ2のx方向の加速度');


