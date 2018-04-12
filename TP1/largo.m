close all
clear

%% RISE

M = importdata(fullfile('DATOS_REFLECTOMETRIA', 'NewFile0.csv'));
t = M.data(:,1);
CH1 = M.data(:,2);
CH2 = M.data(:,3);

figure
plot(t,CH1)

inicio = 75;
fin = 250;


CH1 = CH1(inicio:fin);
CH2 = CH2(inicio:fin);
t = t(inicio:fin)* 1e9; %lo paso a nano segundos

figure
plot(t,CH1)
hold on
plot(t,CH2)
xlabel('Tiempo [ns]')
ylabel('Amplitud [V]')

tiempo_reflejado = t(end)-t(1);
disp(['Tiempo en llegar la onda reflejada = ' num2str(tiempo_reflejado) ' ns'])

largo_cable = 3e8*(tiempo_reflejado*1e-9/2);

disp(['Largo del cable  = ' num2str(largo_cable) ' m'])

%% FALL

M = importdata(fullfile('DATOS_REFLECTOMETRIA', 'NewFile1.csv'));
t = M.data(:,1);
CH1 = M.data(:,2);
CH2 = M.data(:,3);

inicio = 160;
fin = 510;


CH1 = CH1(inicio:fin);
CH2 = CH2(inicio:fin);
t = t(inicio:fin)* 1e9; %lo paso a nano segundos

figure
plot(t,CH1)
hold on
plot(t,CH2)
xlabel('Tiempo [ns]')
ylabel('Amplitud [V]')

tiempo_reflejado = t(end)-t(1);
disp(['Tiempo en llegar la onda reflejada = ' num2str(tiempo_reflejado) ' ns'])

largo_cable = 3e8*(tiempo_reflejado*1e-9/2);

disp(['Largo del cable  = ' num2str(largo_cable) ' m'])