// Declaring the shocks
shocks;
var em; stderr sigma_m; // Market technology shock
var eh; stderr sigma_h; // Home technology shock
corr em,eh=gamma;       // Shock correlation
end;

// Checking for the steady state
resid;
steady;
check;

model_diagnostics;
model_info;

// Launch solving procedure
stoch_simul(order=1, irf=80, hp_filter=1600,periods=1000, nodisplay) C,cm,ch,k,km,kh,x,xm,xh,l,hm,hh,zm,zh,r,w,y,T;