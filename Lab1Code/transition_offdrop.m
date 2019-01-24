function [sy, sx, sz, N, s] = transition_offdrop(theta, r, sx0, sy0, sz0)
%make transition off drop
%output position and gs felt along with arc length
% input theta travelled, radius, and initial position

%% Gravity
g = 9.81;

%% begin calculations of position
%find arc length
s = theta * pi / 180 * r;

tstep = (360 - theta : 360)';

sy = sy0 + r * cosd(360 - theta) - r * cosd(tstep); %height as a function of theta

sx = sx0 - r * sind(360 - theta) + r * sind(tstep);

v = sqrt(2 * g * (125 - sy)); %velocity due to change in height

N1 = g * cosd(tstep) + v.^2/r; % Normal force / m

N = N1/g;

sz = sz0 * ones(length(tstep),1);
end

