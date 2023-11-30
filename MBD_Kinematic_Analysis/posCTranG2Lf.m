function res=posCTranG2Lf(Pos,Th,Link,Nb)

    rotA =@(th) [cos(th) -sin(th); sin(th) cos(th)];

    rCell=mat2cell(Pos,2,ones(1,Nb));
    rCext=cellfun(@(p) repmat(p,[1 3]),rCell,'UniformOutput',false);

    thCell=num2cell(Th);
    pDcell=cellfun(@(r,th,s) r+rotA(th)*s,rCext,thCell,Link,'UniformOutput',false);

    res=cell2mat(pDcell');

end