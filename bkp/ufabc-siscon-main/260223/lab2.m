% Pacote de controle necessário no Octave
% pkg load control;
clear all;
close all;
clc;

% Definição da variável de Laplace
s = tf('s');

% Definição das funções de transferência
P = 10 / (s*(s + 1)); 
K = 1.05 * ((s + 1.5) / (s + 3.75));
H = 1;


fprintf('BEGIN ITEM a) ----------------------------------------------------------\n');
% a) T1(s) formada com P(s) e realimentação unitária negativa (H(s) = 1)
T1 = feedback(P, H);
disp('T1:');
disp(T1);

polos_T1 = pole(T1);
disp('polos');
disp(polos_T1);

zeros_T1 = zero(T1);
disp('zeros');
disp(zeros_T1);


fprintf('END ITEM a) ------------------------------------------------------------\n');


fprintf('\nBEGIN ITEM b) ----------------------------------------------------------\n');
% b) T2(s) formada com P(s), K(s) e realimentação unitária negativa (H(s) = 1)
T2 = minreal(feedback(P * K, H)); % minreal para simplificar a função de transferência, eliminando termos que se cancelam
disp('T2:');
disp(T2);

polos_T2 = pole(T2);
disp('polos');
disp(polos_T2);

zeros_T2 = zero(T2);
disp('zeros');
disp(zeros_T2);

fprintf('END ITEM b) ------------------------------------------------------------\n');


fprintf('\nBEGIN ITEM c) ----------------------------------------------------------\n');
% c) Comparar as respostas ao degrau unitário de T1 e T2

[y1_deg, t1_deg] = step(T1);
[y2_deg, t2_deg] = step(T2);

figure,plot(t1_deg, y1_deg, 'b', t2_deg, y2_deg, 'r');
title('Resposta ao Degrau Unitário');
xlabel('Tempo (s)');
ylabel('Resposta');
legend('T_1(s) (sem controlador)', 'T_2(s) (com controlador)');
grid on;

fprintf('Grafico da resposta ao degrau unitário gerado.\n');

fprintf('END ITEM c) ------------------------------------------------------------\n');

fprintf('\nBEGIN ITEM d) ----------------------------------------------------------\n');

t = 0:0.01:10; % Vetor de tempo de 0 a 10s
u = 2 * sin(30 * t) + cos(t); % sinal de entrada u(t)

y1 = lsim(T1, u, t);
y2 = lsim(T2, u, t);

figure,plot(t, y1, 'b', t, y2, 'r', t, u, 'k');
title('Resposta ao sinal u(t) = 2sin(30t) + cos(t)');
xlabel('Tempo (s)');
ylabel('Resposta');
legend('Saída T_1(s)', 'Saída T_2(s)', 'Entrada u(t)');
grid on;

fprintf('Grafico da resposta ao sinal u(t) = 2sin(30t) + cos(t) gerado.\n');

fprintf('END ITEM d) ------------------------------------------------------------\n');