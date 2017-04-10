close all; clc; clear;

s = tf('s');
P = 1/(1.49*s^2 + 14.62*s);

Kp=600;
Kd=40;
Ki=50;

C=pid(Kp, Ki, Kd);
H = feedback(C*P, 1);

fig = figure;
margin(H)
saveas(fig, '../report/margins.eps', 'epsc')