# imaging_transcriptomics
A set of scripts used to link MRI brain maps to Allen Human Brain Atlas maps of gene expression from microarray data
The scripts were used in the publication Zhukovsky et al., 2024 'Acute stress increases striatal connectivity with cortical regions enriched for μ- and κ-opioid receptors', _Biological  Psychiatry_

https://www.biologicalpsychiatryjournal.com/article/S0006-3223(24)00106-9/abstract
https://doi.org/10.1016/j.biopsych.2024.02.005

Some of the code relies on the **fastAUC** function:
https://www.mathworks.com/matlabcentral/fileexchange/42860-fast-auc-calculator-and-roc-curve-plotter?tab=reviews

**GABA_Abagen_PLS_left.m**
This script uses a PLS regression to identify genes with similar spatial expression brain maps to the MRI brain maps. 


**network_vizAHBA.m**
This script derives a colormap that can be used with the HCP parcellation to create brain map visuals using freesurfer

**PET_receptors.m**
This script tests for spatial associations between brain maps of PET receptor binding and MRI brain maps.


