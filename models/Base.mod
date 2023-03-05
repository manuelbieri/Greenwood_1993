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
r,w, y; 

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
rho_h $\rho_H$, rho_m $\rho_M$, tau_k $\tau_K$, tau_h $\tau_H$, 
theta $\theta$, sigma_m $\sigma_M$, sigma_h $\sigma_H$;

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
e       = 0;
delta_m = 0.0235;
delta_h = delta_m;
eta     = 0.3245;
lambda  = 1.004674;
rho_h   = 0.95;
rho_m   = rho_h;
sigma_m = 0.007;
sigma_h = sigma_m;
tau_k   = 0.7;
tau_h   = 0.25;
theta   = 0.2944;

// Assisting the steady state
// Set pre-defined parameters

hms     = 0.33;
hhs     = 0.25;
r_real  = 1.06;
rs      = (r_real+delta_m*(1-tau_k)-1)/(1-tau_k);
zms     = 1;
zhs     = 1;

km_y = theta/rs;
kms = zms*hms*(km_y)^(1/(1-theta));
ys = km_y^(-1)*kms;
ws = (1-theta)*ys/hms;
beta = lambda*((1-tau_k)*rs+1-delta_m*(1-tau_k))^(-1);
khs = 0.2;
ks = khs+kms;
xms = (lambda+delta_m-1)*kms; 
xhs = (lambda+delta_m-1)*khs;
xs = xms+xhs;
cms = ys+xs;
chs = khs^eta*(zhs*hhs)^(1-eta);
a = 0.1;
b = 0.1;
Cs = (a*cms^e+(1-a)*chs^e)^(1/e);


// Equations of the Model
model;
    (1-a)*b*(1-eta)*C^(-e)*ch^e*hh^(-1)                             = (1-b)*l^(-1);
    a*b*(1-theta)*C^(-e)*cm^(e-1)*y*hm^(-1)                         = (1-b)*l^(-1);
    beta*C^(-e)*(a*(1-delta_h)*cm^(e-1)+(1-a)*eta*ch^e*kh(-1)^(-1)) = a*lambda*C(-1)^(-e)*cm(-1)^(e-1);
    beta*C^(-e)*cm^(e-1)*(r*(1-tau_k)+delta_m*tau_k+1-delta_m)      = lambda*C(-1)^(-e)*cm(-1)^(e-1);
    theta*y*km(-1)^(-1) = r;
    (1-theta)*y*hm^(-1) = w;
    y                   = km(-1)^(theta)*(zm*hm)^(1-theta);
    C^e                 = a*cm^e+(1-a)*ch^e;
    l = 1-hh-hm;
    ch = k(-1)^eta*(zh*hh)^(1-eta);
    xm = lambda*km-(1-delta_m)*km(-1);
    xh = lambda*kh-(1-delta_h)*kh(-1);
    x = xm+xh;
    k(-1) = km(-1)+kh(-1);
    // 1. Labour

    // 2. Varying Depreciation Rate for equipment
    
    // 3. Investment for structures 
    
    // 4. Investment for equipment

    // 5. Output

    // 6. Resource Constraint
    y = cm + x;

    // 7. Euler Equation: Structures
    
    // 8. Euler Equation: Equipment
     
    // 10. Define Sector Neutral Technology process 
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
    l=1-hhs-hms;
    hm=hms;
    hh=hhs;
    zm=zms;
    zh=zhs;
    r=rs;
    w=ws; 
    y=ys;
end;

// Checking for the steady state
steady;
check;

// Declaring the shocks
shocks;
var em; stderr sigma_m; // Investment-Specific Shock
var eh; stderr sigma_h; // Investment-Specific Shock
end;

// Launch solving procedure
stoch_simul(order=1, irf=40, hp_filter=1600) C,cm,ch,k,km,kh,x,xm,xh,l,hm,hh,zm,zh,r,w,y;

