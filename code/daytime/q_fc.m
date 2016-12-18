%traffic intenistiy with the portion of free traffic
function [y] = q_fc(tau_c,q_c)
%phi := portion of free traffic in the mahor stream
phi = 1-q_c*tau_c;
y = (phi*q_c)/(1-q_c*tau_c);



