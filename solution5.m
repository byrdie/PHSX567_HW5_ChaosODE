% Illustrate sensitivity to initial conditions.

global g = 9.807;
global L = 0.1 
global mu = 0.1
global Q = 1e-8
global E = 1e6
global m = 0.0005
global w = 11


times = 0:0.01:50; 

% Fixed points of the Lorenz system
Origin = [0,0];

% Initial conditions. Chosen to be near the attractor but visible on plot.
initial =  [0.5,1.0];

trajectory1 = lsode("pendulum", initial, times);

% Second trajectory with randomly perturbed initial condition.
% The perturbation, epsilon, is a vector of fixed length and random
% direction.
%epsilon = normalrnd(0,1,1,3);
%epsilon = 1e-10*epsilon/norm(epsilon);
%trajectory2 = lsode("pendulum", initial+epsilon, times);

% Plot the trajectory
X = trajectory1(:,1);
dX = trajectory1(:,2);
plot(times,X)

% Plot the phase space diagram
plot(X, dX)













