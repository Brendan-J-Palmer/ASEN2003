function [sy, sx, sz, N, s] = transition_up(theta, r, sx0, sy0, sz0)
%make transition to up
%output position and gs felt along with arc length
% input theta travelled, radius, and initial position

%% Gravity
g = 9.81;
%% Tangent normal coordinate system
s = theta * pi / 180 * r;

tstep = (0:(theta))';

sy = sy0 + (r - r * cosd(tstep)); %height as a function of theta

sx = sx0 + r * sind(tstep);

N1 = g * cosd(tstep); % Normal force / m

N = N1/g;

sz = sz0 * ones(length(tstep),1);
end

