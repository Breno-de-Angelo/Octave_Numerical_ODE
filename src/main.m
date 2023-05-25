pkg load symbolic

syms y(x)
syms f(x)
f(x) = (1 - 2*exp(x)*y)*exp(-x);
g = @(x,y) (1 - 2*exp(x)*y)*exp(-x);
x0 = 0;
y0 = 1;
h = 0.5;
n = 5;
[xAa yAa xNa yNa xPAa yPAa erra errPADPa] = Q1(f,g,x0,y0,h,n, 1);


f(x) = (sin(x)/x^2 - 3*y) / x;
g = @(x,y) (sin(x)/x^2 - 3*y) / x;
x0 = pi;
y0 = 1;
h = 1.0;
n = 5;
[xAb yAb xNb yNb xPAb yPAb errb errPADPb] = Q1(f,g,x0,y0,h,n, 2);

f(x) = (cos(x))^2 - y*tan(x);
g = @(x,y) (cos(x))^2 - y*tan(x);
x0 = pi/8;
y0 = 1;
h = pi/16;
n = 5;
[xAc yAc xNc yNc xPAc yPAc errc errPADPc] = Q1(f,g,x0,y0,h,n, 3);

f(x) = (1 -1/x -2*y) / x;
g = @(x,y) (1 -1/x -2*y) / x;
x0 = 1;
y0 = 1;
h = 0.1;
n = 5;
[xAd yAd xNd yNd xPAd yPAd errd errPADPd] = Q1(f,g,x0,y0,h,n, 4);

Q2()
