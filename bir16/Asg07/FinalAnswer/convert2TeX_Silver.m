% %% Copyright (c) 2016, Wagatsuma Lab@Kyutech and Hiroaki Wagatsuma 
% %%
% %% All rights reserved.
% %%
% %% Redistribution and use in source and binary forms, with or without
% %% modification, are permitted under the terms of the Creative Commons License
% %% Attribution, BY "Wagatsuma Lab@Kyutech and Hiroaki Wagatsuma "

% function res=convert2TeXF(expF,vaRori)
% inStr=latex(Phiq_dq);
expF=Phiq_dq;  vaRori=qAll;
inStr=latex(expF);
vaR=getVariablesB(char(vaRori));
% chTex={'\alpha','\beta','\gamma','\delta','\epsilon','\zeta','\eta','\theta','\iota','\kappa','\lambda','\mu','\nu','\xi','\o','\pi','\rho','\sigma','\tau',...
%     '\upsilon','\phi','\chi','\psi','\omega','\Gamma','\Delta','\Theta','\Lambda','\Xi','\Pi','\Sigma','\Upsilon','\Phi','\Psi','\Omega','\varepsilon',...
%     '\vartheta','\varpi','\varrho','\varsigma','\varphi'};
chTex={'\alpha','\beta','\gamma','\delta','\epsilon','\zeta','\eta','\theta','\iota','\kappa','\lambda','\mu','\nu','\xi','\pi','\rho','\sigma','\tau',...
    '\upsilon','\phi','\chi','\psi','\omega','\Gamma','\Delta','\Theta','\Lambda','\Xi','\Pi','\Sigma','\Upsilon','\Phi','\Psi','\Omega','\varepsilon',...
    '\vartheta','\varpi','\varrho','\varsigma','\varphi'};

DiffN=3; diffStr={'\dot','\ddot'};
% vaR={'x','y','phi'}; 

getLeft=@(st) st(9:end-1);
putIn=@(st,num) [st(1:num+1),'_',st(num+2:end)];

tStr=inStr; 
myExp='\d*'; myRep='_$0'; % number - > '_num'
tStr = regexprep(tStr,myExp,myRep);
tStr=inStr; 
myExp='\\mathrm{\w*}'; myRep='${getLeft($0)}'; 
tStr = regexprep(tStr,myExp,myRep);


for kj=1:length(vaR) % the number of variables
    for ki=DiffN:-1:1 % the maximum order of differentials  
        if ki>2 
            myExp=[repmat('d',[1,ki]),vaR{kj}]; myRep=[vaR{kj},'^(',ki,')'];
        else
            myExp=[repmat('d',[1,ki]),vaR{kj}]; 
%             if ki==1 myRep=['\dot ',vaR{kj}];
             switch ki
                 case 1
                     myRep=['\dot ',vaR{kj}];
                 case 2
                     myRep=['\ddot ',vaR{kj}];
                 otherwise
                     myRep=myExp;
             end
        end
        tStr = strrep(tStr,myExp,myRep);
        
    end
%     myExp=['[ ({\[\./+-*/]',vaR{kj},'\d*']; myRep=['${putIn($0,',num2str(length(vaR{kj})),')}'];
    myExp=['[ ({\[\./+-*/]',vaR{kj},'\d*[^_]']; myRep=['${putIn($0,',num2str(length(vaR{kj})),')}'];
    tStr = regexprep(tStr,myExp,myRep);   
end

for kk=1:length(chTex)
    myRep=chTex{kk}; myExp=myRep(2:end); 
    tStr = strrep(tStr,myExp,myRep);
end
res=tStr

% end
% 
% function res=getVariablesB(tVal)
%     myExp='matrix([[';  myRep=''; 
%     tVal = strrep(tVal,myExp,myRep);
%     myExp=' [';  myRep=''; 
%     tVal = strrep(tVal,myExp,myRep);
%     myExp=']';  myRep=''; 
%     tVal = strrep(tVal,myExp,myRep);
%     myExp=')';  myRep=''; 
%     tVal = strrep(tVal,myExp,myRep);
%     cellVal=strsplit(tVal,',');
% 
%     myExp='\d*'; myRep='';
%     rmCh= @(x) regexprep(x,myExp,myRep);
% 
%     cellVal2= cellfun(rmCh, cellVal, 'UniformOutput', false);
%     cellVal2=sortrows(cellVal2');
%     k=2;
%     % for k=2:length(cellVal2)
%     while length(cellVal2)>=k
%         if strcmp(cellVal2{k-1},cellVal2{k}) cellVal2(k)=[]; else k=k+1; end
%     end
% 
%     res=cellVal2;
% end