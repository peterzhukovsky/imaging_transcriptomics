clear
cd C:\Users\peter\Documents\GABA\PET
load('C:\Users\peter\Documents\GABA\reports\cort_outputs.mat');
load('C:\Users\peter\Documents\GABA\reports\subcort_outputs.mat');
mu_left=readtable('lh.MU_carfentanil_hc39.sum.txt');
mu_right=readtable('rh.MU_carfentanil_hc39.sum.txt');
mu_left2=readtable('lh.MU_carfentanil_hc204.sum.txt');
mu_right2=readtable('rh.MU_carfentanil_hc204.sum.txt');

gaba_left=readtable('lh.GABAa_flumazenil_hc6.sum.txt'); 
gaba_right=readtable('rh.GABAa_flumazenil_hc6.sum.txt');gaba_left.Mean(gaba_left.Mean<2)=NaN;gaba_right.Mean(gaba_right.Mean<2)=NaN;

kappa_left=readtable('lh.KAPPA_Vijay.sum.txt');kappa_left.Mean(120)=NaN;
kappa_right=readtable('rh.KAPPA_Vijay.sum.txt');kappa_right.Mean(120)=NaN;

nop_left=readtable('lh.NOP1A_Logan.sum.txt');nop_left.Mean(120)=NaN;
nop_right=readtable('rh.NOP1A_Logan.sum.txt');nop_right.Mean(120)=NaN;

cd C:\Users\peter\Documents\GABA
mu_left=mean([zscore(mu_left.Mean), zscore(mu_left2.Mean)]')';
mu_right=mean([zscore(mu_right.Mean), zscore(mu_right2.Mean)]')';
%'L_accumbens', 'L_amygdala', 'L_caudate', 'L_hippocampus', 'L_putamen
[r,p]=corr(mu_left, c3vs1_tstat)
imagesc(r([1,3,5,2,4])'); colormap bone; colorbar
[r,p]=corr(mu_right, c3vs1_tstat)
imagesc(r([6,8,10,7,9])'); colormap bone; colorbar

figure(1); scatter(mu_right, c3vs1_tstat(:,10), 'filled', 'k'); lsline; hold on; ix=bhfdr(c3vs1_pval(:,10))<0.05;
scatter(mu_right(ix), c3vs1_tstat(ix,10), 40,'r');

figure(2); scatter(mu_left, c3vs1_tstat(:,5), 'filled', 'k'); lsline; hold on; ix=bhfdr(c3vs1_pval(:,5))<0.05;
scatter(mu_left(ix), c3vs1_tstat(ix,5), 40,'r');


[r,p]=corr(gaba_left.Mean, c3vs1_tstat, 'rows','pairwise')
figure; imagesc(r([1,3,5,2,4])'); colormap bone; colorbar
[r,p]=corr(gaba_right.Mean, c3vs1_tstat, 'rows','pairwise')
imagesc(r([6,8,10,7,9])'); colormap bone; colorbar


figure(1); hold off; scatter(gaba_right.Mean, c3vs1_tstat(:,10), 'filled', 'k'); lsline; hold on; ix=bhfdr(c3vs1_pval(:,10))<0.05;
scatter(gaba_right.Mean(ix), c3vs1_tstat(ix,10), 40,'r');

figure(2); hold off; scatter(gaba_left.Mean, c3vs1_tstat(:,5), 'filled', 'k'); lsline; hold on; ix=bhfdr(c3vs1_pval(:,5))<0.05;
scatter(gaba_left.Mean(ix), c3vs1_tstat(ix,5), 40,'r');


[r,p]=corr(kappa_left.Mean, c3vs1_tstat, 'rows','pairwise')
imagesc(r([1,3,5,2,4])'); colormap bone; colorbar
[r,p]=corr(kappa_right.Mean, c3vs1_tstat, 'rows','pairwise')
imagesc(r([6,8,10,7,9])'); colormap bone; colorbar


figure(1); hold off; scatter(kappa_right.Mean, c3vs1_tstat(:,10), 'filled', 'k'); lsline; hold on; ix=bhfdr(c3vs1_pval(:,10))<0.05;
scatter(kappa_right.Mean(ix), c3vs1_tstat(ix,10), 40,'r');

figure(2); hold off; scatter(kappa_left.Mean, c3vs1_tstat(:,5), 'filled', 'k'); lsline; hold on; ix=bhfdr(c3vs1_pval(:,5))<0.05;
scatter(kappa_left.Mean(ix), c3vs1_tstat(ix,5), 40,'r');

%NOP
[r,p]=corr(nop_left.Mean, c3vs1_tstat, 'rows','pairwise')
figure;imagesc(r([1,3,5,2,4])'); colormap bone; colorbar
[r,p]=corr(nop_right.Mean, c3vs1_tstat, 'rows','pairwise')
figure;imagesc(r([6,8,10,7,9])'); colormap bone; colorbar


figure(1); hold off; scatter(nop_right.Mean, c3vs1_tstat(:,10), 'filled', 'k'); lsline; hold on; ix=bhfdr(c3vs1_pval(:,10))<0.05;
scatter(nop_right.Mean(ix), c3vs1_tstat(ix,10), 40,'r');

figure(2); hold off; scatter(nop_left.Mean, c3vs1_tstat(:,5), 'filled', 'k'); lsline; hold on; ix=bhfdr(c3vs1_pval(:,5))<0.05;
scatter(nop_left.Mean(ix), c3vs1_tstat(ix,5), 40,'r');


subcort_rois={'L_accumbens', 'L_amygdala', 'L_caudate', 'L_hippocampus', 'L_putamen',...
              'R_accumbens', 'R_amygdala', 'R_caudate', 'R_hippocampus', 'R_putamen'};

