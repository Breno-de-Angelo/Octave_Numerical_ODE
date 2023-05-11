function [xx yy] = ralston4(f, x0, y0, h, n)
  xx = zeros(n+1, 1);
  yy = zeros(n+1, 1);
  xx(1) = x0;
  yy(1) = y0;
  for i = 2:(n+1)
    xx(i) = xx(i-1) + h;
    k1 = f(xx(i-1), yy(i-1));
    k2 = f(xx(i-1) + 0.4*h, yy(i-1)+h*0.3*k1);
    k3 = f(xx(i-1)+0.45573725*h, yy(i-1)+h*(0.29697761*k1+0.15875964*k2));
    k4 = f(xx(i-1)+1*h, yy(i-1) + h* (0.21810040*k1 - 3.05096516*k2 + 3.82386476*k3));
    yy(i) = yy(i-1) + h*(0.17476028*k1 - 0.55148066*k2 + 1.20553560*k3 + 0.17118478*k4);
  endfor
endfunction
