syms x
N=5;  
xj = sym('x',[N 1]);
fj = sym('f',[N 1]);
hj = sym('h',[N-1 1]);

Mj = sym('M',[N 1]);
Sj = sym('S',[N 1]);

xj=[0 1 2 3 4];
fj=[0 2 3 1 0];

hj=xj(2:N)-xj(1:N-1);
aj=hj(1:N-2)./(hj(2:N-1)+hj(1:N-2));
bj=1-aj;
cj=(fj(2:N)-fj(1:N-1))./hj;
dj=[6*(cj(2:N-1)-cj(1:N-2))./(hj(2:N-1)+hj(1:N-2))]';

diag_elem=2.*ones(1,N-2);
Aij=diag(diag_elem);
for k=2:N-2
    Aij(k,k-1)=aj(k);
    Aij(k-1,k)=bj(k-1);
end    
%------------

% Aij=[2 1/2 0; 1/2 2 1/2; 0 1/2 2];
% M=[M2 M3 M4];
% dj=[-3 -9 3]';

Eqn = Aij*Mj(2:N-1)==dj;

SolvedVariables = solve(Eqn);
cellSolutions=struct2cell(SolvedVariables);  % struct -> cell
cellSolutions{:};  
% matS2=cell2mat(cellfun(@double,cellSolutions,'UniformOutput', false)); %
% cell -> mat

for j=2:size(Mj,1)
if isfield(SolvedVariables, char(Mj(j)))
    valName=char(Mj(j));
    Mval(j)=getfield(SolvedVariables, char(Mj(j)));
    stOut =sprintf('%s = %s\n',valName,char(Mval(j)));
    display(stOut);
else 
%     display('empty');
end

end
Mval=[Mval 0];
for j=1:size(Mj,1)-1
    Sj(j)=Mval(j)/(6*hj(j))*(xj(j+1)-x)^3+Mval(j+1)/(6*hj(j))*(x-xj(j))^3 ...
    +(fj(j)-Mval(j)*hj(j)^2/6)*(xj(j+1)-x)/hj(j)+(fj(j+1)-Mval(j+1)*hj(j)^2/6)*(x-xj(j))/hj(j);

end

finalSj=[subs(diff(Sj(1)),x,xj(1))*(x-xj(1))+fj(1); 
    Sj(1:N-1); 
subs(diff(Sj(N-1)),x,xj(N))*(x-xj(N))+fj(N);]

ExpFinalSj=expand(finalSj);
display(ExpFinalSj);

% ---------- Textbook Answer -----------
syms x
ansSj = sym('aS',[N+1 1]);

ansSj=[57/28*x; (-1/28)*x^3+(57/28)*x;  (-1/28)*(2-x)*(x^2-4*x-53)-(3/7)*(x-1)*(2*x^2-4*x-7);...
    -(3/7)*(3-x)*(2*x^2-12*x+9)+(1/28)*(x-2)*(13*x^2-52*x+67);...
    (1/28)*(4-x)*(13*x^2-104*x+223); (-15/28)*(x-4)];

ExpAnsSj=expand(ansSj);
display(ExpAnsSj);

