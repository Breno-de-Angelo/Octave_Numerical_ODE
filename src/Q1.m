function Q1(f, g, x0, y0, h, n)
  [xxA yyA] = analytic(f, x0, y0, h/10, n*10);
  [xxE yyE] = euler(g, x0, y0, h, n);
  [xxEMe yyEMe] = eulerMelhorado(g, x0, y0, h, n);
  [xxEMo yyEMo] = eulerModificado(g, x0, y0, h, n);
  [xxW yyW] = wray3(g, x0, y0, h, n);
  [xxR yyR] = ralston4(g, x0, y0, h, n)
  #[xxDPE yyDPE] = ode45(g, x0, y0, h, n)
  plot(xxA, yyA)
  hold on
  plot(xxE, yyE)
  plot(xxEMe, yyEMe)
  plot(xxEMo, yyEMo)
  plot(xxW, yyW)
  plot(xxR, yyR)
  #plot(xxDPE, yyDPE)
endfunction
