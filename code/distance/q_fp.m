%traffic intenistiy with the portion of free traffic
function [y]= q_fp(tau_p, q_p)
%phi := portion of free traffic in the mahor stream
phi = 1-q_p*tau_p;   
y = (phi*q_p)/(1-q_p*tau_p);
