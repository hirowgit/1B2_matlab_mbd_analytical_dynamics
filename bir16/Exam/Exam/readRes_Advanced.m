clear all
% filename=['q',num2str(kk),'.txt'];
% filename_out='res.csv'

for kk=1:14
    
filename=['q',num2str(kk),'.txt']
filename_out=['res',num2str(kk),'.txt']

% A = importdata(filename)
currentCharacterEncoding = slCharacterEncoding();
slCharacterEncoding('UTF-8');
% lyric = sprintf('閾ｪ逕ｱ險倩ｿｰ蠑\謠仙? \隧穂ｾ｡?100轤ｹ貅轤ｹ? ');
fileID = fopen(filename,'r');
C = textscan(fileID,'%s','delimiter',sprintf('\f'));

delimiterL={'提出','評価（100点満点）'};
cc=C{1};

strAll={}; k=1;
for i=1:length(cc)
%    if i>160 && i<165 display(cc{i}); end
   if strfind(cc{i},delimiterL{1})
%     if strfind(cc{i},'a')
        newStr = regexprep(cc{i},delimiterL{1},'');
        newStr = regexprep(newStr,', ....-..-.. ..:..','');
        newStr2={newStr};

        display(newStr2{1});
    end
    if strfind(cc{i},delimiterL{2})
%     if strfind(cc{i},'a')
        newStr = regexprep(cc{i},delimiterL{2},'');
        newStr = regexprep(newStr,'点','');

        newStr3={newStr};
%         display(newStr);
        display(newStr3{1});
    newStr4=[newStr2{1},char(9),newStr3{1}];
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


end
slCharacterEncoding('Shift_JIS');


% slCharacterEncoding(encoding)=currentCharacterEncoding;