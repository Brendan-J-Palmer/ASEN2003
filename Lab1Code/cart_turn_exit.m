function [sx, sy, sz, N, hGs, vGs, s] = cart_turn_exit(long, theta, sx0, sy0, sz0)
%Shows the g's of the cart while it makes its turn
%input length of segment, initial position and angle rotated
%output the position array and the length and the g's
%% gravity
s = long;
g = 9.81;
tstep = (theta:0)';
N = 1 * ones(length(tstep),1);
hGs = sind(tstep);
vGs = (cosd(tstep));
lengthstep = long/theta;
sx = sx0 -  long + (lengthstep * tstep);
sy = sy0 * ones(length(tstep),1);
sz = sz0 * ones(length(tstep),1);
end

