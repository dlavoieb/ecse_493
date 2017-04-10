% 0.002 / (0.01 s + 0.005) = t/v
k=0.5;
num = 0.002 * k;
den = [0.01 0.00104 0.002*k];
T = tf(num,den)
figure(1)
step(T)

k=1;
num = 0.002 * k;
den = [0.01 0.00104 0.002*k];
T = tf(num,den)
figure(2)
step(T)
 
k=2;
num = 0.002 * k;
den = [0.01 0.00104 0.002*k];
T = tf(num,den)
figure(3)
step(T)
