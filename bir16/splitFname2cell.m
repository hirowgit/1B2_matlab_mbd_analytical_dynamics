%split f name
% function rescell= splitFname2cell(intext)
expression_m = '\- (';
expression_p = '\+ (';


stfunc2=strrep(intext,'*','\cdot');
expression_m = '\- (';
splitStr = regexp(stfunc2,expression_m,'split');
splitStr2=cellfun(@(x) ([expression_m(2:end) x]),splitStr,'UniformOutput', false);


% expression_p = '\+ (';
% splitStr3=cellfun(@(x) regexp(stfunc2,expression_p,'split'),splitStr2,'UniformOutput', false);
% splitStr4=cellfun(@(x) ([expression_p(2:end) x]),splitStr3,'UniformOutput', false);

%  text([xx(3)-10 fg(3)-2],[xx(3) fg(3)],['\leftarrow ',stfunc])

% end