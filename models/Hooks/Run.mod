// Declaring the shocks
shocks;
var em; stderr sigma_m;  // Market innovation
var eh; stderr sigma_h;  // Home innovation
corr em, eh=gamma;       // Innovation correlation
end;

// Checking for the steady state
resid;
steady;
check;

// Display model diagnostics
model_diagnostics;
model_info;

// Launch solving procedure
stoch_simul(order=1, irf=80, hp_filter=1600, periods=1000, nodisplay) C,cm,ch,k,km,kh,x,xm,xh,l,hm,hh,zm,zh,r,w,y,T;