// ------------------------------------------------------
// Replication of: 
// Example et al. European Economic Review 44 (2018)
// The role of XX in the business cycle.
// ------------------------------------------------------ 
// Firstname Lastname 
// Department of Economics 
// University of Bern
// 2018
// CONTACT: first name.lastname@students.unibe.ch
// ------------------------------------------------------

// ------------------------------------------------------
// Notes:
//
// Baseline Model: 
// Comment here which version of the model you coded, i.e.: 
// with adjustment cost but no time varying depreciation rate
// ------------------------------------------------------

// Endogenous variables
var c, i_e, i_s, y, k_s, k_e, q, z, l; 

// Exogenous variables
varexo xi, pi;

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
parameters alpha_e, alpha_s, beta, gamma_q, 
tau_k, tau_l, theta, omega, g, 
rho1, sigma1, rho2, sigma2, phi;

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


