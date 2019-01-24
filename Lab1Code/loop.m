function [sy, sx, sz, N, s] = loop(r, sx0, sy0, sz0)
% ASEN 2003 Lab 1 Loop function
%{
determine the normal force for a circular loop
This loop will be assumed circular and that the movement in the z
direction is negligible outside of position correction
%}
%input radius and position
%output position g's and arc length
%% Gravity
g = 9.81;
%% Tangent normal coordinate system

tstep = (0:360)';

sy = sy0 + (r - r * cosd(tstep)); %height as a function of theta

sx = sx0 + r * sind(tstep);

v = sqrt(2 * g * (125 - sy)); %velocity due to change in height

N1 = g .* cosd(tstep) + (v.^2) ./ r; % Normal force / m

N = N1/g;

sz_step = 1/360;

sz = sz0 + sz_step * tstep;

% arc length
s = 2 * pi * r;
end

