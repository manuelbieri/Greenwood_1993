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

// Assisting the steady state
// Set pre-defined parameters

hms     = 0.33;
hhs     = 0.25;
ls      = 1-hhs-hms;
r_real  = 0.015;
rs      = (r_real+delta_m*(1-tau_k))/(1-tau_k);
zms     = 1;
zhs     = 1;

beta    = lambda*((1-tau_k)*rs+1-delta_m*(1-tau_k))^(-1);
km_y    = theta/rs;
km_hm   = zms*(km_y)^(1/(1-theta));
ws      = (1-theta)*km_y^(-1)*km_hm;
ys      = km_hm^theta*hms*zms^(1-theta);
khs     = (eta*(1-tau_h)*ws*hhs)/((1-eta)*(delta_h-1+lambda/beta));
kms     = km_hm*hms;
ks      = khs+kms;
xms     = (lambda+delta_m-1)*kms; 
xhs     = (lambda+delta_h-1)*khs;
xs      = xms+xhs;
cms     = ys-xs;
chs     = khs^eta*(zhs*hhs)^(1-eta);
a       = (eta^(-1)*chs^(-e)*khs*cms^(e-1)*(lambda/beta-1+delta_h)+1)^(-1);
Cs      = (a*cms^e+(1-a)*chs^e)^(1/e);
b       = ((1-a)*(1-eta)*Cs^(-e)*chs^e*hhs^(-1)*ls+1)^(-1);
Ts      = ws*tau_h*hms+rs*tau_k*kms-delta_m*tau_k*kms;

// check ratios
km_y = kms/ys; // should be 4
kh_y = khs/ys; // should be 5
xm_y = xms/ys; // should be 0.118
xh_y = xhs/ys; // should be 0.135


// Equations of the Model
model;
    // FOCS of the household
    [name = 'Household FOC w.r.t. hh']
    (1-a)*b*(1-eta)*C^(-e)*ch^e*hh^(-1)                             = (1-b)*l^(-1);
    [name = 'Household FOC w.r.t. hm']
    a*b*(1-tau_h)*(1-theta)*C^(-e)*cm^(e-1)*y*hm^(-1)               = (1-b)*l^(-1);
    [name = 'Household FOC w.r.t. kh']
    beta*C(+1)^(-e)*(a*(1-delta_h)*cm(+1)^(e-1)+(1-a)*eta*ch(+1)^e*kh^(-1)) = a*lambda*C^(-e)*cm^(e-1);
    [name = 'Household FOC w.r.t. km']
    beta*C(+1)^(-e)*cm(+1)^(e-1)*(r(+1)*(1-tau_k)+delta_m*tau_k+1-delta_m)  = lambda*C^(-e)*cm^(e-1);
    
    // FOCs of the firm
    // w.r.t. km
    theta*y*km(-1)^(-1) = r;
    // w.r.t. hm
    (1-theta)*y*hm^(-1) = w;

    // market output
    y   = km(-1)^(theta)*(zm*hm)^(1-theta);
    // home output
    ch  = kh(-1)^eta*(zh*hh)^(1-eta);
    
    C = (a*cm^e+(1-a)*ch^e)^(1/e);
    l   = 1-hh-hm;
    xm  = lambda*km-(1-delta_m)*km(-1);
    xh  = lambda*kh-(1-delta_h)*kh(-1);
    x   = xm+xh;
    k   = km+kh;

    // Lump sum transfer of the government
    T = w*tau_h*hm+r*tau_k*km(-1)-delta_m*tau_k*km(-1);

    // Resource Constraint
    y = cm + x;
     
    // Technology process es
    log(zm) = rho_m*log(zm(-1))+em;
    log(zh) = rho_h*log(zh(-1))+eh;
end;

// write model to tex file
write_latex_dynamic_model;

// Initial values
initval;
    C=Cs;
    cm=cms;
    ch=chs;
    k=ks;
    km=kms;
    kh=khs;
    x=xs;
    xm=xms;
    xh=xhs;
    l=ls;
    hm=hms;
    hh=hhs;
    zm=zms;
    zh=zhs;
    r=rs;
    w=ws; 
    y=ys;
    T=Ts;
    em=0;
    eh=0;
end;

// Declaring the shocks
shocks;
var em; stderr sigma_m; // Investment-Specific Shock
var eh; stderr sigma_h; // Investment-Specific Shock
corr em,eh=gamma;
end;

// Checking for the steady state
resid;
steady;
check;

model_diagnostics;
model_info;

// Launch solving procedure
stoch_simul(order=1, irf=40, hp_filter=1600,periods=1000) C,cm,ch,k,km,kh,x,xm,xh,l,hm,hh,zm,zh,r,w,y;


