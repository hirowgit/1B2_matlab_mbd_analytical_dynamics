clear all
filename='q1.txt';
% A = importdata(filename)
currentCharacterEncoding = slCharacterEncoding();
slCharacterEncoding('UTF-8');
% lyric = sprintf('閾ｪ逕ｱ險倩ｿｰ蠑\謠仙? \隧穂ｾ｡?100轤ｹ貅轤ｹ? ');
fileID = fopen(filename,'r');
C = textscan(fileID,'%s','delimiter',sprintf('\f'));

delimiterL={'提出','評価（100点満点）'}:
cc=C{1};
for i=1:length(cc)
%    if i>160 && i<165 display(cc{i}); end
   if strfind(cc{i},'提出')
%     if strfind(cc{i},'a')
        display(cc{i});
    end
    if strfind(cc{i},'評価（100点満点）')
%     if strfind(cc{i},'a')
        newStr = regexprep(cc{i},'',replace)
        display(cc{i});
    end
    
end
    
slCharacterEncoding('Shift_JIS')

% slCharacterEncoding(encoding)=currentCharacterEncoding;