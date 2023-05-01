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
table(row,1) = round(GetStandardDeviation(oo_, 17)*100, digits);

% ratios of standard deviations (sd)
% sd(x)/sd(y)
table(row,2) = round(GetStandardDeviation(oo_, 7)/GetStandardDeviation(oo_, 17), digits);

% sd(cm)/sd(y)
table(row,3) = round(GetStandardDeviation(oo_, 2)/GetStandardDeviation(oo_, 17), digits);

% sd(hm)/sd(y)
table(row,4) = round(GetStandardDeviation(oo_, 11)/GetStandardDeviation(oo_, 17), digits);

% sd(w)/sd(y)
table(row,5) = round(GetStandardDeviation(oo_, 16)/GetStandardDeviation(oo_, 17), digits);

% sd(hm)/sd(w)
table(row,6) = round(GetStandardDeviation(oo_, 11)/GetStandardDeviation(oo_, 16), digits);

% Correlations
% corr(hm, w)
table(row,7) = round(GetStandardDeviation(oo_, 11, 16)^2/(GetStandardDeviation(oo_, 11)*GetStandardDeviation(oo_, 16)), digits);
% corr(xm, xh)
table(row,8) = round(GetStandardDeviation(oo_, 8, 9)^2/(GetStandardDeviation(oo_, 8)*GetStandardDeviation(oo_, 9)), digits);

% Return table
clc;
outputTable = table;
end
