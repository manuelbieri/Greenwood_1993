function sd = GetStandardDeviation(oo_, index1, index2)
%GETSTANDARDDEVIATION Extracts std. from Dynare output.
%   oo_:    Dynare output table containing all moments (important: unchanged!).
%   index:  Index of the standard deviation in the Dynare output.

% assert that all arguments are given
assert(exist('oo_','var'))
assert(exist('index1','var'))

% set default value for index2 to index1 if no value is given
if ~exist('index2','var'), index2=index1; end

% Return percentage standard deviation
sd = sqrt(oo_.var(index1, index2));
end

