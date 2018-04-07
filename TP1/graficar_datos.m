clear
close all

archivos = dir(fullfile('DATOS_REFLECTOMETRIA','*.csv'));

for x = 1:length(archivos)

    M = importdata(fullfile(archivos(x).folder, archivos(x).name));

    t = (M.data(:,1) - M.data(1,1))*1e9; % resto para que arranque en 0 y lo paso a ns

    fig = figure;
    set(fig, 'Visible', 'off');
    leyenda = [];
    for y = 2:size(M.data, 2)
        hold on
        plot(t,M.data(:,y))
        xlabel('Tiempo [ns]')
        ylabel('Amplitud [V]')
        leyenda = [leyenda ;['CH' num2str(y-1)]];
    end
    legend(leyenda, 'Location', 'northoutside');
    saveas(gcf,fullfile('imagenes',[archivos(x).name '.png']))

end

