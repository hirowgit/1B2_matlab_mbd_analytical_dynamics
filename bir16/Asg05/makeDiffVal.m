function res = makeDiffVal(oriVal)
    dq_pre=strrep(char(oriVal),'matrix([[','');
    dq_pre=strrep(dq_pre,' [','');
    dq_pre=strrep(dq_pre,']])','');
    dq=strsplit(dq_pre,'],');
    dq_label=cellfun(@(x) ['d', x], dq,'UniformOutput', false);
    dq=sym(dq_label);  dq=dq(:);
    res=dq;
end