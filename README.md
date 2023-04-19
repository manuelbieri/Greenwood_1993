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
- Jekyll (4+), for documentation only

Otherwise, the code might (partly) not work. Additionally, the code and scripts are tested on macOS 13.3.

## Run Dynare-Code

### Matlab Interface

1. Open ```run_models.m``` and set `project_path/models` as working directory
2. Run the first and second section
    - Note: You may need to adjust the path to Dynare
3. Run the sections containing the models, you wish to simulate

### Command Line
```shell
cd models
/Applications/MATLAB_R2021b.app/bin/matlab -nodesktop -nosplash -r "run_models"
```
Note: You may need to adjust the path to matlab.

## Generate Docs
```shell
/bin/zsh prepare_docs.sh
```
After running this shell-file, the docs-directory will contain a webpage with the latest outputs, which can be served with
Jekyll. Make sure to run all models before generating the documentation, in order to mirror the latest changes.
