function [sx, sy, sz, N, s] = cart_turn(long, theta, sx0, sy0, sz0)
%Shows the g's of the cart while it makes its turn
%input length of segment, initial position and angle rotated
%output the position array and the length and the g's
%% gravity
g = 9.81;
s = long;
tstep = (0:theta)';
N = cosd(tstep);
lengthstep = long/theta;
sx = sx0 + lengthstep * tstep;
sy = sy0 * ones(length(tstep),1);
sz = sz0 * ones(length(tstep),1);
end

