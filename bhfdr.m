function p_adj = bhfdr(pvals)
%https://stats.stackexchange.com/questions/238458/whats-the-formula-for-the-benjamini-hochberg-adjusted-p-value
s=size(pvals); if s(1)>1; pvals=pvals'; end
%keep original order of pvals
order=1:length(pvals);
m=length(pvals);
%rank pvalues
tmp=[pvals', order'];
tmp=sortrows(tmp,1);tmp=horzcat(tmp, order');
%First, order all p-values from small to large. Then multiply each p-value
%by the total number of tests m and divide by its rank order.
tmp(:,4)=m*tmp(:,1)./tmp(:,3);
tmp=sortrows(tmp, 2);
p_adj=tmp(:,4);

