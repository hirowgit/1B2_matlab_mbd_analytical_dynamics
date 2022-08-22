samp=' \dot x4 - \dot x1 - \dot phi1\, \sin\!\left(phi1\right)\\ ';
tStr=samp;
vaR{kj}='x';
 myExp=['[ ({\[\./+-*/]',vaR{kj},'\d*']; myRep=['${putIn($0,',num2str(length(vaR{kj})),')}']; 
    tStr = regexprep(tStr,myExp,myRep)
    
%     '[ ([{/*+-.]

myRep=chTex{21}; myExp=myRep(2:end); 
tStr
 tStr = strrep(tStr,myExp,myRep);
 tStr