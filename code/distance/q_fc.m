function [y] = q_fc(tau_c,q_cir)

phi = 1-q_cir*tau_c;
y = (phi*q_cir)/(1-q_cir*tau_c);
