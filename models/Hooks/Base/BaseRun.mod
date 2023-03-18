// Declaring the shocks
shocks;
var em; stderr sigma_m; // Investment-Specific Shock
var eh; stderr sigma_h; // Investment-Specific Shock
corr em,eh=gamma;
end;

// Checking for the steady state
resid;
steady;
check;

model_diagnostics;
model_info;

// write model to tex file
write_latex_dynamic_model;