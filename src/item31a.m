function item31a()
  t_vec = linspace(1, 400);
  Qin_param = 40;
  Qout_param = 45;

  y = volume(Qin_param, Qout_param, t_vec);

  plotarVolume(t_vec, y, 9);
endfunction
