// Endogenous variables
var C, cm $c_M$, ch $c_H$,
k, km $k_M$, kh $k_H$,
x, xm $x_M$, xh $x_H$,
l, hm $h_M$, hh $h_H$,
zm $z_M$, zh $z_H$,
r,w, y, T; 

// Exogenous variables
varexo em $\epsilon_M$, eh $\epsilon_H$;

// ------------------------------------------------------
// Variables
// ------------------------------------------------------
// c:    consumption
// l:    labor
// y:    output
// ------------------------------------------------------
// i_s:  investment of structures
// i_e:  investment of equipment
// ------------------------------------------------------
// k_s:  capital in structures
// k_e:  capital in equipment
// ------------------------------------------------------
// xi:  shock to investment specific productivity
// ------------------------------------------------------

// Parameters
parameters a, b, e
beta $\beta$, delta_m $\delta_M$, delta_h $\delta_H$, eta $\eta$,
lambda $\lambda$,
rho_h $\rho_H$, rho_m $\rho_M$, tau_k $\tau_k$, tau_h $\tau_h$, 
theta $\theta$, sigma_m $\sigma_M$, sigma_h $\sigma_H$, gamma $\gamma$;

// ------------------------------------------------------
// Parameters
// ------------------------------------------------------
// Preferences
// ------------------------------------------------------
// beta:         Discount factor
// theta:        Preference
// ------------------------------------------------------
// Technology
// ------------------------------------------------------
// alpha_s:      capital share of income, structures
// alpha_e:      capital share of income, equipment
// ------------------------------------------------------
// delta_s:      depreciation rate for structures
// ------------------------------------------------------
// Growth
// ------------------------------------------------------
// gamma_q:      average annual rate of decline in 
//               relative price of equipment prices	
// ------------------------------------------------------
// Tax rates
// ------------------------------------------------------
// tau_k:        taxation of capital
// tau_l:        taxation of labour
// ------------------------------------------------------


// Assign parameter values to apriori set parameters
e       = 2/3;
delta_m = 0.0235;
delta_h = delta_m;
eta     = 0.3245;
gamma   = 2/3;
lambda  = 1.004674;
rho_h   = 0.95;
rho_m   = rho_h;
sigma_m = 0.07;
sigma_h = sigma_m;
tau_k   = 0.70;
tau_h   = 0.25;
theta   = 0.2944;