function [t, vx, vy, sy, sx, sz, N] = parabola(v0, t0, theta, sx0, sy0, sz0)
% ASEN 2003 Lab 1 parabola function for zero g's
% in this function the track follows projectile motion
%% Define gravity
g = 9.81;
%% acceleration due to gravity to solve for position and velocity
%find initial velocity in each direction
vy0 = v0 * sind(theta);
vx0 = v0 * cosd(theta);
%initialize position and time arrays
time = .001;
sy = [0;vy0 * time - g/2 * time^2];
sx = [0; vx0*time];
sz = [sz0; sz0];
t = [0; time];
N = [0; 0];
%create counter for while loop
counter = 2;
time = .002;

while sy(counter) > 0
    %concatenate for each position in each direction
    sy = [sy ; vy0 * time - g/2 * time^2];
    sx = [sx; vx0*time];
    sz = [sz; sz0];
    t = [t; time];%keep the time at each step
    N = [N; 0];%keep the n at each step which is zero
    time = time + .001; %increment time
    counter = counter + 1;
    
end
%add initial conditions
sx = sx + sx0;
sy = sy + sy0;
t = t + t0;
N = N/g; % this is zero but for demonstration sake
vx = vx0;
vy = vy0 - g * (t - .001);
end
