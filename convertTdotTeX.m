%% Copyright (c) 2021, Wagatsuma Lab@Kyutech and Hiroaki Wagatsuma 
%%
%% All rights reserved.
%%
%% Redistribution and use in source and binary forms, with or without
%% modification, are permitted under the terms of the Creative Commons License
%% Attribution, BY "Wagatsuma Lab@Kyutech and Hiroaki Wagatsuma "

% function res=convertTdotTeXF(expF,vaRori)

i=2;
expF=transpose(dP_i(i,:));

i=1;
expF=transpose(K_i(i));


vaRori=[t];

%     expF=dP_iTx{1};
    inStr=latex(expF);
%     vaR=getVariables(char(vaRori));
    
    diffStr={'\dot','\ddot'};
    Tdot='\frac{\partial }{\partial t}';
    T2dot='\\frac{\\partial }{\\partial t}\\ \w* \\';
    
    tStr=inStr; 
    tStr2=strrep(tStr,Tdot,'@');
    stPos=strfind(tStr2,'@');
    Tpos=strfind(tStr2,'\');
    for i=1:length(stPos)
        key=find(Tpos>stPos(i));
        s1=Tpos(key(1)); e1=Tpos(key(2));
        tStr2=[tStr2(1:s1-1),'\dot{',tStr2(s1:e1-1),'}',tStr2(e1:end)];
        stPos=strfind(tStr2,'@');
        Tpos=strfind(tStr2,'\');
%         Tvar=tStr2(Tpos(key(1)):Tpos(key(2))-1);
%         tStr2=(tStr2,Tvar,['\dot{',Tvar,'}'])
    end
    tStr3=strrep(tStr2,'@','');
    tStr3=strrep(tStr3,'\left(t\right)','');
    
%     myExp='\d*'; myRep='_$0'; % number - > '_num'
    myExp=T2dot; myRep='_$0'; % number - > '_num'
    tStr = regexprep(tStr,myExp,myRep)
    
% end