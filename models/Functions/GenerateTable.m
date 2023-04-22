function table=GenerateTable
%GENERATETABLE Replicates the result table of Greenwood et al. (1993).
%   All data are quarterly, logged, and detrended using the Hodrick-Prescott filter.
%   Note: This function assumes, that Dynare is already added to the path.

CleanUp;
% Init data table
data = zeros(6, 8);

% Model with home production minimized
dynare Model1_log
oo_ = evalin('caller','oo_'); % retrieve dynare output from workspace
data = SaveMoments(data, 1, oo_);

% Model with increased willingness to substitute between home and market
dynare Model2_log
oo_ = evalin('caller','oo_'); % retrieve dynare output from workspace
data = SaveMoments(data, 2, oo_);

% Model 2 with increased standard deviation for home technology shock
dynare Model2a_log
oo_ = evalin('caller','oo_'); % retrieve dynare output from workspace
data = SaveMoments(data, 3, oo_);

% Model with increased incentive to substitute between home and market
dynare Model3_log
oo_ = evalin('caller','oo_'); % retrieve dynare output from workspace
data = SaveMoments(data, 4, oo_);

% Model with a more general home production function and highly correlated technology shocks
dynare Model4_Log
oo_ = evalin('caller','oo_'); % retrieve dynare output from workspace
data = SaveMoments(data, 5, oo_);

% Model 4 with higher willigness to substiute with home production inputs
dynare Model4a_Log
oo_ = evalin('caller','oo_'); % retrieve dynare output from workspace
data = SaveMoments(data, 6, oo_);

% Generate nice output table

table = array2table([1.96, 2.61, 0.54, 0.78, 0.73, 1.06, -0.12, 0.3;data], ...
    'VariableNames',{'S.D. of Market Output','Total Investment Relative to Market Outptut*','Market Consumption Relative to Market Outptut*', 'Market Hours Relative to Market Outptut*', 'Market Wage Relative to Market Outptut*', 'Market Hours Relative to Market Wage*', 'Market Hours and Market Wage**', 'Investment in Business and Household Capital**'}, ...
    'RowNames',{'U.S. Time Series (1947-1987)', 'Model 1 (e=0, gamma=2/3)','Model 2 (e=2/3, gamma=2/3)', 'Model 2a (e=2/3, gamma=2/3, sigma_h=0.045)','Model 3 (e=0.4, gamma=0)', 'Model 4 (e=2/3, gamma=0.99, psi=-1/2)', 'Model 4a (e=2/3, gamma=0.99, psi=-0.04)'});

table.Properties.Description = "Replication of The Effects of Adding Home Production to a Real Business Cycle Model (* Ratio of standard deviations, **Correlation)";

% Write table to file (same directory)
writetable(table, "Replication_Effects_Home_RBC.csv")
end
