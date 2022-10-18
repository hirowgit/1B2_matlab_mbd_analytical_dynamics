
% 
% char(Phiq_dq_q*dq)
% convert2TeXF2(Phiq_dq_q*dq,qAll)
% 


tStr='\left(\begin{array}{c} -{\dot \phi_{1}}^2\,\cos\left(\phi _{1}\right)\\ -{\dot \phi_{1}}^2\,\sin\left(\phi _{1}\right)\\ -\cos\left(\phi _{1}\right)\,{\dot \phi_{1}}^2-2\,\cos\left(\phi _{2}\right)\,{\dot \phi_{2}}^2\\ -\sin\left(\phi _{1}\right)\,{\dot \phi_{1}}^2-2\,\sin\left(\phi _{2}\right)\,{\dot \phi_{2}}^2\\ 2\,{\dot \phi_{3}}^2\,\cos\left(\phi _{3}\right)-2\,{\dot \phi_{2}}^2\,\cos\left(\phi _{2}\right)\\ 2\,{\dot \phi_{3}}^2\,\sin\left(\phi _{3}\right)-2\,{\dot \phi_{2}}^2\,\sin\left(\phi _{2}\right)\\ 2\,\cos\left(\phi _{3}\right)\,{\dot \phi_{3}}^2+2\,\cos\left(\phi _{4}\right)\,{\dot \phi_{4}}^2\\ 2\,\sin\left(\phi _{3}\right)\,{\dot \phi_{3}}^2+2\,\sin\left(\phi _{4}\right)\,{\dot \phi_{4}}^2\\ 0\\ 0\\ 0\\ 0 \end{array}\right)';

% tStr='\sin\left(\phi _{1}\right)\\ ';

triF={'sin','cos','tan'};
for kk=1:length(triF)
% for kk=1:1
    myExp=[triF{kk},'.left([^)]*)']; myRep='_$0_'; % sin(), cos(), tan() - > sin, cos, tan
%     myExp=[triF{kk},'.left(']; myRep='_$0_'; % sin(), cos(), tan() - > sin, cos, tan
%     myExp='sin';
    tStr = regexprep(tStr,myExp,myRep)
    myExp=['_',triF{kk},'\left(']; myRep=['',triF{kk},'{'];
    tStr = strrep(tStr,myExp,myRep);
    tStr = strrep(tStr,'\right_)','}');
end

tStr