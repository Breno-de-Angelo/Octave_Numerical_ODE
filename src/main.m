pkg load symbolic

syms y(x) f(x) h n x0 y0;
eq = "";

eq = "e^x * y\' + 2 * e^x * y = 1";
f(x) = (1 - 2*exp(x)*y)*exp(-x);
g = @(x,y) (1 - 2*exp(x)*y)*exp(-x);
x0 = sym (0);
y0 = sym (1);
h = sym (1) / 2;
n = sym (5);
[xAa yAa xNa yNa xPAa yPAa erra errPADPa] = Q1(f,g,x0,y0,h,n,1,eq);

eq = "x*y\' + 3*y = sin(x)/x^2";
f(x) = (sin(x)/x^2 - 3*y) / x;
g = @(x,y) (sin(x)/x^2 - 3*y) / x;
x0 = sym (pi);
y0 = sym (1);
h = sym (1.0);
n = sym (5);
[xAb yAb xNb yNb xPAb yPAb errb errPADPb] = Q1(f,g,x0,y0,h,n,2,eq);

eq = "y\' + tan(x)*y = cos(x)^2";
f(x) = (cos(x))^2 - y*tan(x);
g = @(x,y) (cos(x))^2 - y*tan(x);
x0 = sym (pi)/ 8;
y0 = sym (1);
h = sym (pi)/16;
n = sym (5);
[xAc yAc xNc yNc xPAc yPAc errc errPADPc] = Q1(f,g,x0,y0,h,n,3,eq);

eq = "x*y\' + 2*y = 1 - 1/x";
f(x) = (1 -1/x -2*y) / x;
g = @(x,y) (1 -1/x -2*y) / x;
x0 = sym (1);
y0 = sym (1);
h = sym (1) /10;
n = sym (5);
[xAd yAd xNd yNd xPAd yPAd errd errPADPd] = Q1(f,g,x0,y0,h,n,4,eq);

Q2()
