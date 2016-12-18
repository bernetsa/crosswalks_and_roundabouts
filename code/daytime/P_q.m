%Probability of the queue in thecirculating roadqy reaching up to the front
%of the subject entry
function [y]=  P_q(q_cprime,q_pprime)
parameters;
x_pprime = (q_mprime*exp(t_Cp-t_fp)*(exp(t_fp*q_pprime)-1))/q_pprime;
lambda = lambda_x(alpha_x, q_cprime);


%mue_p := service rate whoch is the reciprocal value of the aberage service time
mue_p = 1-(1-x_pprime)*(1-q_pprime*tau_p);

y = 150*(1-(lambda/mue_p))*(lambda/mue_p)^(n_b);
