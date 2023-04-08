%% Clear environment
CleanUp;

%% Add Dynare to environment (adjust path if necessary)
addpath /Applications/Dynare/5.3/matlab

%% Run Standardmodel 1 (deflated + levels)
% Model with increased willingness to substitute between home and market

CleanUp;
dynare Base1_Level

%% Run Standardmodel 1 (deflated + logs)
% Model with increased willingness to substitute between home and market

CleanUp;
dynare Base1_Log

%% Run Standardmodel 2 (deflated + levels)
% Model with increased incentive to substitute between home and market

CleanUp;
dynare Base2_level

%% Run Minimal Home Production (deflated + levels)
% Model with home production minimized

CleanUp;
dynare MinimalHomeProduction_Level

%% Run General Home Production (deflated + levels)
% Model with home production minimized

CleanUp;
dynare GeneralHomeProduction_Level
