# Greenwood et al. (1993) - Putting Home into Macroeconomics

This repository replicates the models by Greenwood et al. (1993) - Putting Home into Macroeconomics. You can find the complete
Dynare outputs on [manuelbieri.ch/Greenwood_1993/](https://manuelbieri.ch/Greenwood_1993/).

## Contents
- [Models](#models)
- [Dependencies](#dependencies)
- [Run Code](#run-code)
- [Generate Docs](#generate-docs)
- [Project Structure](#project-structure)

## Models

The numbering of the models is replicated from the original paper:

- Model 1: Model with home production minimized
- Model 2: Model with increased willingness to substitute between home and market
- Model 3: Model with increased incentive to substitute between home and market
- Model 4: Model with a more general home production function and highly correlated technology shocks

Additional models (not included in Greenwood et al., 1993):

- Model 2a: Adjusts Model 2 according to the suggestions of Greenwood et al. (1993) to increase the standard deviation of the home technology shock
- Model 4a: Adjusts Model 4 to score a more appropriate correlation between home and business investments

## Dependencies
- Matlab (>=2021b)
- Dynare (>=5.3)
- Jekyll (>=4.2), for documentation only

Otherwise, the code might (partly) not work. Additionally, the code and scripts are tested on macOS 13.3.

## Run Code

### Matlab Interface

1. Open ```run_models.m``` and set `project_path/models` as working directory
2. Run the first and second section
    - Note: You may need to adjust the path to Dynare
3. Run the sections containing the models, you wish to simulate

### Command Line

Open the command line with at the project root and run the following commands.
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

## Project Structure

```markdown
Greenwood_1993.prj                      # Matlab project file
LICENSE
README.md
docs                                    # Files for the documentation website
models
   |-- Files                            # Output directory for graphs
   |-- Functions                        # Matlab Functions used in run_models.m
   |   |-- AddDynare.m                      # Add dynare path to project path
   |   |-- CleanUp.m                        # Cleans up whole matlab environment
   |   |-- GenerateIRFPlot.m                # Generate graph with interesting IRFs
   |   |-- GenerateTable.m                  # Replicate table in Greenwood et al. (1993)
   |   |-- SaveMoments.m                    # Helper function for GenerateTable.m
   |-- Hooks                            # Components for dynare models (reusable)
   |   |-- Initval                          # Inital guess components
   |   |   |-- level.mod                        # Steady state for level models
   |   |   |-- log.mod                          # Steady state for log models
   |   |-- Run.mod                          # Run instructions for Dynare
   |   |-- SteadyState.mod                  # Deterministic steady state
   |   |-- Variables_Parameters.mod         # Variable and parameter definitions
   |   |-- Write.mod                        # Write model, variable and parameter definitions to latex
   |   |-- preamble.mod                     # Print generic info
   |-- Model1_Level.mod
   |-- Model1_Log.mod
   |-- Model2_Level.mod
   |-- Model2_Log.mod
   |-- Model2a_Log.mod
   |-- Model3_Level.mod
   |-- Model3_Log.mod
   |-- Model4_Level.mod
   |-- Model4_Log.mod
   |-- Model4a_Log.mod
   |-- Replication_Effects_Home_RBC.csv # Replicated table of Greenwood et al. (1993)
   |-- run_models.m                     # Matlab file to run all models and functions
prepare_docs.sh                         # Bash file to prepare files for documentation website
resources                               # Matlab Project files
```
Note: See the model definitions at the beginning of this document.

Generate a more detailed project tree with the follwing command:
```shell
/bin/zsh project_tree.sh
```
