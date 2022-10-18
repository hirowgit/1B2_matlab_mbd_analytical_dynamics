syms M1 M2 M3 M4 M5 m(t) G(t)
Mmat = sym('M',[5 1]);
Smat = sym('M',[5 1]);

t=[1 2 3 4]';  
Asub=[2 1/2 0; 1/2 2 1/2; 0 1/2 2];
dsub=[-3; -9; 3];

eqn = Asub*Mmat(2:4)==dsub;

SolvedVariables = solve(eqn);
cellS2=struct2cell(S2);
cellS2{:};
% matS2=cell2mat(cellfun(@double,cellS2,'UniformOutput', false));

% S(x)=M

for i=1:size(Mmat,1)
if isfield(SolvedVariables, char(Mmat(i)))
    valName=char(Mmat(i));
    valContent=getfield(SolvedVariables, char(Mmat(i)));
    stOut =sprintf('%s = %s\n',valName,char(valContent));
    display(stOut);
else 
%     display('empty');
end

end

for i=2:size(Mmat,1)-1
    Smat=Mmat(i)/(6*h)
    
end