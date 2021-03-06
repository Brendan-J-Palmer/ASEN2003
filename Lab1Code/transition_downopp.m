function [sy, sx, sz, N, downG, s] = transition_downopp(theta, r, sx0, sy0, sz0)
%make transition from drop
%output position and gs felt along with arc length
% input theta travelled, radius, and initial position

%% Gravity
g = 9.81;
%% Tangent normal coordinate system

tstep = (180:(180 + theta))';

sy = sy0 - r - r * cosd(tstep); %height as a function of theta

sx = sx0 + r * sind(tstep);

v = sqrt(2 * g * (125 - sy)); %velocity due to change in height

N1 = g .* cosd(tstep); % Normal force / m

N = N1/g;

downG = N;

sz = sz0 * (tstep ./ tstep);

% find arc length
s = theta * pi / 180 * r;
end

