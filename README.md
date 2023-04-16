# Greenwood et al. (1993) - Putting Home into Macroeconomics

## Models

The numbering of the models is replicated from the original paper:

- Model 1: Model with home production minimized
- Model 2: Model with increased willingness to substitute between home and market
- Model 3: Model with increased incentive to substitute between home and market
- Model 4: Model with a more general home production function and highly correlated technology shocks

## Dependencies
- Matlab (>=2021b)
- Dynare (>=5.3)

Otherwise, the code might (partly) not work. Additionally, the code and scripts are tested on macOS 13.3.

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

