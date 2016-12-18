%Returns the general Entrycapacity of the roundabout
function[y]=cs(n_a,q_c)
p_Q = P_q();
Ca = ca(n_a,q_c);
y = (1-p_Q)*Ca;
