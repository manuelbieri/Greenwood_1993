function [outputTable] = SaveMoments(table, row, oo_, digits)
%SAVEMOMENTS Saves the relevant moments (ratios) of the dynare output into a matrix.
%   table:  Matrix, which gets filled with the relevant data.
%   row:    Row in the table to fill with data.
%   oo_:    Dynare output table containing all moments (important: unchanged!).
%   digits: Number of digits to round the data.

% assert that all arguments are given
assert(exist('table','var'))
assert(exist('row','var'))
assert(exist('oo_','var'))

% set default value for rounding if no value is given
if ~exist('digits','var'), digits=2; end

% percentage standard deviation
table(row,1) = round(sqrt(oo_.var(17, 17))*100, digits);

% ratios of standard deviations (sd)
% sd(x)/sd(y)
table(row,2) = round(sqrt(oo_.var(7, 7))/sqrt(oo_.var(17, 17)), digits);

% sd(cm)/sd(y)
table(row,3) = round(sqrt(oo_.var(2, 2))/sqrt(oo_.var(17, 17)), digits);

% sd(hm)/sd(y)
table(row,4) = round(sqrt(oo_.var(11, 11))/sqrt(oo_.var(17, 17)), digits);

% sd(w)/sd(y)
table(row,5) = round(sqrt(oo_.var(16, 16))/sqrt(oo_.var(17, 17)), digits);

% sd(hm)/sd(w)
table(row,6) = round(sqrt(oo_.var(11, 11))/sqrt(oo_.var(16, 16)), digits);

% Correlations
% corr(hm, w)
table(row,7) = round(oo_.var(11, 16)/(sqrt(oo_.var(11, 11))*sqrt(oo_.var(16, 16))), digits);
% corr(xm, xh)
table(row,8) = round(oo_.var(8, 9)/(sqrt(oo_.var(8, 8))*sqrt(oo_.var(9, 9))), digits);

% Return table
clc;
outputTable = table;
end
