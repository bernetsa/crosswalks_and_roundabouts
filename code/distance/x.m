function y = x(q_m,t_c,t_f,q)
y = (q_m*exp(t_c-t_f)*(exp(t_f*q)-1))/q;
