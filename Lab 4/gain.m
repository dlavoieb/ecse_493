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

P = [-1+1i, -1-1i, -50, -100];
% P = [-1.28 + .924i, -1.28-.924i, -40.4, -66.4];

K = acker(A, B, P);

fig = figure(1);
pzmap(A, B, C, D)
title('Open-Loop Pole-Zero Map');
saveas(fig, 'open_loop_poles.eps', 'epsc')


fig = figure(3);
pzmap(A-B*K, [0;0;0;0] , C, D)
title('Placed Pole-Zero Map');
saveas(fig, 'placed_poles.eps', 'epsc')
