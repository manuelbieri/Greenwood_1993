// preset steady-state values
hms   = 0.33;
hhs   = 0.25;
ls    = 1-hhs-hms;
zms   = 1;
zhs   = 1;


// derived steady-state values
rs    = (lambda*beta^(-1)+delta_m-1-delta_m*tau_k)/(1-tau_k);                                   //(77)
km_y  = theta/rs;                                                                               //(78)
km_hm = zms*(km_y)^(1/(1-theta));                                                               //(79)
ws    = (1-theta)*km_y^(-1)*km_hm;                                                              //(80)
ys    = km_hm^theta*hms*zms^(1-theta);                                                          //(81)

@#ifdef general_home_production
khs   = ((eta*(1-tau_h)*ws)/((1-eta)*(delta_h-1+lambda/beta)*hhs^(psi-1)*zhs^psi))^(1/(1-psi)); //(160)
display("Replace (83) with (160) for steady state calculation")
@#else
khs   = (eta*(1-tau_h)*ws*hhs)/((1-eta)*(delta_h-1+lambda/beta));                               //(83)
@#endif

kms   = km_hm*hms;                                                                              //(84)
ks    = khs+kms;                                                                                //(85)
xms   = (lambda+delta_m-1)*kms;                                                                 //(86)
xhs   = (lambda+delta_h-1)*khs;                                                                 //(87)
xs     = xms+xhs;                                                                               //(88)
cms   = ys-xs;                                                                                  //(89)

@#ifdef general_home_production
chs   = (eta*khs^psi+(1-eta)*(zhs*hhs)^psi)^(1/psi);                                            //(161)
display("Replace (90) with (161) for steady state calculation")
@#else
chs   = khs^eta*(zhs*hhs)^(1-eta);                                                              //(90)
@#endif

Ts    = ws*tau_h*hms+rs*tau_k*kms-delta_m*tau_k*kms;                                            //(91)

@#ifdef general_home_production
a     = (eta^(-1)*chs^(psi-e)*khs^(1-psi)*cms^(e-1)*(lambda/beta-1+delta_h)+1)^(-1);            //(162)
display("Replace (92) with (162) for steady state calculation")
@#else
a     = (eta^(-1)*chs^(-e)*khs*cms^(e-1)*(lambda/beta-1+delta_h)+1)^(-1);                       //(92)
@#endif

@#ifdef minimal_home_production
Cs    = cms^a*chs^(1-a);                                                                        //(146)
display("Replace (93) with (146) for steady state calculation")
@#else
Cs    = (a*cms^e+(1-a)*chs^e)^(1/e);                                                            //(93)
@#endif

@#ifdef general_home_production
b     = ((1-a)*(1-eta)*Cs^(-e)*chs^(e-psi)*hhs^(psi-1)*zhs^psi*ls+1)^(-1);                      //(163)
display("Replace (94) with (163) for steady state calculation")
@#else
b     = ((1-a)*(1-eta)*Cs^(-e)*chs^e*hhs^(-1)*ls+1)^(-1);                                       //(94)
@#endif
