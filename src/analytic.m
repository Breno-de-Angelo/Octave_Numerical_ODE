function [xx yy] = analytic(f, x0, y0, h, n)
  #pkg load symbolic;
  syms y(x);
  syms g(x);
  ode = diff(y, x) == f;
  vi = y(x0)==y0;
  g(x) = dsolve(ode, vi)
  G = matlabFunction(g(x));
  xx = x0:h:n*h;
  yy = G(xx);
endfunction
