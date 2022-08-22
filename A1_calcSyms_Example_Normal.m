% syms t omega L
% sympref('MatrixWithSquareBrackets',true);
syms N c t g O theta tau
N=2;
c=1/2;
O=[0; 0];
p_c=@(theta)[cos(theta); sin(theta)];

x_i = sym('x',[N 1]);
y_i = sym('y',[N 1]);
phi_i = sym('phi',[N 1]);
Aphi_i = sym('Aphi',[N 1]);

tau_i = sym('tau',[N 1]);


for i=1:N
    strT=sprintf('%s(t)',phi_i(i));
    phi_i(i)=symfun(strT,t);
end

pre_Phi=0;
for i=1:N
    Aphi_i(i)=phi_i(i)+ pre_Phi;
    pre_Phi = pre_Phi + phi_i(i);
end

x_j = sym('x',[1 N]);
y_j = sym('y',[1 N]);
phi_j = sym('phi',[1 N]);

% x_j*x_i
% transpose(x_i)*x_i
% "Above two descriptions are equivalent"

Lc_i = sym('Lc',[N 1]); % The length to the center of mass of each link from each starting point (joint node)
L_i = sym('L',[N 1]);   % Each link length

m_i = sym('m',[N 1]);
Ic_i = sym('Ic',[N 1]);

K_i = sym('K',[N 1]);
U_i = sym('U',[N 1]);

% "Energy"
K=sum(K_i);
U=sum(U_i);

L=K-U;

disp('~~~~~~~~~~~~~~~~~~~~~~~~~~');
fprintf('L = %s\r\n',L);

disp('~~~~~~~~~~~~~~~~~~~~~~~~~~');
% "Position"
Lp_i = sym('Lp',[N 2]); % Local position from each starting point (joint node)

for i=1:N
    Lp_i(i,:)=transpose(Lc_i(i).*p_c(Aphi_i(i)));
    fprintf('Lp_%d = \r\n',i);
    fprintf('         %s\r\n',Lp_i(i,:));
    disp('~~~~~~~~~~~~~~~~~~~~~~~~~~');
end

% pre_Pos=O;
% disp('~~~~~~~~~~~~~~~~~~~~~~~~~~');
% for i=1:N
%     pre_Pos=pre_Pos+[x_i(i); y_i(i)];
%     fprintf('P_%d = \r\n',i);
%     fprintf('         %s\r\n',pre_Pos);
%     disp('~~~~~~~~~~~~~~~~~~~~~~~~~~');
% end

P_i = sym('P',[N 2]); % Local position from each starting point (joint node)

pre_Pos=[0; 0];
for i=1:N
    P_i(i,:)=transpose(Lp_i(i,:))+pre_Pos;
    pre_Pos=pre_Pos+L_i(i).*p_c(Aphi_i(i));
    fprintf('P_%d = \r\n',i);
    fprintf('         %s\r\n',P_i(i,:));
    disp('~~~~~~~~~~~~~~~~~~~~~~~~~~');
end
tP_i=transpose(P_i);
dP_i=diff(P_i,t);
i=1; latex(diff(tP_i(:,i),t))
i=2; latex(diff(tP_i(:,i),t))

i=1; dP_iTx{i}=latex(transpose(dP_i(i,:)));
i=2; dP_iTx{i}=latex(transpose(dP_i(i,:)));

i=1;
K_sub(i,1)=c*m_i(i)*dP_i(i,:)*transpose(dP_i(i,:))
K_sub(i,2)=c*Ic_i(i)*Aphi_i(i)^{2}

% K_i(i)=K1+K2;
K_i(i)=sum(K_sub(i,:));

i=2;
K_sub(i,1)=c*m_i(i)*dP_i(i,:)*transpose(dP_i(i,:))
K_sub(i,2)=c*Ic_i(i)*Aphi_i(i)^{2}

% K_i(i)=K1+K2;
K_i(i)=sum(K_sub(i,:));

K_i=simplify(K_i);
K_i=collect(K_i,Ic_i);
K_i=collect(K_i,m_i);

K=sum(K_i);

i=1;
U_i(i)=m_i(i)*g*P_i(i,2);
i=2;
U_i(i)=m_i(i)*g*P_i(i,2);

U_i=simplify(U_i);
U_i=collect(U_i,m_i);
U_i=collect(U_i,g);

U=sum(U_i);


% gg=latex(K_i(i));

gg1=convertTdotTeXF(K_i(1));
gg2=convertTdotTeXF(K_i(2));

L=K-U;

syms phi1
L1=subs(L,ph_i(1),phi_i(1));
L1=subs(L,phi1(t),phi_i(1));

% xjP = sym('xp',[1 N]);
% yjP = sym('yp',[1 N]);
% qpre = [xj; yj; phij]; q=qpre(:);
% 
% dq=makeDiffVal(q);
% qAll=[q; dq];



Rot = @(phi) ([cos(phi) -sin(phi); sin(phi) cos(phi)]);


r_j     =[x_j; y_j]; 

% k_i=circshift(k_j,[0 1]);

% sj=[xjP; yjP];
% k_j=1:N; 
%  si(:,1)=[1 0]'; 
%  sj(:,2)=[0 L]';