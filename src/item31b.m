function item31b()
  t_vec = linspace(1, 600);
  Qin_param = 45;
  Qout_param = 40;

  y = volume(Qin_param, Qout_param, t_vec);

  plotarVolume(t_vec, y)
endfunction
