clear all; %limpa todas as variaveis
clc;       %limpa a janela de comandos
close all; %fecha as figuras

% vetor de tempo
ti=0; %tempo inicial
tf=10; %tempo final
dt=0.01; %passo ou tempo de discretizacao
t=ti:dt:tf; % t=[tempo_inicial:passo:tempo_final]

%criando um sinal senoide
A=1.5; %amplitude da senoide
f=1;   %frequencia em Hz
y1=A*sin(2*pi*f*t); %calcula os valores da senoide

% fazendo a figura da senoide
figure,plot(t,y1,':sr')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
title('Senoide')
axis([-1 11 -2 2])

% fazendo um cosseno
Ac=0.5; %amplitude da cossenoide
fc=0.75;   %frequencia em Hz da cossenoide
y2=Ac*cos(2*pi*fc*t); %calcula os valores da cossenoide

% fazendo a figura da cossenoide
figure,plot(t,y2,'-xb')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
title('Cossenoide')
axis([-1 11 -1 1])

%juntando tudo em uma figura
figure,plot(t,y1,':sr',t,y2,'-xb')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
title('Combinação')
legend('Senoide','Cossenoide')
axis([-1 11 -2.5 2.5])

%grafico 3d
figure,plot3(t,y1,y2,'k')
xlabel('Tempo (s)')
ylabel('Tensão (V)')
zlabel('Tensão 2 (V)')
title('Obra de Arte')






