clear all
filename='q1.txt';
% A = importdata(filename)
currentCharacterEncoding = slCharacterEncoding();
slCharacterEncoding('UTF-8');
% lyric = sprintf('自由記述�\提�? \評価?100点�点? ');
fileID = fopen(filename,'r');
C = textscan(fileID,'%s','delimiter',sprintf('\f'));

delimiterL={'��o','�]���i100�_���_�j'}:
cc=C{1};
for i=1:length(cc)
%    if i>160 && i<165 display(cc{i}); end
   if strfind(cc{i},'��o')
%     if strfind(cc{i},'a')
        display(cc{i});
    end
    if strfind(cc{i},'�]���i100�_���_�j')
%     if strfind(cc{i},'a')
        newStr = regexprep(cc{i},'',replace)
        display(cc{i});
    end
    
end
    
slCharacterEncoding('Shift_JIS')

% slCharacterEncoding(encoding)=currentCharacterEncoding;