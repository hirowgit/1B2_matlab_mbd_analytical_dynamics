%split f name
% function rescell= splitFname2cell(intext)
expression_m = '\- (';
expression_p = '\+ (';
fselect = @ (x) feval((@ (list,ind) list{ind}),  {{x{1},[expression_p(2:end) x{end}]}, {x}},  (length(x)>1)*1 + not(length(x)>1)*2);

intext='(3*x*(x - 1)*(x - 3)*(x - 4))/4 + (x*(x - 1)*(x - 2)*(x - 4))/3 - (x*(x - 2)*(x - 3)*(x - 4))/6';

stfunc2=strrep(intext,'*','\cdot');
expression_m = '\- (';
splitStr = regexp(stfunc2,expression_m,'split');
splitStr2=cellfun(@(x) ([expression_m(2:end) x]),splitStr,'UniformOutput', false); 
splitStr2{1}
splitStr2{2}
expression_p = '\+ (';
splitStr3=cellfun(@(x) regexp(x,expression_p,'split'),splitStr2,'UniformOutput', false);
splitStr4=cellfun(@ (x) feval((@ (list,ind) list{ind}),  {{x{1},[expression_p(2:end) x{end}]}, {x}},  (length(x)>1)*1 + not(length(x)>1)*2)...
    ,splitStr3,'UniformOutput', false);
splitStr5=[splitStr3{:}];
display(splitStr5);

%  text([xx(3)-10 fg(3)-2],[xx(3) fg(3)],['\leftarrow ',stfunc])

% end

% - ((3\cdotx\cdot(x - 1)\cdot(x - 3)\cdot(x - 4))/4 + (x\cdot(x - 1)\cdot(x - 2)\cdot(x - 4))/3 

% fselect = (@ (x) feval((@ (list,ind) list{ind}),  {{x{1},[expression_p(2:end) x{2}]}, x},  (length(x)>1)*1 + (length(x)<=1)*2));

% 条件分岐
% 
% これを応用することで、
% 
% >> f = (@ (x) ...
%          feval((@ (list,ind) list{ind}), ...
%                {x^2, sqrt(x)}, ...
%                (mod(x,2)==0)*1 + (mod(x,2)==1)*2));
% >> f(5)
% ans = 2.2361
% >> f(6)
% ans = 36
% のように、条件分岐を行うことができます。これは、xが偶数なら二乗を、奇数ならそのsqrtを返す関数となっています。
% この関数fは、「{x^2, sqrt(x)}」の「(mod(x,2)==0)*1 + (mod(x,2)==1)*2」番目の要素にアクセスする関数となっています。
% {}内に実行したい候補の関数、「(mod(x,2)…」の部分に「それらを実行したい条件*インデックス」と書いておくことで、条件に応じて実行したい関数を選択することができます。
% 
