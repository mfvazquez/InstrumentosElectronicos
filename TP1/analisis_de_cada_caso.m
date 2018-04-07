clear
close all

%% LISTO ARCHIVOS 

archivos = dir(fullfile('DATOS_REFLECTOMETRIA','*.csv'));

for x = 1:length(archivos)
    disp([num2str(x) ' ' archivos(x).name])
end

%% RL serie

x = 7;
M = importdata(fullfile(archivos(x).folder, archivos(x).name));
t = M.data(:,1);
CH1 = M.data(:,2);

inicio = find(CH1 == max(CH1));
t = t(inicio:end);
CH1 = CH1(inicio:end);

tau = CalcularTau(t,CH1);

disp(['RL serie tau = ', num2str(tau)])

%% RL PARALELO

x = 8;
M = importdata(fullfile(archivos(x).folder, archivos(x).name));
t = M.data(:,1);
CH1 = M.data(:,2);

fin = 410;
inicio = find(CH1 == max(CH1));
t = t(inicio:fin);
CH1 = CH1(inicio:fin);

tau = CalcularTau(t,CH1);
disp(['RL paralelo tau = ', num2str(tau)])

%% RC SERIE
x = 1
figure
plot(t,CH1)