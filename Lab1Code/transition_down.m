function [sy, sx, sz, N, downG, s] = transition_down(theta, r, sx0, sy0, sz0)
%make transition to ramp
%output position and gs felt along with arc length
% input theta travelled, radius, and initial position
%% Gravity
g = 9.81;
%% Tangent normal coordinate system
s = theta * pi / 180 * r;

tstep = (180:(180 + theta))';

sy = sy0 - r - r * cosd(tstep); %height as a function of theta

sx = sx0 - r * sind(tstep);

v = sqrt(2 * g * (125 - sy)); %velocity due to change in height

N1 = v.^2/r - g .* cosd(tstep); % Normal force / m

N = N1/g;

downG = N;

sz = sz0 * ones(length(tstep),1);

end

