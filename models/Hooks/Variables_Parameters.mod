// ------------------------------------------------------
// Endogenous Variables
// ------------------------------------------------------
// C :  Total consumption
// ch:  Goods and services produced in the home
// cm:  Goods and services purchased in the market
// ------------------------------------------------------
// l :  Leisure time
// hh:  Labour hours spent working in the household
// hm:  Labour hours spent working in the market
// ------------------------------------------------------
// k :  Total capital
// kh:  Household capital
// km:  Market capital
// ------------------------------------------------------
// x :  Total investment
// xh:  Investment in household capital
// xm:  Investment in business capital
// ------------------------------------------------------
// r :  Price at which business capital can be rented 
//      to firms
// T :  Lump-sum transfer payment from the government
// w :  Real wage rate in the market
// y:   Market output
// ------------------------------------------------------
// zh:  Shock resulting from technological changes 
//      in the home
// zm:  Shock resulting from technological changes 
//      in the market
// ------------------------------------------------------

var C, cm $c_M$, ch $c_H$,
l, hm $h_M$, hh $h_H$,
k, km $k_M$, kh $k_H$,
x, xm $x_M$, xh $x_H$,
r, T, w, y,
zm $z_M$, zh $z_H$;


// ------------------------------------------------------
// Exogenous Variables
// ------------------------------------------------------
// eh:  Innovations in the home
// em:  Innovations in the market
// ------------------------------------------------------

varexo eh $\epsilon_H$, em $\epsilon_M$;


// ------------------------------------------------------
// Parameters
// ------------------------------------------------------
// Preferences
// ------------------------------------------------------
// a:       Share of market consumption of total 
//          consumption
// b:       Weight factor of consumption vis-a-vis 
//          leisure
// e:       Willingness of a household to substitute 
//          between market consumption and home 
//          consumption
// beta:    Discount factor
// ------------------------------------------------------
// Technology
// ------------------------------------------------------
// eta:     Capital share in the home production function
// theta:   Capital share in the market production 
//          function
// psi:     Willingness of a household to substitute 
//          between capital and time in the home 
//          production
// ------------------------------------------------------
// delta_h: Depreciation rate on household capital
// delta_k: Depreciation rate on business capital 
//          (tax-deductible)
// ------------------------------------------------------
// Growth
// ------------------------------------------------------
// lambda:  Growth rate of endogenous variables	
// ------------------------------------------------------
// Tax rates
// ------------------------------------------------------
// tau_h:   Tax rate on labour income
// tau_k:   Tax rate on capital income     
// ------------------------------------------------------
// Shocks
// ------------------------------------------------------
// rho_h:   Persistence of market technology shock
// rho_m:   Persistence of home technology shock
// sigma_h: Standard deviation of innovations in the 
//          household
// sigma_m: Standard deviation of innovations in the 
//          market
// gamma:   Measures the household’s incentive, to move 
//          economic activity between the home and the 
//          market
// ------------------------------------------------------

parameters a, b, e
beta $\beta$, delta_m $\delta_M$, delta_h $\delta_H$, eta $\eta$,
lambda $\lambda$, rho_h $\rho_H$, rho_m $\rho_M$, tau_k $\tau_k$,
tau_h $\tau_h$, theta $\theta$, sigma_m $\sigma_M$, sigma_h $\sigma_H$, 
gamma $\gamma$, psi $\psi$;


// Assign parameter values to apriori set parameters
// Values as specified in the base model (overriden in specific models)
e       = 2/3;
delta_m = 0.0235;
delta_h = delta_m;
eta     = 0.3245;
gamma   = 2/3;
lambda  = 1.004674;
rho_h   = 0.95;
rho_m   = rho_h;
theta   = 0.2944;
sigma_m = 0.007/(1-theta);
sigma_h = sigma_m;
tau_k   = 0.70;
tau_h   = 0.25;
psi     = -0.5017;
