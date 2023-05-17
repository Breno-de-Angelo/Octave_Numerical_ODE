% Input: f, x0, y0, h, n
%   f: symbolic function f, such that y' = f(x, y)
%   g: anonymous function g, such that y' = g(x, y)
%   x0: initial x
%   y0: initial y
%   h: step size
%   n: number of steps
% Output: plot


function [xxA yyA x y xxPADP yyPADP err errPADP] = Q1(f, g, x0, y0, h, n)

  % Solucoes
  [gA xxA yyA] = analytic(f, x0, y0, h/10, n*10); % solucao analitica
  [xxE yyE] = euler(g, x0, y0, h, n); % metodo de euler
  [xxEMe yyEMe] = eulerMelhorado(g, x0, y0, h, n); % metodo de euler melhorado
  [xxEMo yyEMo] = eulerModificado(g, x0, y0, h, n); % metodo de euler modificado
  [xxW yyW] = wray3(g, x0, y0, h, n); % metodo de Wray/Van der Houwen's
  [xxR yyR] = ralston4(g, x0, y0, h, n); % metodo de Ralston de ordem 4
  [xxEDP yyEDP] = explicitDormandPrince(g, x0, y0, h, n); % Dormand-Prince com valores explicitos da matriz de Butcher
  [xxPFDP yyPFDP] = RungeKutta_Dormand_Prince_ode45(g, x0, y0, h, n, 1); % Dormand-Prince com passo fixo
  x = [xxE xxEMe xxEMo xxW xxR xxEDP' xxPFDP'];
  y = [yyE yyEMe yyEMo yyW yyR yyEDP' yyPFDP'];
  [xxPADP yyPADP] = RungeKutta_Dormand_Prince_ode45(g, x0, y0, h, n, 0); % Dormand-Prince com passo adaptativo

  % Plot solucoes
  hold on;
  plot(xxA, yyA)
  plot(xxE, yyE)
  plot(xxEMe, yyEMe)
  plot(xxEMo, yyEMo)
  plot(xxW, yyW)
  plot(xxR, yyR)
  plot(xxEDP, yyEDP)
  plot(xxPFDP, yyPFDP)
  plot(xxPADP, yyPADP)
  
  % Erros
  err = abs(y(2:end,:) - gA(x(2:end,:)));
  errPADP = abs(yyPADP(2:end) - gA(xxPADP(2:end)));

  % Plot erros
  figure;
  hold on;
  semilogy(xxE(2:end), err(:,1))
  semilogy(xxEMe(2:end), err(:,2))
  semilogy(xxEMo(2:end), err(:,3))
  semilogy(xxW(2:end), err(:,4))
  semilogy(xxR(2:end), err(:,5))
  semilogy(xxEDP(2:end), err(:,6))
  semilogy(xxPFDP(2:end), err(:,7))
  semilogy(xxPADP(2:end), errPADP)

endfunction
