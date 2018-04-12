close all
clear

M = importdata(fullfile('DATOS_REFLECTOMETRIA', 'NewFile5.csv'));
t = M.data(:,1);
CH1 = M.data(:,2);

inicio = 100;
fin = 400;

t = t(inicio:fin)* 1e9; %lo paso a nano segundos
CH1 = CH1(inicio:fin);


CH1 = CH1 - CH1(1);
CH1 = CH1 / CH1(end);

inicio = find(CH1 >= 0.1);
inicio = inicio(1);

fin = find(CH1 >= 0.9);
fin = fin(1);

figure
plot(t,CH1)
hold on
plot(t(inicio),CH1(inicio),'bo')
hold on
plot(t(fin),CH1(fin),'go')
xlabel('Tiempo [ns]')
ylabel('Amplitud [V]')

tiempo_de_crecimiento = t(fin) - t(inicio);
disp(['Rise time = ' num2str(tiempo_de_crecimiento) ' ns'])

%% CON LINEA

M = importdata(fullfile('DATOS_REFLECTOMETRIA', 'NewFile0.csv'));
t = M.data(:,1);
CH1 = M.data(:,2);

inicio = 1;
fin = 150;

t = t(inicio:fin)* 1e9; %lo paso a nano segundos
CH1 = CH1(inicio:fin);

CH1 = CH1 - CH1(1);
CH1 = CH1 / CH1(end);

inicio = find(CH1 >= 0.1);
inicio = inicio(1);

fin = find(CH1 >= 0.9);
fin = fin(1);

figure
plot(t,CH1)
hold on
plot(t(inicio),CH1(inicio),'bo')
hold on
plot(t(fin),CH1(fin),'go')
xlabel('Tiempo [ns]')
ylabel('Amplitud [V]')

tiempo_de_crecimiento = t(fin) - t(inicio);
disp(['Rise time = ' num2str(tiempo_de_crecimiento) ' ns'])
