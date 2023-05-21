function item32_caso2()
  t_vec = linspace(0,500);
  V0_param = 2000;

  c0_param = 0.05;
  cin_param = 2;
  Qin_param = 40;
  Qout_param = 40;

  [y1 y2] = massa_concentracao(Qin_param, Qout_param, V0_param, c0_param, cin_param, t_vec);

  plotarMassaConcentracao(t_vec, y1, y2, Qin_param, Qout_param)
endfunction
