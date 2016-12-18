function [y]= q_fp(tau_p, q_p)
phi = 1-q_p*tau_p;
y = (phi*q_p)/(1-q_p*tau_p);
