

char(Phiq_dq_q)
convert2TeXF2(Phiq_dq_q*dq,qAll)


% 
% tStr='sin(phi1)], [- dphi1^2*cos(phi1)';
% 
% triF={'sin','cos','tan'};
% for kk=1:length(triF)
% % for kk=1:1
%     myExp=[triF{kk},'([^)]*)']; myRep='_$0_'; % sin(), cos(), tan() - > sin, cos, tan
%     tStr = regexprep(tStr,myExp,myRep)
%     myExp=['_',triF{kk},'(']; myRep=['',triF{kk},'{'];
%     tStr = strrep(tStr,myExp,myRep);
%     tStr = strrep(tStr,'_)','}');
% end
% 
% tStr