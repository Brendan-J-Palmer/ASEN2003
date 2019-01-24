function [sy, sx, sz, N, s] = transition_down(theta, r, sx0, sy0, sz0)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%% Gravity
g = 9.81;
%% Tangent normal coordinate system
s = theta * pi / 180 * r;

tstep = (180:(180 + theta))';

sy = sy0 - r - r * cosd(tstep); %height as a function of theta

sx = sx0 - r * sind(tstep);

N1 = g .* cosd(tstep); % Normal force / m

N = N1/g;

sz = sz0 * ones(length(tstep),1);

end

