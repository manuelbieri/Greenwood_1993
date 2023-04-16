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

var C (long_name='Total consumption'),
cm $c_M$ (long_name='Market consumption'), 
ch $c_H$ (long_name='Home consumption'),
l (long_name='Leisure'),
hm $h_M$ (long_name='Market hours'),
hh $h_H$ (long_name='Home hours'),
k (long_name='Total capital'),
km $k_M$ (long_name='Market capital'),
kh $k_H$ (long_name='Home capital'),
x (long_name='Total investment'),
xm $x_M$ (long_name='Market investment'),
xh $x_H$ (long_name='Home investment'),
r (long_name='Rental rate'),
T (long_name='Lump sum transfer'), 
w (long_name='Wage'), 
y (long_name='Output'),
zm $z_M$ (long_name='Market technology'), 
zh $z_H$ (long_name='Home technology');


// ------------------------------------------------------
// Exogenous Variables
// ------------------------------------------------------
// eh:  Innovations in the home
// em:  Innovations in the market
// ------------------------------------------------------

varexo eh $\epsilon_H$ (long_name='Home innovation'),
em $\epsilon_M$ (long_name='Market innovation');


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

parameters a (long_name='Share of market consumption'), 
b (long_name='Weight factor of consumption vis-a-vis leisure'), 
e  (long_name='Willingness to substitute between kinds of consumption'),
beta $\beta$ (long_name='Discount factor'),
delta_m $\delta_M$ (long_name='Depreciation rate on business capital'),
delta_h $\delta_H$ (long_name='Depreciation rate on household capital'),
eta $\eta$ (long_name='Capital share in the home'),
lambda $\lambda$ (long_name='Growth rate of endogenous variables'),
rho_h $\rho_H$ (long_name='Persistence of market technology shock'),
rho_m $\rho_M$ (long_name='Persistence of home technology shock'),
tau_k $\tau_k$ (long_name='Tax rate on capital income'),
tau_h $\tau_h$ (long_name='Tax rate on labour income'),
theta $\theta$ (long_name='Capital share in the market'),
sigma_m $\sigma_M$ (long_name='Standard deviation of innovations in the market'),
sigma_h $\sigma_H$ (long_name='Standard deviation of innovations in the household'), 
gamma $\gamma$ (long_name='Incentive to move activity between home and market'),
psi $\psi$ (long_name='Willingness to substitute between capital and time');


// Assign parameter values to apriori set parameters
// Values as specified in the base model (overriden in specific models)
beta    = 0.9898;
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
