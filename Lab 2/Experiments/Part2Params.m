clc; clear; close all;
A = 0.3072;
B = 4.4516;
Kp = [20, 100, 200];
Wn_theo = sqrt(Kp./A)
zeta_theo = B./(2*Wn_theo .* A)

A = 1.49;
B = 14.62;
Wn_exp = sqrt(Kp./A)
zeta_exp = B./(2*Wn_theo .* A)
