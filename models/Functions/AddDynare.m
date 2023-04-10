function AddDynare(path)
%AddDynare To add / make sure that matlab can access Dynare:
%   Path:   Path to the dynare executable (default: v5.3 macOS default installation)
if ~exist('path','var'), path="/Applications/Dynare/5.3/matlab"; end
addpath(path)
end
