function [sx, sy, sz, N, s] = cart_turn(long, theta, sx0, sy0, sz0)
%UNTITLED4 Summary of this function goes here
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

