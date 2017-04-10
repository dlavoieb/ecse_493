clear;clc;
close all; 

file = 'raw_data2.mat';
load(file);
speed_data = ScopeData.signals(3).values';
step_data = ScopeData.signals(1).values';
time = ScopeData.time';

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
ss = 1500;
x = time(1:500)';
y = ss-filtered_data(1:500)';
f = fit(x, y, 'exp1');
plot(f, x, y);
saveas(fig3, 'fitted_data.eps', 'epsc');
tau = 1/-(f.b)
factor = 2.28*10^(-5);
dc = ss * factor / step_data(1)
T_analytic = tf(1,[0.3072, 4.4516]);
T_experimental = tf(1, [tau/dc, 1/dc])

fig4 = figure;
hold on
step(T_analytic)
step(T_experimental)
hold off
legend('show')
saveas(fig4, 'compare.eps', 'epsc')
