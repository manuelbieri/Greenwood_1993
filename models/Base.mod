// ------------------------------------------------------
// Replication of: 
// Greenwood et al. (1993)
// Federal Reserve Bank of Minneapolis Quarterly Review 17(3)
// Putting Home Economics Into Macroeconomics.
// ------------------------------------------------------ 
// Manuel Bieri (manuel.bieri@students.unibe.ch)
// Michael Wagner (michael.wagner@students.unibe.ch)
// Department of Economics 
// University of Bern
// 2023
// ------------------------------------------------------

// ------------------------------------------------------
// Notes:
//
// Baseline Model: 
// Comment here which version of the model you coded, i.e.: 
// with adjustment cost but no time varying depreciation rate
// ------------------------------------------------------

// Endogenous variables
var C, cm, ch,
k, km, kh,
x, xm, xh,
l, hm, hh,
zm, zh,
r,w, y; 

// Exogenous variables
varexo em, eh;

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
beta, delta_m, delta_h, eta, 
rho_h, rho_m, tau_k, tau_k, theta;

// Assign parameter values to apriori set parameters
gamma_q =       1.032;
delta_s =       0.056;
bhomega_omega_ss = 0.124;               

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

// Assisting the steady state
// Set pre-defined parameters

// Capital share income of 30 Percent
alpha_es=0.3;               


// Get remaining parameters to assist steady state:
theta=((ls*(csys))/((1-tau_l)*(1-(alpha_es))*(1-ls)+(ls*csys)));

// Get values of Variables in Steady State: y, c, i_e, i_s, k_e, k_s:
ys=(zs*((hss*k_esys)^alpha_e));
css=csys*ys;
i_ess=i_esys*ys;
k_sss=k_ssys*ys;

// Equations of the Model
model;
    
    // 1. Labour

    // 2. Varying Depreciation Rate for equipment
    
    // 3. Investment for structures 
    
    // 4. Investment for equipment

    // 5. Output

    // 6. Resource Constraint
    
    // 7. Euler Equation: Structures
    
    // 8. Euler Equation: Equipment
     
    // 10. Define Sector Neutral Technology process 

end;

// Initial values
initval;
xi=0;
pi=0;
end;

// Checking for the steady state
steady;
check;

// Declaring the shocks
shocks;
var xi; stderr sigma1; // Investment-Specific Shock
end;

// Launch solving procedure
stoch_simul(order=1, irf=40, hp_filter=1600) y, c, q, i_s, i_e, k_s, k_e, l, h;


