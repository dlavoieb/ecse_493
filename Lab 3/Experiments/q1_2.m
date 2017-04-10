close all; clc; clear;

s = tf('s');
P = 1/(14.62*s+1.49*s^2);
C = pid(40, 0, 0);
H = feedback(C*P, 1);
time = 0:0.01:2;

fig=figure;
lsim(H,time, time)
legend('Location', 'northwest')
saveas(fig, '../report/ramp.eps', 'epsc')
