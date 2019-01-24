function [sy, sx, sz, N, s] = parabola(theta, sx0, sy0, sz0)
% ASEN 2003 Lab 1 parabola function for zero g's
% in this function the track follows projectile motion
%Output position g's felt and arc length
%input initial launch angle and position
%% Define gravity
g = 9.81;
%% acceleration due to gravity to solve for position and velocity

%find initial velocity in each direction
v0 = sqrt(2 * g * (125 - sy0));
vy0 = v0 * sind(theta);
vx0 = v0 * cosd(theta);

%initialize position and time arrays
time = .001;
sy = [0;vy0 * time - g/2 * time^2];
sx = [0; vx0*time];
sz = [sz0; sz0];
N = [0; 0];

%create counter for while loop
counter = 2;
time = .002;

while sy(counter) > 0
    %concatenate for each position in each direction
    sy = [sy ; vy0 * time - g/2 * time^2];
    sx = [sx; vx0*time];
    sz = [sz; sz0];
    N = [N; 0];%keep the n at each step which is zero
    time = time + .001; %increment time
    counter = counter + 1;
    
end
%find arc length using integral of speed
syms t
v(t) = sqrt(vx0^2 + (vy0 - 9.81*t)^2);
s = int(v(t),0,time);
%add initial conditions
sx = sx + sx0;
sy = sy + sy0;
N = N/g; % this is zero but for demonstration sake
end
