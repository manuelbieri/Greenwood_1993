%% Add Functions and Dynare to environment
addpath Functions/
AddDynare % Add path to Dynare as argument if necessary

%% Clear environment
CleanUp;

%% Run Standardmodel 1 (deflated + levels)
% Model with increased willingness to substitute between home and market

CleanUp;
dynare Base1_Level

%% Run Standardmodel 1 (deflated + logs)
% Model with increased willingness to substitute between home and market

CleanUp;
dynare Base1_log

%% Run Standardmodel 2 (deflated + levels)
% Model with increased incentive to substitute between home and market

CleanUp;
dynare Base2_level

%% Run Standardmodel 2 (deflated + logs)
% Model with increased incentive to substitute between home and market

CleanUp;
dynare Base2_log

%% Run Minimal Home Production (deflated + levels)
% Model with home production minimized

CleanUp;
dynare MinimalHomeProduction_Level

%% Run Minimal Home Production (deflated + logs)
% Model with home production minimized

CleanUp;
dynare MinimalHomeProduction_log

%% Run General Home Production (deflated + levels)
% Model with a more general home production function and 
% highly correlated technology shocks

CleanUp;
dynare GeneralHomeProduction_Level

%% Run General Home Production (deflated + logs)
% Model with a more general home production function and 
% highly correlated technology shocks

CleanUp;
dynare GeneralHomeProduction_Log

%% Replicate Table
%   All data are quarterly, logged, and detrended using the Hodrick-Prescott filter.

GenerateTable
