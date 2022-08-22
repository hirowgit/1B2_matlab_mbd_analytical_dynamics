%Tominaga

clear;
clc;

syms x1 x2 x3 x4 y1 y2 y3 y4 f1 f2 f3 f4 dx1 dy1 df1 dx2 dy2 df2 dx3 dy3 df3 dx4 dy4 df4 w t

H = [ x1, y1, f1;
x2, y2, f2;
x3, y3, f3;
x4, y4, f4;
];

Hx = [ 
0, -1;
1, -2;
2, 2;
-2, 2;
];

Hy = zeros(4 , 2);


for i = 1:4
j = rem(i+2, 4) + 1;
k = rem(i+3, 4) + 1;

Kx = H(j,1) + Hx(k,1)*cos(H(j,3)) - Hy(k,1)*sin(H(j,3)) - H(k,1)-Hx(k,2)*cos(H(k,3)) + Hy(k,2)*sin(H(k,3));
Ky = H(j,2) + Hx(k,1)*sin(H(j,3)) + Hy(k,1)*cos(H(j,3)) - H(k,2)-Hx(k,2)*sin(H(k,3)) - Hy(k,2)*cos(H(k,3));

G((2*i-1),1) = Kx;
G(2*i,1) = Ky;

end

A = [x4; y4; f4; f4-w*t];
G = [G; A];
fprintf('回転ジョイントの拘束式\n');
disp(G);

q = [x1 y1 f1 x2 y2 f2 x3 y3 f3 x4 y4 f4];
dq = [dx1 dy1 df1 dx2 dy2 df2 dx3 dy3 df3 dx4 dy4 df4];
J = jacobian(G, q);
fprintf('ヤコビアン\n');
disp(J);

Ft = diff(G,t);
Ftt = diff(Ft,t);
Fqt = diff(J,t);

fprintf('Ft\n');
disp(Ft);
fprintf('Ftt\n');
disp(Ftt);
fprintf('Fqt\n');
disp(Fqt);

Fqdq = J * dq';
Fqdqq = jacobian(Fqdq,q);
Fqdqqdq = Fqdqq * dq';

fprintf('Fqdq=\n');
disp(Fqdq);
fprintf('(Fqdq)q=\n');
disp(Fqdqq);
fprintf('(Fqdq)qdq=\n');
disp(Fqdqqdq);