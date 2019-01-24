function [sy, sx, sz, N, s] = transition_offdropopp(theta, r, sx0, sy0, sz0)
%UNTITLED10 Summary of this function goes here
%% Gravity
g = 9.81;

%% begin calculations of position
%find arc length
s = theta * pi / 180 * r;

tstep = (theta:-1:0)';

sy = sy0 + r * cosd(theta) - r * cosd(tstep); %height as a function of theta

sx = sx0 - r * sind(theta) + r * sind(tstep);

N1 = g * cosd(tstep); % Normal force / m

N = N1/g;

sz = sz0 * ones(length(tstep),1);
end


