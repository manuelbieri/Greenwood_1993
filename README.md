# Greenwood_1993
Implements the RBC model of Greenwood et al. (1993)

## Dependencies
- Matlab (>=2021b)
- Dynare (>=5.3)

Otherwise, the code might (partly) not work.

## Run Dynare-Code
```shell
cd models
/Applications/MATLAB_R2021b.app/bin/matlab -nodesktop -nosplash -r "run_models"
```
Note: You may need to adjust the path to matlab.

## Generate Docs
```shell
/bin/zsh prepare_docs.sh
```

