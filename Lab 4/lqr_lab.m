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

Q = [20, 0, 0, 0;
     0, 400, 0, 0;
     0, 0, 1, 0;
     0, 0, 0, 10];
%  Q = Q*10;
 
% Q = [60, 0, 0, 0;
%      0, 127, 0, 0;
%      0, 0, 20, 0;
%      0, 0, 0, 10];

R = 0.01;
N = 0;

K = lqr(A, B, Q, R, N);

k_1 = K(1)
k_2 = K(2)
k_3 = K(3)
k_4 = K(4)

fig = figure;
pzmap(A, B, C, D)
saveas(fig, 'open_loop_poles.eps', 'epsc')


fig = figure;
pzmap(A-B*K, [0;0;0;0] , C, D)
saveas(fig, 'lqr_poles.eps', 'epsc')