function [yC yM] = massa_concentracao(Qin_param, Qout_param, V0_param, c0_param, cin_param, t_vec)
  syms c(t) Qin Qout V0 cin V(t) m(t) c0;

  if(Qin_param == Qout_param)
    deq = diff(c(t), t) == (Qin*(cin - c(t)))/V0;
    c(t) = dsolve(deq, c(0) == c0);
    m(t) = c(t)*V0;
    funcC = matlabFunction(c(t));
    funcM = matlabFunction(m(t));
    yC = funcC(Qin_param, V0_param, c0_param, cin_param, t_vec);
    yM = funcM(Qin_param, V0_param, c0_param, cin_param, t_vec);
  else
    V(t) = V0+(Qin-Qout)*t;
    deq = diff(c(t), t) == (Qin*(cin - c(t)))/V(t);
    c(t) = dsolve(deq, c(0) == c0);
    m(t) = c(t)*V(t);
    funcC = matlabFunction(c(t));
    funcM = matlabFunction(m(t));
    yC = funcC(Qin_param, Qout_param, V0_param, c0_param, cin_param, t_vec);
    yM = funcM(Qin_param, Qout_param, V0_param, c0_param, cin_param, t_vec);
  endif

endfunction
