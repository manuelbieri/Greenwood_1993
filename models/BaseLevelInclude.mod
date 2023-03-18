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

@#includepath "Hooks/Base"

@#include "BaseVariables.mod"

@#include "BaseSteadyState.mod"

// Equations of the Model
model;
    // FOCS of the household
    [name = 'Household FOC w.r.t. hh']
    (1-a)*b*(1-eta)*C^(-e)*ch^e*hh^(-1) = (1-b)*l^(-1);
    [name = 'Household FOC w.r.t. hm']
    a*b*(1-tau_h)*(1-theta)*C^(-e)*cm^(e-1)*y*hm^(-1) = (1-b)*l^(-1);
    [name = 'Household FOC w.r.t. kh']
    beta*C(+1)^(-e)*(a*(1-delta_h)*cm(+1)^(e-1)+(1-a)*eta*ch(+1)^e*kh^(-1)) = a*lambda*C^(-e)*cm^(e-1);
    [name = 'Household FOC w.r.t. km']
    beta*C(+1)^(-e)*cm(+1)^(e-1)*(r(+1)*(1-tau_k)+delta_m*tau_k+1-delta_m) = lambda*C^(-e)*cm^(e-1);
    
    // FOCs of the firm
    [name = 'Firm FOC w.r.t. km']
    theta*y*km(-1)^(-1) = r;
    [name = 'Firm FOC w.r.t. hm']
    (1-theta)*y*hm^(-1) = w;

    [name = 'Market Output']
    y = km(-1)^(theta)*(zm*hm)^(1-theta);
    
    [name = 'Home Output']
    ch = kh(-1)^eta*(zh*hh)^(1-eta);

    [name = 'Aggregate Consumption']
    C = (a*cm^e+(1-a)*ch^e)^(1/e);
    
    [name = 'Leisure']
    l = 1-hh-hm;
    
    [name = 'Market Investments']
    xm = lambda*km-(1-delta_m)*km(-1);
    
    [name = 'Home Investments']
    xh = lambda*kh-(1-delta_h)*kh(-1);
    
    [name = 'Aggregate Investments']
    x = xm+xh;
    
    [name = 'Aggregate Capital']
    k = km+kh;
    
    [name = 'Government Lump Sum Transfer']
    T = w*tau_h*hm+r*tau_k*km(-1)-delta_m*tau_k*km(-1);
    
    [name = 'Resource Constraint']
    y = cm + x;
    
    [name = 'Market Technology']
    log(zm) = rho_m*log(zm(-1))+em;

    [name = 'Home Technology']
    log(zh) = rho_h*log(zh(-1))+eh;
end;

// Initial values
initval;
    C=Cs;
    @#include "BaseInitval.mod"
end;

@#include "BaseRun.mod"

// Launch solving procedure
stoch_simul(order=1, irf=80, hp_filter=1600,periods=1000) C,cm,ch,k,km,kh,x,xm,xh,l,hm,hh,zm,zh,r,w,y,T;