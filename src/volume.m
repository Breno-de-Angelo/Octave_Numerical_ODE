function f = volume(Qin_param, Qout_param, t_vec)
  syms V(t) Qin Qout V0
  deq = diff(V(t), t) == Qin - Qout
  V(t) = dsolve(deq, V(0) == V0)
  func = matlabFunction(V(t))
  f = func(Qin_param, Qout_param, 2000, t_vec)
endfunction
