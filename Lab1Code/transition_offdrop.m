function [sy, sx, sz, N, s] = transition_offdrop(theta, r, sx0, sy0, sz0)
%UNTITLED2 Summary of this function goes here

%% Gravity
g = 9.81;

%% begin calculations of position
%find arc length
s = theta * pi / 180 * r;

tstep = (360 - theta : 360)';

sy = sy0 + r * cosd(360 - theta) - r * cosd(tstep); %height as a function of theta

sx = sx0 - r * sind(360 - theta) + r * sind(tstep);

N1 = g * cosd(tstep); % Normal force / m

N = N1/g;

sz = sz0 * ones(length(tstep),1);
end

