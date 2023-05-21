function plotarVolume(t_vec, y)
  plot(t_vec, y)
  line([min(t_vec), max(t_vec)], [2000, 2000], "linestyle", "--")
  line([min(t_vec), max(t_vec)], [5000, 5000], "linestyle", "--")

  xlabel('t(min)');
  ylabel('V(L)');
  ylim([0, 5000])
  title('Evolução temporal do volume do tanque');
  legend('V', 'V0', 'Vmax');
  grid on
  box off
endfunction