clear; clc; close all;

load('part2_kp20.mat');
position_output = PositionOutput.signals.values;
time = PositionOutput.time;

fig1 = figure;
plot(time, position_output);

load('part2_kp100.mat');
position_output = PositionOutput.signals.values;
time = PositionOutput.time;

hold on
plot(time, position_output);
hold off

load('part2_kp200.mat');
position_output = PositionOutput.signals.values;
time = PositionOutput.time;

hold on
plot(time, position_output);
hold off

xlim([0,1])
legend('Kp = 20','Kp = 100', 'Kp = 200', 'Location', 'southeast')
title('Step response of the proportional controller')
ylabel('Position (m)')
xlabel('Time (s)')

saveas(fig1, 'part2_response.eps', 'epsc')