function [xx yy] = wray3(f, x0, y0, h, n)
  xx = zeros(n+1, 1);
  yy = zeros(n+1, 1);
  xx(1) = x0;
  yy(1) = y0;
  for i = 2:(n+1)
    xx(i) = xx(i-1) + h;
    k1 = f(xx(i-1), yy(i-1));
    k2 = f(xx(i-1) + 8/15*h, yy(i-1)+h*8/15*k1);
    k3 = f(xx(i-1)+2/3*h, yy(i-1)+h*(1/4*k1+5/12*k2));
    yy(i) = yy(i-1) + h*(1/4*k1 + 3/4*k3);
  endfor
endfunction
