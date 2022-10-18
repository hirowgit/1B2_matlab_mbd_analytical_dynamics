syms M1 M2 M3 M4 M5 m(t) G(t)
Mmat = sym('M',[5 1]);

t=[1 2 3 4]';  
Asub=[2 1/2 0; 1/2 2 1/2; 0 1/2 2];
dsub=[-3; -9; 3];

eqn = Asub*Mmat(2:4)==dsub;

SolvedVariables = solve(eqn);
cellS2=struct2cell(S2);
cellS2{:}
% matS2=cell2mat(cellfun(@double,cellS2,'UniformOutput', false));

% S(x)=M

getfield(S2, char(Mmat(2)))