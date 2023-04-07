// preset steady-state values
hms   = 0.33;
hhs   = 0.25;
ls    = 1-hhs-hms;
r_real= 0.015;
rs    = (r_real+delta_m*(1-tau_k))/(1-tau_k);                              //(77)
zms   = 1;
zhs   = 1;

// derived steady-state values
beta  = lambda*((1-tau_k)*rs+1-delta_m*(1-tau_k))^(-1);                    //(78)
km_y  = theta/rs;                                                          //(79)
km_hm = zms*(km_y)^(1/(1-theta));                                          //(80)
ws    = (1-theta)*km_y^(-1)*km_hm;                                         //(81)
ys    = km_hm^theta*hms*zms^(1-theta);                                     //(82)
@#ifdef general_home_production
khs   = (eta*(1-tau_h)*ws)/((1-eta)*(delta_h-1+lambda/beta)*hhs^(psi-1)*zhs^psi);//(157)
@#else
khs   = (eta*(1-tau_h)*ws*hhs)/((1-eta)*(delta_h-1+lambda/beta));          //(83)
@#endif
kms   = km_hm*hms;                                                         //(84)
ks    = khs+kms;                                                           //(85)
xms   = (lambda+delta_m-1)*kms;                                            //(86)
xhs   = (lambda+delta_h-1)*khs;                                            //(87)
xs     = xms+xhs;                                                          //(88)
cms   = ys-xs;                                                             //(89)
@#ifdef general_home_production
chs   = (eta*khs^psi+(1-eta)*(zhs*hhs)^psi)^(1/psi);                       //(158)
@#else
chs   = khs^eta*(zhs*hhs)^(1-eta);                                         //(90)
@#endif
a     = (eta^(-1)*chs^(-e)*khs*cms^(e-1)*(lambda/beta-1+delta_h)+1)^(-1);  //(93)
@#ifdef minimal_home_production
Cs    = cms^a*chs^(1-a);                                                   //(146)
@#else
Cs    = (a*cms^e+(1-a)*chs^e)^(1/e);                                       //(91)
@#endif
Ts    = ws*tau_h*hms+rs*tau_k*kms-delta_m*tau_k*kms;                       //(92)
b     = ((1-a)*(1-eta)*Cs^(-e)*chs^e*hhs^(-1)*ls+1)^(-1);                  //(94)
