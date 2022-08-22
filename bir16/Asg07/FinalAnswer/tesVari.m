sample='matrix([[x1], [y1], [phi1], [x2], [y2], [phi2], [x3], [y3], [phi3], [x4], [y4], [phi4]])';

tVal=sample;
myExp='matrix([[';  myRep=''; 
tVal = strrep(tVal,myExp,myRep);
myExp=' [';  myRep=''; 
tVal = strrep(tVal,myExp,myRep);
myExp=']';  myRep=''; 
tVal = strrep(tVal,myExp,myRep);
myExp=')';  myRep=''; 
tVal = strrep(tVal,myExp,myRep);
cellVal=strsplit(tVal,',');

myExp='\d*'; myRep='';
rmCh= @(x) regexprep(x,myExp,myRep);

cellVal2= cellfun(rmCh, cellVal, 'UniformOutput', false);
cellVal2=sortrows(cellVal2');
k=2;
% for k=2:length(cellVal2)
while length(cellVal2)>=k
    if strcmp(cellVal2{k-1},cellVal2{k}) cellVal2(k)=[]; else k=k+1; end
end

res=cellVal2
