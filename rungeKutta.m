s = input('Enter Sigma Value: ');
B = input('Enter Beta Value: ');
p = input('Enter Rho Value: ');
h = input('Step size (h): ');
t0 = input('Initial time Interval t0: ');
tn = input('Final time Interval tn: ');
x0 = input('Initial condition x0: ');
y0 = input('Initial condition y0: ');
z0 = input('Initial condition z0: ');

f = @(t, xyz) [s*(xyz(2) - xyz(1)); 
               xyz(1)*(p - xyz(3)) - xyz(2); 
               xyz(1)*xyz(2) - B*xyz(3)];

xyz0 = [x0; y0; z0];
t = t0:h:tn;

[t, xyz] = ode45(f, t, xyz0);

plot3(xyz(:, 1), xyz(:, 2), xyz(:, 3), 'LineWidth', 1.5);
hold on;
xlabel('x'); ylabel('y'); zlabel('z');
title(sprintf('Lorenz Equations with Step Size h = %g', h));
subtitle(sprintf('with sigma = %g, beta = %g, rho = %g \n with initial condition x0 = %g, y0 = %g, z0 = %g', s, B, p, x0, y0, z0));