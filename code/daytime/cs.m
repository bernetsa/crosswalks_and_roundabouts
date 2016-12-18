%Returns the general Entrycapacity of the roundabout
function[y]=cs(n_a,q_c,q_cprime,q_p,q_pprime)
p_Q = P_q(q_cprime,q_pprime);
Ca = ca(n_a,q_c,q_p);
y = (1-p_Q)*Ca;
