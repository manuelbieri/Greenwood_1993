// ------------------------------------------------------
// Replication of: 
// Greenwood et al. (1993)
// Federal Reserve Bank of Minneapolis Quarterly Review 17(3)
// Putting Home Economics Into Macroeconomics.
// ------------------------------------------------------ 
// Manuel Bieri (manuel.bieri@students.unibe.ch)
// Michael Wagner (michael.wagner1@students.unibe.ch)
// Department of Economics 
// University of Bern
// 2023
// ------------------------------------------------------

// ------------------------------------------------------
// Notes:
//
// Model 4a (log):
// Model with a more general home production function and
// highly correlated technology shocks
// Additionally: Higher willingness to substitute between
// home hours and home capital
// ------------------------------------------------------

// include the paths to the mod-files
@#includepath "Hooks"
@#includepath "Hooks/Initval"

//preamble
display("Model with a more general home production function and highly correlated technology shocks (logs)")
@#include "preamble.mod"


// set model type
@#define general_home_production


// import variables
@#include "Variables_Parameters.mod"
gamma = 0.99;
psi   = -0.04;

// import steady state values
@#include "SteadyState.mod"


// Equations of the Model
// Numbering of the equations is referring to P&P solution
model;
    [name = '(113) Resource Constraint']
    exp(y) = exp(cm) + exp(x);

    // FOCS of the household
    [name = '(165) Household FOC w.r.t. hh']
    (1-a)*b*(1-eta)*exp(-C*e+ch*(e-psi)+zh*psi+hh*(psi-1)) = (1-b)*exp(-l);
    [name = '(115) Household FOC w.r.t. hm']
    a*b*(1-tau_h)*(1-theta)*exp(-C*e+cm*(e-1)+y-hm) = (1-b)*exp(-l);
    [name = '(167) Household FOC w.r.t. kh']
    beta*exp(-C(+1)*e)*(a*(1-delta_h)*exp(cm(+1)*(e-1))+(1-a)*eta*exp(ch(+1)*(e-psi)+kh*(psi-1))) = a*lambda*exp(-C*e+cm*(e-1));
    [name = '(117) Household FOC w.r.t. km']
    beta*exp(-C(+1)*e+cm(+1)*(e-1))*(exp(r(+1))*(1-tau_k)+delta_m*tau_k+1-delta_m) = lambda*exp(-C*e+cm*(e-1));
    
    // FOCs of the firm
    [name = '(118) Firm FOC w.r.t. km']
    theta*exp(y-km(-1)) = exp(r);
    [name = '(119) Firm FOC w.r.t. hm']
    (1-theta)*exp(y-hm) = exp(w);

    [name = '(120) Market Output']
    exp(y) = exp(km(-1)*theta+(zm+hm)*(1-theta));
    
    [name = '(121) Total Consumption']
    exp(C) = (a*exp(cm*e)+(1-a)*exp(ch*e))^(1/e);

    [name = '(122) Leisure']
    exp(l) = 1-exp(hh)-exp(hm);

    [name = '(174) Home production']
    exp(ch) = (eta*exp(kh(-1)*psi)+(1-eta)*exp((zh+hh)*psi))^(1/psi);

    [name = '(124) Market Investments']
    exp(xm) = lambda*exp(km)-(1-delta_m)*exp(km(-1));
    
    [name = '(125) Home Investments']
    exp(xh) = lambda*exp(kh)-(1-delta_h)*exp(kh(-1));
    
    [name = '(126) Total Investments']
    exp(x) = exp(xm)+exp(xh);
    
    [name = '(127) Total Capital']
    exp(k) = exp(km)+exp(kh);
    
    [name = '(128) Government Transfer']
    exp(T) = exp(w+hm)*tau_h+exp(r+km(-1))*tau_k-delta_m*tau_k*exp(km(-1));

    // Technology Processes
    [name = '(129) Market Technology']
    zm = rho_m*zm(-1)+em;

    [name = '(130) Home Technology']
    zh = rho_h*zh(-1)+eh;
end;

// import initial values
@#include "Initval/Log.mod"


// import run instructions
@#include "Run.mod"


// write models and definitions to tex-files
@#include "Write.mod"