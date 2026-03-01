clear all; % limpa variaveis
clc;       % limpa a janela de comandos
close all; % fecha as figuras

% vetor de tempo
ti=0;
tf=10;
dt=0.01;
t=ti:dt:tf; % t = [tempo_inicial:passo:tempo_final]

% criando sinal senoide
A=1.5; % amplitude do sinal
f=1; % frequncia em Hz
y1=A*sin(2*pi*f*t);
% plota o grafico
figure,plot(t,y1); 
xlabel('tempo (s)');
ylabel('Tensao (V)');
title('Senoide');
axis([-1 11 -2 2]);

% criando sinal cosenoide
A=0.5; % amplitude do sinal
f=0.75; % frequncia em Hz
y2=A*cos(2*pi*f*t);
% plota o grafico
figure,plot(t,y2); 
xlabel('tempo (s)');
ylabel('Tensao (V)');
title('Cosenoide');
axis([-1 11 -.6 .6]);

% plota o grafico compartilhado
figure,plot(t,y1,'*r',t,y2,'xb'); 
xlabel('tempo (s)');
ylabel('Tensao (V)');
title('Cosenoide');
legend('Senoide','Cosenoide')
axis([-1 11 -2 2]);

% plota grafico 3d
figure,plot3(t,y1,y2,'*b')
