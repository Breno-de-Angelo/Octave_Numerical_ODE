function [G xx yy] = analytic(f, x0, y0, h, n)
  syms y(x);
  ode = diff(y, x) == f;
  vi = y(x0)==y0;
  g = rhs(dsolve(ode, vi))
  G = matlabFunction(g);
  xx = x0:h:n*h;
  yy = G(xx);
endfunction
