clc; clear; close all;
data_files = {
    'PID/lab3_kp300_ki1_kd20.mat'; 
    'PID/lab3_kp300_ki100_kd20.mat'; 
    'PID/lab3_kp400_ki50_kd30.mat'; 
    'PID/lab3_kp600_ki50_kd40.mat'; 
    'PID/lab3_kp600_ki60_kd40.mat'
    };
stats = zeros(length(data_files), 3);
fig1 = figure(1);
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
legend('Kp = 300, Ki = 1,Kd = 20','Kp = 300, Ki = 100, Kd = 20','Kp = 400, Ki = 50, Kd = 30','Kp = 600, Ki = 50, Kd = 40','Kp = 600, Ki = 60, Kd = 40','Location','southeast')
saveas(fig1, '../report/effects_pid.eps', 'epsc')
stats