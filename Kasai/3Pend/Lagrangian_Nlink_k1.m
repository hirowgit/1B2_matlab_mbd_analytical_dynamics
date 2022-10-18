clear all;

N=2;        %çÑëÃêî

thi=sym('th',[1 N]);
dthi=sym('dth',[1 N]);
ddthi=sym('ddth',[1 N]);
m=sym('m',[1 N]);
I=sym('I',[1 N]);
l=sym('l',[1 N]);
lg=sym('lg',[1 N]);
syms g;

sum=0;
sumd=0;
s=[];
c=[];
sumth=[];
sumdth=[];
sums=[];
sumc=[];
for i=1:N
    sum=sum+thi(i);
    sumth=[sumth;sum];
    sumd=sumd+dthi(i);
    sumdth=[sumdth;sumd];
    s=[s;sin(thi(i))];
    c=[c;cos(thi(i))];
    sums=[sums;sin(sumth(i))];
    sumc=[sumc;cos(sumth(i))];
end

pi=0;
pci=0;
pc=[];

for i=1:N
    pci=pi+[lg(i)*sumc(i);lg(i)*sums(i)];
    pc=[pc;pci];
    pi=pi+[l(i)*sumc(i);l(i)*sums(i)];
end

dpi=0;
dpci=0;
dpc=[];

for i=1:N
    dpci=dpi+[-lg(i)*sums(i)*sumdth(i);lg(i)*sumc(i)*sumdth(i)];
    dpc=[dpc;dpci];
    dpi=dpi+[-l(i)*sums(i)*sumdth(i);l(i)*sumc(i)*sumdth(i)];
end

K=0;
Ki=0;

for i=1:N
   Ki=1/2*m(i)*([dpc(2*i-1) dpc(2*i)]*[dpc(2*i-1);dpc(2*i)])+1/2*I(i)*sumdth(i)^2;
   K=simplify(K+Ki);
end

P=0;
Pi=0;
ls=0;


for i=1:N
    lgs=ls+lg(i)*sums(i);
    Pi=m(i)*g*lgs;
    P=P+Pi;
    ls=ls+l(i)*sums(i);
end

%Lagrangian
L=simplify(K-P);

%àÍî âªóÕ
dL_ddth=[];
dt_dLddth=[];
tau=[];

for i=1:N
    dL_ddthi=simplify(diff(L,dthi(i)));
    dL_ddth=[dL_ddth;dL_ddthi];
end

for i=1:N
    dt_dLddthi=0;
    for j=1:N
        dt_dLddthi=dt_dLddthi+diff(dL_ddth(i),thi(j))*dthi(j)+diff(dL_ddth(i),dthi(j))*ddthi(j);
    end
    dt_dLddth=[dt_dLddth;dt_dLddthi];
    tau=[tau;simplify(dt_dLddth(i)-diff(L,thi(i)))];
end

%äµê´çsóÒ
MM=[];
for i=1:N
    MMj=[];
    for j=1:N
        MMij=simplify(diff(tau(i),ddthi(j)));
        MMj=[MMj MMij];
    end
    MM=[MM;MMj];
end
    
cg=[];
for i=1:N
    cgi=subs(tau(i),ddthi,zeros(1,N));
    cg=[cg;cgi];
end

gg=[];
for i=1:N
    ggi=simplify(diff(cg(i),g)*g);
    gg=[gg;ggi];
end

cc=[];
for i=1:N
    cci=simplify(cg(i)-gg(i));
    cc=[cc;cci];
end
