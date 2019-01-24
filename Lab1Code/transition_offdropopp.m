function [sy, sx, sz, N, s] = transition_offdropopp(theta, r, sx0, sy0, sz0)
%%make transition from drop
%output position and gs felt along with arc length
% input theta travelled, radius, and initial position

%% Gravity
g = 9.81;

%% begin calculations of position
%find arc length
s = theta * pi / 180 * r;

tstep = (theta:-1:0)';

sy = sy0 + r * cosd(theta) - r * cosd(tstep); %height as a function of theta

sx = sx0 - r * sind(theta) + r * sind(tstep);

v = sqrt(2 * g * (125 - sy)); %velocity due to change in height

N1 = v.^2/r + g * cosd(tstep); % Normal force / m

N = N1/g;

sz = sz0 * ones(length(tstep),1);
end


