%Calculation of ca (Entrycapacity when the circulatingflow is not blocked)
function [y] = ca(n_a,q_c)
parameters;
temp =75000 * g(q_c);
y= (n_a/(n_a+1))*f(t_fc,q_c,tau_c,t_Cc)+(1/(n_a+1))*temp;
