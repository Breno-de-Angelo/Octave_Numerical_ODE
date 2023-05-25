function [G xx yy] = analytic(f, x0, y0, h, n)
  syms y(x);
  ode = diff(y, x) == f;
  vi = y(x0)==y0;
  g = dsolve(ode, vi)
  G = matlabFunction(g);
  x0 = double(x0);
  y0 = double(y0);
  h = double(h);
  n = double(n);
  xx = x0:h:n*h;
  yy = G(xx);
endfunction
