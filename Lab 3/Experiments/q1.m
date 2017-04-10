load('lab3_part1_critically_damped_kp=40.mat');
position_output = PositionOutput.signals.values;
time = PositionOutput.time;
fig1 = figure;
plot(time, position_output)

max(position_output)
(position_output(end) - 0.15) / 0.15 * 100

saveas(fig1, '..\report\crit_damped.eps', 'epsc')


load('lab3_kp40_kd1.mat');
position_output = PositionOutput.signals.values;
time = PositionOutput.time;
hold on 
plot(time, position_output)
hold off

load('lab3_kp40_kd10.mat');
position_output = PositionOutput.signals.values;
time = PositionOutput.time;
hold on 
plot(time, position_output)
hold off

load('lab3_kp40_kd20.mat');
position_output = PositionOutput.signals.values;
time = PositionOutput.time;
hold on 
plot(time, position_output)
hold off

saveas(fig1, '..\report\effect_kd.eps', 'epsc')
load('lab3_kp200_kd20.mat');
position_output = PositionOutput.signals.values(1:500);
time = PositionOutput.time(1:500);

fig2 = figure;
plot(time, position_output)
refline(0, 0.15*0.9)

saveas(fig2, '..\report\pd_ctrl.eps', 'epsc')
