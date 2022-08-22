syms M1 M2 M3 M4 M5 m(t) G 

t=[1 2 3];
Asub=[2 1/2 0; 1/2 2 1/2; 0 1/2 2];
Msub=[M2; M3; M4]; 
dsub=[-3; -9; 3];

eqn = Asub*Msub==dsub;

S2 = solve(eqn);
cellS2=struct2cell(S2);
cellS2{:}
% matS2=cell2mat(cellfun(@double,cellS2,'UniformOutput', false));

% S(x)=M