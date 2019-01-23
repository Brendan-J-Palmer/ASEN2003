function [ t, v, height, xdisp, sz, N] = loop(t0, r, sx0, sy0, sz0)
% ASEN 2003 Lab 1 Loop function
%{
determine the normal force for a circular loop
This loop will be assumed circular and that the movement in the z
direction is negligible outside of position correction
%}
%% Gravity
g = 9.81;
%% Tangent normal coordinate system

tstep = (0:0.1:360)';

height = sy0 + (r - r * cosd(tstep)); %height as a function of theta

xdisp = sx0 + r * sind(tstep);

v = sqrt(2 * g * (125 - height)); %velocity due to change in height

N1 = g .* cosd(tstep) + (v.^2) ./ r; % Normal force / m

N = N1/g;

t=0;

sz_step = 360/3601;

sz = sz_step * tstep;

end
