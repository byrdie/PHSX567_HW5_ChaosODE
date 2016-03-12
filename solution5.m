% Illustrate sensitivity to initial conditions.

clear all

global g = 9.807;
global L = 0.1 
global mu = 0.1
global Q = 1e-8
global E = 1e6
global m = 0.0005
global w = 11


times = 0:0.01:30; 

% Fixed points of the Lorenz system
Origin = [0,0];

% Initial conditions. Chosen to be near the attractor but visible on plot.
initial1 = [0,0];
initial2 = [1e-4,0];

% unperturbed trajectory
trajectory1 = lsode("pendulum", initial1, times);

% Second trajectory with randomly perturbed initial condition.
trajectory2 = lsode("pendulum", initial2, times);

% Store position and momentum in separate arrays
X1 = trajectory1(:,1);
dX1 = trajectory1(:,2);
X2 = trajectory2(:,1);
dX2 = trajectory2(:,2);

% Plot the trajectory
figure(1)
plot(times,X1, "linewidth", 2)
hold on
plot(times,X2, 'k', "linewidth", 2)

% Plot the phase space diagram
%figure(2)
%plot(X1, dX1)

d = 30; % resolution of parameter space
E_max = 1e6;	% Maximum value of energy in parameter space
w_max = 30;	% Maximum value of frequency in parameter space
dE = E_max / d;	% Step size in energy
dw = w_max / d;	% Step size in frequency
param_space = zeros(d); 	% preallocate array for storing results

% Loop over energy and frequency
for i = 1:d
	for j = 1:d
		E = (i-1) * dE;	% calculate new values for energy and frequency
		w = (j-1) * dw;
		t1 = lsode("pendulum", initial1, times);
		t2 = lsode("pendulum", initial2, times);
		param_space(i,j) = std(t1(:,1)-t2(:,1));
	endfor
endfor
figure(2)
imshow(param_space, rainbow())
imwrite(param_space, rainbow(), "E_vs_W.tif")











