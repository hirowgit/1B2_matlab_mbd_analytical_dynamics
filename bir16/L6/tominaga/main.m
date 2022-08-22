% ==========MATLAB code==========
%�ϐ��̃j���[�g�����v�\���@�i�ʒu�A���x�A�����x��́j
%newton_n1.m

clear

At = [0.0, 0.0, 0.0, 0.0, 0.0, pi/6]'; %�^���w�S�����̂��ɂ�����

k = 1;
for t = 0.0:0.1:1.5
x0 = [0.75, -0.457, pi*5/3+pi*t/6, 1.58973, -1, 327.112]'; %���̏����l�Ƃ��̏����l

angle(k) = (5/3 + t/6)*180;
%�ʒu���
while(1)
[x, d, q, Aq] = posi_ana(x0, t);

if d <= 0.001 & q <= 0.001
x;
break;
end;
x0 = x;
end

%���x��́@
dx = Aq\At;

%�����x���
y1 = [0, 0, dx(3)*cos(x(3)), 0, 0, 0];
y2 = [0, 0, dx(3)*sin(x(3)), 0, 0, 0];
y3 = [0, 0, dx(3)*cos(x(3)), 0, 0, dx(6)*cos(x(6))];
y4 = [0, 0, dx(3)*sin(x(3)), 0, 0, dx(6)*sin(x(6))];
y5 = [0, 0, 0, 0, 0, 0];
y6 = [0, 0, 0, 0, 0, 0];

bq = -[y1; y2; y3; y4; y5; y6];
bq_dq = bq*dx;
ddx = Aq\bq_dq;

X1(k) = x(4);
DX1(k) = dx(4);
DDX1(k) = ddx(4);
k = k + 1;
end

figure(1);
subplot(311);
plot(angle, X1, 'k');

grid on;
xlabel('�p�x[deg]');
ylabel('�ψ�');
title('�{�f�B2�̂������̕ψ�');
subplot(312);
plot(angle,DX1,'k');
grid on;
xlabel('�p�x[deg]');
ylabel('���x');
title('�{�f�B2�̂������̑��x');
subplot(313);
plot(angle,DDX1,'k');
grid on;
xlabel('�p�x[deg]');
ylabel('�����x');
title('�{�f�B2�̂������̉����x');

