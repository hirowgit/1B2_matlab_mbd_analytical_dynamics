inStr=char(Phiq_dq);
chTex={'\alpha','\beta','\gamma','\delta','\epsilon','\zeta','\eta','\theta','\iota','\kappa','\lambda','\mu','\nu','\xi','\o','\pi','\rho','\sigma','\tau',...
    '\upsilon','\phi','\chi','\psi','\omega','\Gamma','\Delta','\Theta','\Lambda','\Xi','\Pi','\Sigma','\Upsilon','\Phi','\Psi','\Omega','\varepsilon',...
    '\vartheta','\varpi','\varrho','\varsigma','\varphi'};

DiffN=3; diffStr={'\dot','\ddot'};
vaR={'x','y','phi'}; 

tStr=inStr; 
myExp='\d*'; myRep='_$0'; % number - > '_num'
tStr = regexprep(tStr,myExp,myRep);
      
for kj=1:length(vaR) % the number of variables
    for ki=DiffN:-1:1 % the maximum order of differentials  
        if ki>2 
            myExp=[repmat('d',[1,ki]),vaR{kj}]; myRep=[vaR{kj},'^(',ki,')'];
            tStr = strrep(tStr,myExp,myRep);
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
            tStr = strrep(tStr,myExp,myRep);
        end
    end
end
tStr
% 
% myExp='\d*'; myRep='_$0';
% newStr = regexprep(m2,myExp,myRep)
