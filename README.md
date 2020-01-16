# limbiccortical
This is a repostitory for the project "limbic-cortical", where we applied the limbic-cortical model of major depression to healthy subjects with particular risks for depression

The final paper as well as supplementary data can be found here: ..link..

This repository contains some analysis scripts, as well as intermediate data.

## Data in this repository
### fMRI group level analysis
- statistical analysis (e.g. SPM file, contrast image, t-map)
	- navigate to 'data/second_level_analysis/'
The 'SPM.mat' file should be accessible via MATLABs SPM toolbox, MATLAB itself, Python (scipy.io access), ...
The t-map or contrast image is accessible with each software that handles '.nii' images.

### fMRI first level analysis
- statistical contrast images & t-maps of the single subjects
- navigate to 'data/first_level_analysis'
There you can find the contrast images of the [faces>houses] contrast of each subject (subject ID is in the file name).

### DCMs
- navigate to '/data/dcms/'
You find the estimated DCM models (12 per subject) sorted into corresponding risk groups:
	- no_risk
	- gen_risk ("genetic risk", family history or genetic liability)
	- env_risk ("environmental risk", childhood maltreatment)
	- both_risks

Each subject has 12 models. The subject ID is in the filename (e.g. 0123).
Each of the 12 models has a different structure (differing in B- and C-matrices). You can read the structure in the file name as follows:
- Ainp0 --> Amygdala Input = 0 (C-matrix, not existent)
- Ainp1 --> Amygdala Input = 1 (C-matrix, existent)
- Oinp0 --> mPFC (O or ORB because of "Orbitofrontal") input = 0 (C-Matrix, not existent)
...
- AO0 --> connection from Amygdala to mPFC is not modulated by regressor "faces" (B-matrix)
- AO1 --> connection from Amygdala to mPFC is modulated by regressor "faces" (B-matrix)
...

## Analyses in the repostitory
### Bayesian Estimation (BEST)

Pipeline located in the folder:
rk_BEST_analysis.R

The BEST library needed is located in folder "packages".

### Multiple Linear Regression analysis (see supplementary methods)

R scripts located in the folder "linearModel"

### other small scripts
rk_get_oo_and_xp.m
Matlab script to get the posterior model probabilities as well as exceedance probabilites of each group (need BMS.mat for that)

rk_group_characteristics.R 
Just outputs some group characteristics (e.g. age a.s.o. for description in the article).

	


