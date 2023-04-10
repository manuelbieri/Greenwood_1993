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
// Baseline log Model: 
// Model with increased incentive to substitute between 
// home and market
// ------------------------------------------------------

// include the paths to the mod-files
@#includepath "Hooks"
@#includepath "Hooks/Initval"

//preamble
display("Model with increased incentive to substitute between home and market (logs)")
@#include "preamble.mod"

// import variables
@#include "Variables_Parameters.mod"
e       = 0.4;
gamma   = 0;

// import steady state values
@#include "SteadyState.mod"


// Equations of the Model
// Numbering of the equations is referring to P&P solution
model;
    [name = '(114) Resource Constraint']
    exp(y) = exp(cm) + exp(x);

    // FOCS of the household
    [name = '(115) Household FOC w.r.t. hh']
    (1-a)*b*(1-eta)*exp(-C*e+ch*e-hh) = (1-b)*exp(-l);
    [name = '(116)Household FOC w.r.t. hm']
    a*b*(1-tau_h)*(1-theta)*exp(-C*e+cm*(e-1)+y-hm) = (1-b)*exp(-l);
    [name = '(117) Household FOC w.r.t. kh']
    beta*exp(-C(+1)*e)*(a*(1-delta_h)*exp(cm(+1)*(e-1))+(1-a)*eta*exp(ch(+1)*e-kh)) = a*lambda*exp(-C*e+cm*(e-1));
    [name = '(118) Household FOC w.r.t. km']
    beta*exp(-C(+1)*e+cm(+1)*(e-1))*(exp(r(+1))*(1-tau_k)+delta_m*tau_k+1-delta_m) = lambda*exp(-C*e+cm*(e-1));
    
    // FOCs of the firm
    [name = '(119) Firm FOC w.r.t. km']
    theta*exp(y-km(-1)) = exp(r);
    [name = '(120) Firm FOC w.r.t. hm']
    (1-theta)*exp(y-hm) = exp(w);

    [name = '(121) Market Output']
    exp(y) = exp(km(-1)*theta+(zm+hm)*(1-theta));
    
    [name = '(122) Total Consumption']
    exp(C) = (a*exp(cm*e)+(1-a)*exp(ch*e))^(1/e);

    [name = '(123) Leisure']
    exp(l) = 1-exp(hh)-exp(hm);

    [name = '(124) Home production']
    exp(ch) = exp(kh(-1)*eta+(zh+hh)*(1-eta));

    [name = '(125) Market Investments']
    exp(xm) = lambda*exp(km)-(1-delta_m)*exp(km(-1));
    
    [name = '(126) Home Investments']
    exp(xh) = lambda*exp(kh)-(1-delta_h)*exp(kh(-1));
    
    [name = '(127) Total Investments']
    exp(x) = exp(xm)+exp(xh);
    
    [name = '(128) Total Capital']
    exp(k) = exp(km)+exp(kh);
    
    [name = '(129) Government Transfer']
    exp(T) = exp(w+hm)*tau_h+exp(r+km(-1))*tau_k-delta_m*tau_k*exp(km(-1));

    // Technology Processes
    [name = '(130) Market Technology']
    zm = rho_m*zm(-1)+em;

    [name = '(131) Home Technology']
    zh = rho_h*zh(-1)+eh;
end;

// import initial values
@#include "Initval/Log.mod"


// import run instructions
@#include "Run.mod"


// write models and definitions to tex-files
@#include "Write.mod"