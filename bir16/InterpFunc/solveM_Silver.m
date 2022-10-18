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
dj2=6*(cj(2:N-1)-cj(1:N-2))./(hj(2:N-1)+hj(1:N-2));

%------------
Aij=[2 0.5 0; 0.5 2 0.5; 0 0.5 2];

% Aij=[2 1/2 0; 1/2 2 1/2; 0 1/2 2];
dj=[-3 -9 3]';

Eqn = Aij*Mj(2:N-1)==dj;

SolvedVariables = solve(Eqn);
cellSolutions=struct2cell(SolvedVariables);  % struct -> cell
cellSolutions{:};  
% matS2=cell2mat(cellfun(@double,cellSolutions,'UniformOutput', false)); %
% cell -> mat

% S(x)=M

for j=1:size(Mj,1)
if isfield(SolvedVariables, char(Mj(j)))
    valName=char(Mj(j));
    valContent=getfield(SolvedVariables, char(Mj(j)));
    stOut =sprintf('%s = %s\n',valName,char(valContent));
    display(stOut);
else 
%     display('empty');
end

end

for j=2:size(Mj,1)-1
%     Sj=Mj(j)/(6*h)
    
end