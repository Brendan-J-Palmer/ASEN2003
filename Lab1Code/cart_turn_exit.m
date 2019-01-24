function [sx, sy, sz, N, s] = cart_turn_exit(long, theta, sx0, sy0, sz0)
%% gravity
s = long;
g = 9.81;
tstep = (theta:0)';
N = (1 - cosd(tstep));
lengthstep = long/theta;
sx = sx0 -  long + (lengthstep * tstep);
sy = sy0 * ones(length(tstep),1);
sz = sz0 * ones(length(tstep),1);
end

