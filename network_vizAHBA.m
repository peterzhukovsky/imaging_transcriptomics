regions=readtable('C:\Users\peter\Documents\GABA\HCPMMP1_on_MNI152_ICBM2009a_nlin.txt');llabel_names=regions.Var2;     

clear full_cell
id=[1:180]'; rr=ROI_names_cut; tstat_roi= XS(1:171); 
%tstat_roi=X(:, strcmp(probes_sorted.gene_symbol, 'OPRK1'));
%tstat_roi=X(:, strcmp(probes_sorted.gene_symbol, 'OPRM1'))
for index=1:length(rr);
    roi=rr(index);
    %e.g. t=2; maxt=4 => then color should be half way to the max of the range:
    if tstat_roi(index)>0
        blue_range=0:255;
        green_range=0:255;
    
    tstat_relative=1-tstat_roi(index)/(max(tstat_roi)+0.01);
    color_relative=round(tstat_relative*256);
    
    R(index,1)=255;
    G(index,1)=round(green_range(color_relative));
    B(index,1)=blue_range(color_relative);
    A(index,1)=0;
    
    full_cell{index, 1}=index; full_cell{index, 2}=llabel_names{roi};full_cell{index, 3}=R(index);    full_cell{index, 4}=G(index);    full_cell{index, 5}=B(index);     full_cell{index, 6}=A(index);

    elseif tstat_roi(index)<0;
        red_range=0:255;
        green_range=0:255;
    tstat_relative=1-tstat_roi(index)/(min(tstat_roi)-0.01);
    color_relative=round(tstat_relative*256);
    
    
    R(index,1)=red_range(color_relative);
    G(index,1)=round(green_range(color_relative));
    B(index,1)=255;
    A(index,1)=0;
    full_cell{index, 1}=index; full_cell{index, 2}=llabel_names{roi};full_cell{index, 3}=R(index);    full_cell{index, 4}=G(index);    full_cell{index, 5}=B(index);     full_cell{index, 6}=A(index);
    end
end
