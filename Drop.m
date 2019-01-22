function [ t v sy, sx, N] = Drop(v0, t0, theta, length, sx0, sy0)
% Downhill ramp function ASEN 2003 Lab 1
% Position is given in standard x y coordinate system
% velocity and acceleration follow a tilted x y coordiante system with x
% along the ramp


%%acceleration
g = 9.81;

ax = g * sind(theta);

%% velocity: constant acceleration
RampHeight = length * sind(theta);
RampWidth = length * cosd(theta);

% return output
sx = sx0 + RampWidth;
sy = sy0 - RampHeight;

% get final velocity based on height.
syms h
v(h) = sqrt ( 2 * g * (sy0 - h)); 

%evaluate veloc function defined above.
v = double(v(sy0 - RampHeight));

%% time spent: use kinematic equations to get the time spent on the ramp

%all acceleration is in the x direction due to the tilted plane
t = ((v - v0) / ax) * t0;

%% G's

N = g * cosd(theta) / g; 
end

