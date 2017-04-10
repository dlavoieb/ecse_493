clc; clear; close all;

data_files = {'PI/lab3_kp40_ki1.mat', 'PI/lab3_kp40_ki10.mat', 'PI/lab3_kp40_ki20.mat'};

fig1 = figure(1);
stats = zeros(length(data_files), 3);
for element = 1:length(data_files)
   load(data_files{element});
   position_output = PositionOutput.signals.values;
   time = PositionOutput.time;
   stats(element, 1) = risetime(position_output, time, 0.15);
   stats(element,2) = max(position_output)-0.15;
   stats(element,3) = (position_output(end) - 0.15) / 0.15 * 100;
   hold on 
   plot(time, position_output)
   hold off
end
refline(0, 0.15)
stats
legend('Kp=40, Ki=1', 'Kp=40, Ki=10', 'Kp=40, Ki=20', 'Location', 'southeast')
saveas(fig1, '../report/effect_ki.eps', 'epsc');


data_files = {'PI/lab3_kp200_ki1.mat', 'PI/lab3_kp200_ki10.mat', 'PI/lab3_kp200_ki20.mat'};

fig2 = figure(2);
stats = zeros(length(data_files), 3);
for element = 1:length(data_files)
   load(data_files{element});
   position_output = PositionOutput.signals.values;
   time = PositionOutput.time;
   stats(element, 1) = risetime(position_output, time, 0.15);
   stats(element,2) = max(position_output)-0.15;
   stats(element,3) = (position_output(end) - 0.15) / 0.15 * 100;
   hold on 
   plot(time, position_output)
   hold off
end
refline(0, 0.15)
stats
legend('Kp=200, Ki=1', 'Kp=200, Ki=10', 'Kp=200, Ki=20', 'Location', 'southeast')
data_files = {'PI/lab3_kp200_ki100.mat', 'PI/lab3_kp200_ki200.mat', 'PI/lab3_kp200_ki300.mat', 'PI/lab3_kp200_ki500.mat'};

fig3 = figure(3);
stats = zeros(length(data_files), 3);
for element = 1:length(data_files)
   load(data_files{element});
   position_output = PositionOutput.signals.values;
   time = PositionOutput.time;
   stats(element, 1) = risetime(position_output, time, 0.15);
   stats(element,2) = max(position_output)-0.15;
   stats(element,3) = (position_output(end) - 0.15) / 0.15 * 100;
   hold on 
   plot(time, position_output)
   hold off
end
refline(0, 0.15)
stats
legend('Kp=200, Ki=100', 'Kp=200, Ki=200', 'Kp=200, Ki=300', 'Kp=200, Ki=500', 'Location', 'southeast')
saveas(fig3, '../report/ss_error_reduction.eps', 'epsc')