%脳型知能創発課題07

syms x1 y1 fai1 x2 y2 fai2 x3 y3 fai3 x4 y4 fai4 t omega x1d y1d fai1d x2d y2d fai2d x3d y3d fai3d x4d y4d fai4d%12変位+2変数
%syms x1d y1d fai1d x2d y2d fai2d x3d y3d fai3d x4d y4d fai4d %12速度

%拘束条件式：faikq=0
faikq=[-x1+cos(fai1)+x4;
       -y1+sin(fai1)+y4;
       -x1-cos(fai1)+x2-2*cos(fai2);
       -y1-sin(fai1)+y2-2*sin(fai2);
       -x2-cos(fai2)+x3+2*cos(fai3);
       -y2-sin(fai2)+y3+2*sin(fai3);
       -x3+cos(fai3)+x4+2*cos(fai4);
       -y3+sin(fai3)+y4+2*sin(fai4);
       x4;
       y4;
       fai4;
       fai1-omega*t];
   
q=[x1;y1;fai1;x2;y2;fai2;x3;y3;fai3;x4;y4;fai4];
qd=[x1d;y1d;fai1d;x2d;y2d;fai2d;x3d;y3d;fai3d;x4d;y4d;fai4d];

%ヤコビ行列
Jqt=jacobian(faikq,q);

%(Jqt*qd)をqdで偏微分(10ページの答え)
F=jacobian(Jqt*qd,q)

%(11ページの答え)
K=F*qd