%Returns the maximum entry flow considering only the circulating flow q_c
function[y]= f(t_fc,q_c,tau_c,t_Cc)
y = 3600*(1/t_fc)*(1-tau_c*(q_c))*exp((-q_c)*(t_Cc-(t_fc/2)-tau_c));
