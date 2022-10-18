N=4;
xj = sym('x',[1 N]);
yj = sym('y',[1 N]);

xj*yj'

xj(1)=1;

xj*yj'

% ans =
%  
% conj(y1) + x2*conj(y2) + x3*conj(y3) + x4*conj(y4)

xj=[1 2 3 4];

xj*yj'

% 
% ans =
%  
% conj(y1) + 2*conj(y2) + 3*conj(y3) + 4*conj(y4)