clear all
% filename=['q',num2str(kk),'.txt'];
% filename_out='res.csv'
dataAll={}; flagS=1;

strAlllabel={}; 
strAlldata={}; 

for kk=1:14
    
filename=['q',num2str(kk),'.txt']
filename_out=['res',num2str(kk),'.txt']

% A = importdata(filename)
currentCharacterEncoding = slCharacterEncoding();
slCharacterEncoding('UTF-8');
% lyric = sprintf('自由記述�\提�? \評価?100点�点? ');
fileID = fopen(filename,'r');
C = textscan(fileID,'%s','delimiter',sprintf('\f'));
 
delimiterL={'��o','�]���i100�_���_�j'};
cc=C{1};

strAll={}; k=1;

for i=1:length(cc)
%    if i>160 && i<165 display(cc{i}); end
   if strfind(cc{i},delimiterL{1})
%     if strfind(cc{i},'a')
        newStr = regexprep(cc{i},delimiterL{1},'');
        newStr = regexprep(newStr,', ....-..-.. ..:..','');
        newStr2={newStr};

%         display(newStr2{1});
    end
    if strfind(cc{i},delimiterL{2})
%     if strfind(cc{i},'a')
        newStr = regexprep(cc{i},delimiterL{2},'');
        newStr = regexprep(newStr,'�_','');

        newStr3={newStr};
%         display(newStr);
%         display(newStr3{1});
    newStr4=[newStr2{1},char(9),newStr3{1}];
    newStr4sp=newStr3{1};
    if flagS==1 strAlllabel{k}=newStr2{1}; end
%     strAlldata{i,kk}=newStr4sp; 
    strAlldata{k,kk}=str2num(newStr4sp); 
    strAll{k}=newStr4; k=k+1;
    end
end
k-1
fclose(fileID);
 
fileID2 = fopen(filename_out,'w');
for i=1:k-1
    fprintf(fileID2,'%s \r\n',strAll{i});
end
fclose(fileID2);
flagS=0;

end

strAlldata2=cell2mat(strAlldata);

slCharacterEncoding('Shift_JIS');

fileID3 = fopen(['sp_',filename_out],'w');
for ki=1:k-1
    fprintf(fileID3,'%s \t',strAlllabel{ki});
    for kj=1:14
        fprintf(fileID3,'%d \t',strAlldata2(ki,kj));
    end
    fprintf(fileID3,'\r\n');
end
fclose(fileID2);

strAlldata2



% slCharacterEncoding(encoding)=currentCharacterEncoding;