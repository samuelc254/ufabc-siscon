% Definição da variável de Laplace
s = tf('s');

P1 = 1/s;
P2 = 1/s;

[y1_deg, p1_deg] = step(P1);
[y2_deg, p2_deg] = step(P2);

figure,plot(p1_deg,y1_deg,'b',3,3.16,'rx',0.406,0.633,'rx');
% plot();
% plot();

