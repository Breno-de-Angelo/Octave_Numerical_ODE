% Input: f, x0, y0, h, n
%   f: symbolic function f, such that y' = f(x, y)
%   g: anonymous function g, such that y' = g(x, y)
%   x0: initial x
%   y0: initial y
%   h: step size
%   n: number of steps
% Output: plot


function [xxA yyA x y xxPADP yyPADP err errPADP] = Q1(f, g, x0, y0, h, n, i)

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
  figure(2*i - 1);
  hold on;
  xlabel('Eixo X');
  ylabel('Eixo Y');
  title('Solução');
  h1 = plot(xxA, yyA, 'bd-');
  h2 = plot(xxE, yyE, 'go-');
  h3 = plot(xxEMe, yyEMe, 'bx-');
  h4 = plot(xxEMo, yyEMo, 'cs-');
  h5 = plot(xxW, yyW, 'md-');
  h6 = plot(xxR, yyR, 'yv-');
  h7 = plot(xxEDP, yyEDP, 'k^-');
  h8 = plot(xxPFDP, yyPFDP, 'r>-');
  h9 = plot(xxPADP, yyPADP, 'b<-');

  % Adicionar objeto de legenda para o marcador personalizado
  h1_marker = plot(nan, nan, 'bd'); % Cria um objeto com cor e marcador desejados
  legend([h1_marker, h2, h3, h4, h5, h6, h7, h8, h9], 'y(x)', 'Euler', 'Euler Mel.', 'Euler Mod.', 'V d Houven/Wray', 'Ralston', 'Dorm.-Pr45-Bu', 'ODE45 fixo.', 'ODE45 adap.', 'Location', 'northeast');  
  hold off;
  
  % Salvar a figura
  figure_name = sprintf("../figures/figure%d.jpg", 2*i-1);
  print(2*i - 1, figure_name);

  % Erros
  err = abs(y(2:end,:) - gA(x(2:end,:)));
  errPADP = abs(yyPADP(2:end) - gA(xxPADP(2:end)));

  % Plot erros
  figure(2*i);
  hold on;
  xlabel('Eixo X')
  ylabel('Eixo Y')
  title('Erros,Escala Logaritimica');

  semilogy(xxE(2:end), err(:,1),'go-')
  semilogy(xxEMe(2:end), err(:,2),'bx-')
  semilogy(xxEMo(2:end), err(:,3),'cs-')
  semilogy(xxW(2:end), err(:,4),'md-')
  semilogy(xxR(2:end), err(:,5),'yv-')
  semilogy(xxEDP(2:end), err(:,6),'k^-')
  semilogy(xxPFDP(2:end), err(:,7),'r>-')
  semilogy(xxPADP(2:end), errPADP,'b<-')
  hold off;

  % Adicionar legenda
  legend('Euler', 'Euler Mel.', 'Euler Mod.', 'V d Houven/Wray', 'Ralston', 'Dorm.-Pr45-Bu', 'ODE45 fixo.', 'ODE45 adap.', 'Location', 'southeast');
  
  % Salvar a figura
  figure_name = sprintf("../figures/figure%d.jpg", 2*i);
  print(2*i, '-djpg', figure_name);

  % Gerando uma tabela
  fprintf('%10s  |%12s |%12s |%12s |%12s |%12s |%12s |%14s |%12s |%12s \n', 'x', 'Valor Exato', 'Euler', 'Euler Mel.', 'Euler Mod.', 'V d Houven/Wray', 'Ralston', 'Dorm.-Pr45-Bu', 'ODE45 fixo', 'ODE45 adap');
  fprintf('==============================================================================================================================================================================================\n')
  for i = 1:min(length(x), length(yyE))
    yyPADP_value = '-----';
    yyE_value = num2str(yyE(i));
    fprintf('%10.2f |%12.6f |%12.6f |%12.6f |%12.6f |%12.6f |%12.6f |%14.6f |%12.6f |%12s \n', x(i), gA(x(i)), yyE(i), yyEMe(i), yyEMo(i), yyW(i), yyR(i), yyEDP(i), yyPFDP(i), yyPADP_value);
  end

  % Gerando uma tabela de erros
  fprintf('Erros\n')
  for i = 1:(min(length(x), length(yyE))-1)
    yyPADP_value = '-----';
    yyE_value = num2str(yyE(i));
    fprintf('%10.2f |%12.6e |%12.6e |%12.6e |%12.6e |%12.6e |%12.6e |%14.6e |%12.6e |%12s\n', x(i+1), 0, err(i, 1), err(i, 2), err(i, 3), err(i, 4), err(i, 5), err(i, 6), errPADP(i), yyPADP_value);
  end

endfunction


