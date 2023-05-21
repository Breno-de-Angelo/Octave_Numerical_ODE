function item31c()
  t_vec = linspace(1, 500);
  Qin_param = 40;
  Qout_param = 40;

  y = volume(Qin_param, Qout_param, t_vec);

  plotarVolume(t_vec, y)
endfunction
