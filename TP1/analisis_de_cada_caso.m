clear
close all

%% LISTO ARCHIVOS 

archivos = dir(fullfile('DATOS_REFLECTOMETRIA','*.csv'));

% for x = 1:length(archivos)
%     disp([num2str(x) ' ' archivos(x).name])
% end

%% RL SERIE R = 100 L = 18u

x = 7;
M = importdata(fullfile(archivos(x).folder, archivos(x).name));
t = M.data(:,1);
CH1 = M.data(:,2);

inicio = find(CH1 == max(CH1));
t = t(inicio:end);
CH1 = CH1(inicio:end);

tau = CalcularTau(t,CH1);

disp(['RL serie tau = ', num2str(tau)])

%% RL PARALELO  R = 100 L = 18u

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

%% RC SERIE R = 100 C = 560p


x = 16;
M = importdata(fullfile(archivos(x).folder, archivos(x).name));
t = M.data(:,1);
CH1 = M.data(:,2);

inicio = 205;
fin = 580;

t = t(inicio:fin);
CH1 = CH1(inicio:fin);

CH1 = CH1.*-1; % Para hacerla decreciente asi sirve la funcion para inductores

tau = CalcularTau(t,CH1);
disp(['RC serie tau = ', num2str(tau)])


%% RC PARALELO R = 120 C = 3.9n
x = 18; 

M = importdata(fullfile(archivos(x).folder, archivos(x).name));
t = M.data(:,1);
CH1 = M.data(:,2);

inicio = 63;

t = t(inicio:end);
CH1 = CH1(inicio:end);

CH1 = CH1.*-1; % Para hacerla decreciente asi sirve la funcion para inductores

tau = CalcularTau(t,CH1);
disp(['RC paralelo tau = ', num2str(tau)])
