%% TASK 1
% Put down here some initial conditions for the joint trajectory
clc;
clear all;
% Time (initial condition)
syms t_1 t_2
t_0 = 0.0;
t_1 = 2.0;
% Parameters for q and qdot (initial condition)
syms q(t)
q_0 = 1.0;
q_1 = 4;

qdot_0 = 0;
qdot_1= 0;

%So, we have initial conditions for q and qdot
t_IF = [t_0 t_1 0];
q_IF = [q_0 q_1 0];
qdot_IF = [qdot_0 qdot_1];

% CUBIC POLYNOMIAL TRAJECTORY
[qd1,vd1,ad1] = Polynomial(t_IF,q_IF, qdot_IF,[0 0], 3);
% Plot it
figure('Name','the joint trajectory from q(0) = 1 to q(2) = 4 (polynomial)','NumberTitle',1)
k = 0.05;
time = t_IF(1):k:t_IF(2);
Plotting(t,time, qd1,vd1,ad1,'symbol');
n = (t_IF(2)-t_IF(1))/k;
[intv1, intacc1] = minmax(n,vd1, ad1, 'symbol', t_IF, k)

% TRAPEZOIDAL VELOCITY PROFILE (LSPB)
[qd2,vd2,ad2,n,k] = LSPB(t_IF,q_IF, qdot_IF, [0 0], 1);
% Plot it
figure('Name','the joint trajectory from q(0) = 1 to q(2) = 4 (trapezoidal)','NumberTitle',2)
j = 1:n;
Plotting(t,j*k, qd2(j),vd2(j),ad2(j),'number')
[intv2, intacc2] = minmax(n,vd2, ad2, 'number', t_IF, k)
% VELOCITY PROFILE OF TYPE q'(t) = a(b + sin(ct))

[qd3,vd3,ad3] = SomeTrajectory(t_IF,q_IF, qdot_IF);
figure('Name','the joint trajectory from q(0) = 1 to q(2) = 4 (some type)','NumberTitle',3)
k = 0.05;
n = (t_IF(2)-t_IF(1))/k;
time = t_IF(1):k:t_IF(2);
Plotting(t,time, qd3,vd3,ad3,'symbol');
[intv3, intacc3] = minmax(n,vd3, ad3, 'symbol', t_IF, k)

%% TASK 2
% Put down here some initial conditions for the joint trajectory
clear all;
% Time (initial condition)
syms t_1 t_2
t_0 = 0.0;
t_1 = 4.0;
t_middle = 2.0;
% Parameters for q and qdot (initial condition)
syms q(t)
q_0 = 1.0;
q_1 = 0;
q_middle = 2;

qdot_0 = 0;
qdot_1= 0;

qdotdot_0 = 0;
qdotdot_1 = 0;


%So, we have initial conditions for q and qdot
t_IF = [t_0 t_1 t_middle];
q_IF = [q_0 q_1 q_middle];
qdot_IF = [qdot_0 qdot_1];
qdotdot_IF = [qdotdot_0 qdotdot_1];
% POLYNOMIAL VELOCITY PROFILE 

[qd4,vd4,ad4] = Polynomial(t_IF,q_IF, qdot_IF, qdotdot_IF, 6);
figure('Name','joint trajectory through points q(0) = 1, q(2) = 2, q(4) = 0 (polynomial)','NumberTitle',4)
k = 0.05;
n = (t_IF(2)-t_IF(1))/k;
time = t_IF(1):k:t_IF(2);
Plotting(t,time, qd4,vd4,ad4,'symbol');
[intv4, intacc4] = minmax(n,vd4, ad4, 'symbol', t_IF, k)


% TRAPEZOIDAL VELOCITY PROFILE (LSPB)
[qd5,vd5,ad5,n,k] = LSPB(t_IF,q_IF, qdot_IF, qdotdot_IF, 3);
% Plot it
figure('Name','the joint trajectory through points q(0) = 1, q(2) = 2, q(4) = 0 (trapezoidal)','NumberTitle',5)
j = 1:n;
Plotting(t,j*k, qd5(j),vd5(j),ad5(j),'number')
[intv5, intacc5] = minmax(n,vd5, ad5, 'number', t_IF, k)
% SPLINES
[qd6,vd6,ad6,n,k] = Spline(t_IF,q_IF, qdot_IF, qdotdot_IF);
% Plot it
figure('Name','the joint trajectory through points q(0) = 1, q(2) = 2, q(4) = 0 (spline)','NumberTitle',6)
j = 1:n;
Plotting(t,j*k, qd6(j),vd6(j),ad6(j),'number')
[intv6, intacc6] = minmax(n,vd6, ad6, 'number', t_IF, k)