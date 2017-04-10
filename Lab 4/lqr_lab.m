% load system parameters
params;

% from the derivation in the class notes
A = [0, 0, 1, 0;
     0, 0, 0, 1;
     0, -mp*g/mc, -k1^2/(Rm*mc), 0;
     0, (mp+mc)*g/(mc*lp), k1^2/(Rm*mc*lp), 0;];
B = [0; 0; k1/(Rm*mc); -k1/(Rm*mc*lp)];
C = [1, 0, 0, 0; 0, 1, 0, 0];
D = [0; 0];

% Q = [20, 0, 0, 0;
%      0, 400, 0, 0;
%      0, 0, 1, 0;
%      0, 0, 0, 10];
  
% Q = [60, 0, 0, 0;
%      0, 127, 0, 0;
%      0, 0, 20, 0;
%      0, 0, 0, 10];

Q = [5, 0, 0, 0;
     0, 25, 0, 0;
     0, 0, 5, 0;
     0, 0, 0, .1];
 
x_range = 0.9;
theta_range = pi/6; % +- 15 degrees
x_vel_range = 2;
theta_vel_range = pi/2;
input_range = 10; % +- 5V
scaling = [(1/x_range)^2, 0, 0, 0;
           0, (1/theta_range)^2, 0, 0;
           0, 0, (1/x_vel_range)^2, 0;
           0, 0, 0, (1/theta_vel_range)^2];
       
Q = Q * scaling;


R = 0.5;
R = R * (1/input_range)^2;
N = 0;

K = lqr(A, B, Q, R, N);

k_1 = K(1);
k_2 = K(2);
k_3 = K(3);
k_4 = K(4);

fig = figure(1);
pzmap(A, B, C, D)
title('Open-Loop Pole-Zero Map');
saveas(fig, 'open_loop_poles.eps', 'epsc')


fig = figure(2);
pzmap(A-B*K, [0;0;0;0] , C, D)
title('LQR Pole-Zero Map');
saveas(fig, 'lqr_poles.eps', 'epsc')
