%% Add Functions and Dynare to environment
addpath Functions/
AddDynare % Add path to Dynare as argument if necessary

%% Clear environment
CleanUp;

%% Run Model 1 (deflated + levels)
% Model with home production minimized

CleanUp;
dynare Model1_level

%% Run Model 1 (deflated + logs)
% Model with home production minimized

CleanUp;

dynare Model1_log

%% Run Model 2 (deflated + levels)
% Model with increased willingness to substitute between home and market

CleanUp;
dynare Model2_level

%% Run Model 2 (deflated + logs)
% Model with increased willingness to substitute between home and market

CleanUp;
dynare Model2_log

%% Run Model 3 (deflated + levels)
% Model with increased incentive to substitute between home and market

CleanUp;
dynare Model3_level

%% Run Model 3 (deflated + logs)
% Model with increased incentive to substitute between home and market

CleanUp;
dynare Model3_log

%% Run Model 4 (deflated + levels)
% Model with a more general home production function and 
% highly correlated technology shocks

CleanUp;
dynare Model4_Level

%% Run Model 4 (deflated + logs)
% Model with a more general home production function and 
% highly correlated technology shocks

CleanUp;
dynare Model4_Log

%% Replicate Table
% All data are quarterly, logged, and detrended using the Hodrick-Prescott 
% filter.

table = GenerateTable;
display(table)
display(table.Properties.Description)

%% Generate IRF Plot
% Plot containing the IRFs for output, total consumption, total investment
% and hours worked.

GenerateIRFPlot;
