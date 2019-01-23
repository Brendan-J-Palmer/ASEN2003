function [t, v, sy, sx, sz, N] = transition_up(t0, theta, sx0, sy0, sz0)
%UNTITLED4 Summary of this function goes here
%% Gravity
g = 9.81;
%% Tangent normal coordinate system

tstep = (0:0.1:(theta))';

sy = sy0 + (r - r * cosd(tstep)); %height as a function of theta

sx = sx0 + r * sind(tstep);

v = sqrt(2 * g * (125 - sy)); %velocity due to change in height

N1 = g .* cosd(tstep) + (v.^2) ./ r; % Normal force / m

N = N1/g;

t=0;

sz = sz0 * (tstep ./ tsep);
end

