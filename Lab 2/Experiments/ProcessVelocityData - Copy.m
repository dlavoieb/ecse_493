clear;clc;
close all; 

file = 'raw_data1.mat';
load(file);
speed_data = CartVelocity(:,2)';
step_data = VoltageInput(:,2)';
time = CartVelocity(:,1)';

windowSize = 6;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
filtered_data = filter(b,a,speed_data);

fig1 = figure;
xlim([0,2.5])
hold on
plot(time, speed_data);
yyaxis right
ylim([0,1.3])
plot(time, step_data);
hold off
saveas(fig1, 'raw_speed.eps', 'epsc');

fig2 = figure;
xlim([0,2.5])
hold on
plot(time, filtered_data);
yyaxis right
ylim([0,1.3])
plot(time, step_data);
hold off
saveas(fig2, 'filtered_speed.eps', 'epsc');

fig3 = figure;
ss = 5000;
x = time(1:200)';
y = ss-filtered_data(1:200)';
f = fit(x, y, 'exp1');
plot(f, x, y);
saveas(fig3, 'fitted_data.eps', 'epsc');
tau = 1/-(f.b)
factor = 2.28*10^(-5);
ss = ss/2;
T_analytic = tf(1,[0.3072, 4.4516]);
T_experimental = tf(1, [0.8273, 9.2336]);
T_experimental = tf(1, [tau/(ss*factor), 1/(ss*factor)]);

fig4 = figure;
hold on
step(T_analytic)
step(T_experimental)
hold off
legend('show')
saveas(fig4, 'compare.eps', 'epsc')
