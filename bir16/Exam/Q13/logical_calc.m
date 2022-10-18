% logical calc

p=[true; true; false; false];
q=[true; false; true; false];

notp=not(p);
imp_p_Nq=implication(p,not(q));
imp_Nq_Np=implication(not(q),not(p));
p_or_Np=or(p,not(p));

[p q notp imp_p_Nq imp_Nq_Np p_or_Np]

% ans =
% 
%      1     1     0     0     1     1
%      1     0     0     1     0     1
%      0     1     1     1     1     1
%      0     0     1     1     1     1