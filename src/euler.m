function [xx yy] = euler(f, x0, y0, h, n)
  xx = zeros(n+1, 1);
  yy = zeros(n+1, 1);
  xx(1) = x0;
  yy(1) = y0;
  f(1,1)
  for i = 2:(n+1)
    xx(i) = xx(i-1) + h;
    yy(i) = yy(i-1) + h*f(xx(i-1), yy(i-1));
  endfor
endfunction

