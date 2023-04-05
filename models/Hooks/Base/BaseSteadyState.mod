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

@#if modelnr==1
    Cs  = cms^a+chs^(1-a);
@#else
    Cs  = (a*cms^e+(1-a)*chs^e)^(1/e);
@#endif

b       = ((1-a)*(1-eta)*Cs^(-e)*chs^e*hhs^(-1)*ls+1)^(-1);
Ts      = ws*tau_h*hms+rs*tau_k*kms-delta_m*tau_k*kms;