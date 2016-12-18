function [y] = g(q_c)
parameters;
%Maximum entryflow considering pedestrians and circulating flow without 
%stopping and storage space
x_p = x(q_m,t_Cp,t_fp,q_p);
x_c = x(q_m,t_Cc,t_fc,q_c);
t_f = (t_fp + t_Cp)/2;

%traffic intenistiy with the portion of free traffic
q_fp1 = q_fp(tau_p, q_p);
q_fc1 = q_fc(tau_c,q_c);

y = ((q_fp1+q_fc1)/(1-exp(-(q_fp1+q_fc1)*t_f)))*(1-x_p) * (1- q_p * tau_p)*exp(-q_fp1*(t_Cp*tau_p))*(1-x_c) * (1- q_c * tau_c)*exp(-q_fc1*(t_Cc*tau_c));


