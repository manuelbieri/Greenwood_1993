//
// AR(1) model
//

var x; // Name of the variable
varexo e; // Name of the exogenous variable
parameters rho se; // Parameters of the model
rho = 0.95;
se = sqrt(0.02);

// Equations of the model
model(linear); // add (linear) if model is linear and nothing otherwise
x = rho*x(-1)+e;
end;

initval;
e=0;
x=0;
end;
resid;

steady;
check;

// Declaring the shocks
shocks;
var e; stderr se;
end;

// Launch solving procedure
stoch_simul(irf=40);