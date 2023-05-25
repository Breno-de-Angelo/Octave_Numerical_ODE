
function plotarMassaConcentracao(t_vec, y1, y2,  Qin_param, Qout_param, i)
    c0_param = 0.05;
    cin_param = 2;


    y = volume(Qin_param, Qout_param, t_vec);
    figure(i);
    subplot(2, 1, 1);
    plot(t_vec, y2);
    hold on;
    plot(t_vec, y);
    hold off;
    line([min(t_vec), max(t_vec)], [2000, 2000], "linestyle", "--");
    line([min(t_vec), max(t_vec)], [5000, 5000], "linestyle", "--");
    grid on;
    box off;

    xlabel('t(min)');
    ylabel('m(kg); V(L)');
    title('Evolução temporal de material e volume do tanque');
    legend('m', 'V', 'V0', 'Vmax');

    subplot(2, 1, 2);
    plot(t_vec, y1);
    line([min(t_vec), max(t_vec)], [c0_param, c0_param], "linestyle", "--")
    line([min(t_vec), max(t_vec)], [cin_param, cin_param], "linestyle", "--")
    grid on;
    box off;

    xlabel('c(min)');
    ylabel('c(kg/L)');
    title('Evolução temporal de concentração');
    legend('c', 'c0', 'cin');
    figure_name = sprintf("../figures/figure%d.jpg", i);
    print(i, figure_name);

endfunction
