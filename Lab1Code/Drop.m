function [sz, sy, sx, N, s] = Drop(theta, length, sx0, sy0, sz0)
% Downhill ramp function ASEN 2003 Lab 1
% Position is given in standard x y coordinate system
% velocity and acceleration follow a tilted x y coordiante system with x
% along the ramp
%input position, length of ramp, and angle of incline of ramp
% output the position and the arc length and g's felt
%%acceleration
g = 9.81;

%% velocity: constant acceleration
RampHeight = length * sind(theta);
RampWidth = length * cosd(theta);

% return output
sx = sx0 + RampWidth;
sy = sy0 - RampHeight;
sz = sz0;
s = length;
%all acceleration is in the x direction due to the tilted plane

%% G's

N = cosd(theta);

end

