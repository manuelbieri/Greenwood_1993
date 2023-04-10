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
// Baseline level Model: 
// Model with increased incentive to substitute between
// home and market
// ------------------------------------------------------

// include the paths to the mod-files
@#includepath "Hooks"
@#includepath "Hooks/Initval"

//preamble
display("Model with increased incentive to substitute between home and market (levels)")
@#include "preamble.mod"


// import variables
@#include "Variables_Parameters.mod"
// override standard parameter values
e       = 0.4;
gamma   = 0;


// import steady state values
@#include "SteadyState.mod"


// Equations of the Model
// Numbering of the equations is referring to P&P solution
model;
    [name = '(41) Resource Constraint']
    y = cm + x;

    // FOCS of the household
    [name = '(42) Household FOC w.r.t. hh']
    (1-a)*b*(1-eta)*C^(-e)*ch^e*hh^(-1) = (1-b)*l^(-1);
    [name = '(43)Household FOC w.r.t. hm']
    a*b*(1-tau_h)*(1-theta)*C^(-e)*cm^(e-1)*y*hm^(-1) = (1-b)*l^(-1);
    [name = '(44) Household FOC w.r.t. kh']
    beta*C(+1)^(-e)*(a*(1-delta_h)*cm(+1)^(e-1)+(1-a)*eta*ch(+1)^e*kh^(-1)) = a*lambda*C^(-e)*cm^(e-1);
    [name = '(45) Household FOC w.r.t. km']
    beta*C(+1)^(-e)*cm(+1)^(e-1)*(r(+1)*(1-tau_k)+delta_m*tau_k+1-delta_m) = lambda*C^(-e)*cm^(e-1);
    
    // FOCs of the firm
    [name = '(46) Firm FOC w.r.t. km']
    theta*y*km(-1)^(-1) = r;
    [name = '(47) Firm FOC w.r.t. hm']
    (1-theta)*y*hm^(-1) = w;

    [name = '(48) Market Output']
    y = km(-1)^(theta)*(zm*hm)^(1-theta);
    
    [name = '(49) Total Consumption']
    C = (a*cm^e+(1-a)*ch^e)^(1/e);

    [name = '(50) Leisure']
    l = 1-hh-hm;

    [name = '(51) Home production']
    ch = kh(-1)^eta*(zh*hh)^(1-eta);

    [name = '(52) Market Investments']
    xm = lambda*km-(1-delta_m)*km(-1);
    
    [name = '(53) Home Investments']
    xh = lambda*kh-(1-delta_h)*kh(-1);
    
    [name = '(54) Total Investments']
    x = xm+xh;
    
    [name = '(55) Total Capital']
    k = km+kh;
    
    [name = '(56) Government Transfer']
    T = w*tau_h*hm+r*tau_k*km(-1)-delta_m*tau_k*km(-1);

    // Technology Processes
    [name = '(57) Market Technology']
    log(zm) = rho_m*log(zm(-1))+em;

    [name = '(58) Home Technology']
    log(zh) = rho_h*log(zh(-1))+eh;
end;

// import initial values
@#include "Initval/Level.mod"


// import run instructions
@#include "Run.mod"


// write models and definitions to tex-files
@#include "Write.mod"