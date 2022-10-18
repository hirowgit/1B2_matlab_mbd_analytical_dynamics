syms u v a b c d e f g h k x y

% 
% t=0:0.05:1;
% 
% x=[sin(t*2*pi) 1-sin(t*2*pi)];
% y=[t*2*pi (fliplr(t))*2*pi]*1.2;
% 
% figure(1); clf; 
% plot(x,y,'.-');  
% set(gca,'xlim',[min(x) max(x)].*1.5,'ylim',[min(y) max(y)].*1.5);
% 
% unit1=ones(size(x));
% % p=[x y 1]';
% p2=[x; y; unit1];
% p=[x; y; unit1];
% 
% 
% % m2=[1 0 0; 1 1 0; 1 1 1];
% m2=[5 0 0; 0 5 0; 0 1 1.5];
% % m2=[1 0 0; 0 1 0; 0 0 1];

m=[a b c; d e f; g h k];
% m=[a b c; d e f; g h 1];
o2=repmat((1./ (m2(3,:)*p)),[3,1]).*(m2*p)
% o2=(m2*p)

x=[0.3 0.7 1 0 0.3];
% x=[0 1 0.7 0.3 0];
y=[0 0 1 1 0];

% figure(11); clf; 
% plot(x,y,'.-');  
% % o2=[x; y; unit1];
% % set(gca,'xlim',[-1 2],'ylim',[-1 2]);
%  set(gca,'xlim',[min(o2(1,:)) max(o2(1,:))]+[-1,1],'ylim',[min(o2(2,:)) max(o2(2,:))]+[-1,1]);

figure(12); clf; 
plot(o2(1,:),o2(2,:),'.-');  
% set(gca,'xlim',[-1 2],'ylim',[-1 2]);
  set(gca,'xlim',[min(o2(1,:)) max(o2(1,:))].*1.5,'ylim',[min(o2(2,:)) max(o2(2,:))].*1.5);



% o=[o2(1,:); o2(2,:); unit1];
o=[o2(1,1:4); o2(2,1:4); unit1(1:4)];

pp=p(:,1:4);
% o=[u; v; unit1];
% o==m*p;
eqn = o==repmat( (1./ ([g h k]*pp)),[3 1]).*(m*pp);


% S2 = solve(o==m*p,x)
S2 = solve(eqn)
cellS2=struct2cell(S2);
matS2=cell2mat(cellfun(@double,cellS2,'UniformOutput', false));
% mm2=reshape([matS2; 1],[3,3])'
mm2=reshape(matS2,[3,3])'

figure(2); clf; 
plot(o2(1,:),o2(2,:),'.-'); 
 set(gca,'xlim',[min(o2(1,:)) max(o2(1,:))]+[-1,1],'ylim',[min(o2(2,:)) max(o2(2,:))]+[-1,1]);


 