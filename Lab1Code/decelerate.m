function [sx, sy, sz, backGs, vGs, N, s] = decelerate(sx0, sy0, sz0)
%tracks the g force as the cart decelerates
%input the position
%output position, g's backwards, g's up, g's total, and arc length
%% gravity
g=9.81;

%% give g's in terms of acceleration
vGs = 1;
backGs = 3.9;
N = sqrt(vGs^2 + backGs^2);

%% give initial velocity
v0 = sqrt(2 * g * (125 - sy0));

%% give final position based on velocity
sx = sx0 - v0^2/(2 * backGs * 9.81);
sy = sy0;
sz = sz0;

% find track length
s = v0^2/(2 * backGs * 9.81);
end

