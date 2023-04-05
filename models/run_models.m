%% Clear environment
clear;
clc;

%% Add Dynare to environment (adjust path if necessary)
addpath /Applications/Dynare/5.3/matlab

%% Run Standardmodel (deflated + levels)
dynare BaseLevelInclude
copyfile BaseLevelInclude.log ../docs/_includes/logs/BaseLevelInclude.log


