function [sy, sx, sz,N, vN, hN, s] = bankedTurn(theta, r, sx0, sy0, sz0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% gravity
g = 9.81;

%% initial velocity based on height
v0 = sqrt(2 * g * (125 - sy0));

%solve for the forces in the lateral and normal directions
A = [sind(theta)*(-1) cosd(theta); cosd(theta) sind(theta)];
B = [-v0^2/r; g];

F = A\B;

%% set the theta step
tstep = (0:180)';

%% find the location at each point as theta varies
sz = sz0 + r - r * cosd(tstep);
sx = sx0 + r * sind(tstep);
sy = sy0 * ones(length(tstep),1);

%% find the g's experienced in each direction
vN = F(1) * ones(length(tstep),1) / g;
hN = F(2) * ones(length(tstep),1) / g;
N = (hN.^2 + vN.^2) .^ (1/2);

%% get the distance
s = pi * r;
end

