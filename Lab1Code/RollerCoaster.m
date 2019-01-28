%initialize values
sx = 0;
sy = 125;
sz = 0;
N = [1];
vGs = [1];
hGs = [0];
backGs = [0];
DownGs = [0];
s = 0;

%transition to the downhill portion
[synew, sxnew, sznew, Nnew, DownGinit, s0] = transition_down(60, 40, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
DownGinit = abs(DownGinit);
r = length(Nnew);
hGs = [hGs ; zeros(r, 1)];
vGs = [vGs ; zeros(r, 1)];
backGs = [backGs; zeros(r, 1)];
DownGs = [DownGs; DownGinit];
s = s + s0;


%begin hill at 60 degrees
[sznew, synew, sxnew, Nnew, s0] = Drop(60, 30, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
r = length(Nnew);
hGs = [hGs ; zeros(r, 1)];
vGs = [vGs ; Nnew];
backGs = [backGs; zeros(r, 1)];
DownGs = [DownGs; zeros(r, 1)];
s = s + s0;

%to transition off of drop
[synew, sxnew, sznew, Nnew, s0] = transition_offdrop(60, 50, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
r = length(Nnew);
hGs = [hGs ; zeros(r, 1)];
vGs = [vGs ; Nnew];
backGs = [backGs; zeros(r, 1)];
DownGs = [DownGs; zeros(r, 1)];
s = s + s0;

%10m straight path
sx = cat(1, sx, sx(end)+10);
sy = cat(1, sy, sy(end));
sz = cat(1, sz, sz(end));
N = cat(1, N, 1);
hGs = [hGs ; 0];
vGs = [vGs ; 1];
backGs = [backGs; 0];
DownGs = [DownGs; 0];
s = s + 10;

%begin loop
[synew, sxnew, sznew, Nnew, s0] = loop(30, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
r = length(Nnew);
hGs = [hGs ; zeros(r, 1)];
vGs = [vGs ; Nnew];
backGs = [backGs; zeros(r, 1)];
DownGs = [DownGs; zeros(r, 1)];
s = s + s0;

%create straight
sx = cat(1, sx, sx(end)+5);
sy = cat(1, sy, sy(end));
sz = cat(1, sz, sz(end));
N = cat(1, N, 1);
hGs = [hGs ; 0];
vGs = [vGs ; 1];
backGs = [backGs; 0];
DownGs = [DownGs; 0];
s = s + 5;

%begin loop
[synew, sxnew, sznew, Nnew, s0] = loop(30, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
r = length(Nnew);
hGs = [hGs ; zeros(r, 1)];
vGs = [vGs ; Nnew];
backGs = [backGs; zeros(r, 1)];
DownGs = [DownGs; zeros(r, 1)];
s = s + s0;

%create straight
sx = cat(1, sx, sx(end)+5);
sy = cat(1, sy, sy(end));
sz = cat(1, sz, sz(end));
N = cat(1, N, 1);
hGs = [hGs ; 0];
vGs = [vGs ; 1];
backGs = [backGs; 0];
DownGs = [DownGs; 0];
s = s + 5;

%begin transition to parabola
[synew, sxnew, sznew, Nnew, s0] = transition_up(40, 50, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
r = length(Nnew);
hGs = [hGs ; zeros(r, 1)];
vGs = [vGs ; Nnew];
backGs = [backGs; zeros(r, 1)];
DownGs = [DownGs; zeros(r, 1)];
s = s + s0;

%begin parabola
[synew, sxnew, sznew, Nnew, s0] = parabola(40, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
r = length(Nnew);
hGs = [hGs ; zeros(r, 1)];
vGs = [vGs ; Nnew];
backGs = [backGs; zeros(r, 1)];
DownGs = [DownGs; zeros(r, 1)];
s = s + s0;

%transition down from parabola
[synew, sxnew, sznew, Nnew, s0] = transition_offdrop(40, 50, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
r = length(Nnew);
hGs = [hGs ; zeros(r, 1)];
vGs = [vGs ; Nnew];
backGs = [backGs; zeros(r, 1)];
DownGs = [DownGs; zeros(r, 1)];
s = s + s0;

%create corkscrew into banked turn
[sxnew, synew, sznew, Nnew, hGsnew, vGsnew, s0] = cart_turn(5, 40, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
r = length(Nnew);
hGs = [hGs ; hGsnew];
vGs = [vGs ; vGsnew];
backGs = [backGs; zeros(r, 1)];
DownGs = [DownGs; zeros(r, 1)];
s = s + s0;

%banked turn
[synew, sxnew, sznew, Nnew, Vgsbankedturn, HgsBankedTurn, s0] = bankedTurn(40, 40, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
r = length(Nnew);
HgsBankedTurn = abs(HgsBankedTurn);
hGs = [hGs ; HgsBankedTurn];
vGs = [vGs ; Vgsbankedturn];
backGs = [backGs; zeros(r, 1)];
DownGs = [DownGs; zeros(r, 1)];
s = s + s0;

%turn out of banked turn
[sxnew, synew, sznew, Nnew, hGsnew, vGsnew, s0] = cart_turn_exit(5, 40, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
r = length(Nnew);
hGs = [hGs ; hGsnew];
vGs = [vGs ; vGsnew];
backGs = [backGs; zeros(r, 1)];
DownGs = [DownGs; zeros(r, 1)];;
s = s + s0;

%transition down from banked turn
[synew, sxnew, sznew, Nnew, downGsec, s0] = transition_downopp(60, 50, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
downGsec = abs(downGsec);
r = length(Nnew);
hGs = [hGs ; zeros(r, 1)];
vGs = [vGs ; zeros(r, 1)];
backGs = [backGs; zeros(r, 1)];
DownGs = [DownGs; downGsec];
s = s + s0;

%transition to ground
loopr = vpa(sy(end))/cosd(60);
[synew, sxnew, sznew, Nnew, s0] = transition_offdropopp(60, loopr, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
r = length(Nnew);
hGs = [hGs ; zeros(r, 1)];
vGs = [vGs ; Nnew];
backGs = [backGs; zeros(r, 1)];
DownGs = [DownGs; zeros(r, 1)];
s = s + s0;
V = abs(sqrt(2 * 9.81 * (125 - sy)));

%make final adjustments to data
N = abs(N);
N = double(N);
sx = double(sx);
sy = double(sy);

%make decceleration to zero speed
[sxnew, synew, sznew, backGsdec, vGsdec, Nnew, s0] = decelerate(sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
r = length(Nnew);
hGs = [hGs ; zeros(r, 1)];
vGs = [vGs ; vGsdec];
backGs = [backGs; backGsdec];
DownGs = [DownGs; zeros(r, 1)];
s = s + s0;
s = double(s);
vGs = double(vGs);
V = [V; 0];

fprintf('The max gs felt is %.3f \n', max(N));
fprintf('The max horizontal gs felt is %.3f on the banked turn \n', max(HgsBankedTurn));
fprintf('The max back gs felt is %.3f during deceleration \n', max(backGsdec));
fprintf('The roller coaster begins at %.0f, %.0f, %.0f. \n', sx(1), sy(1), sz(1));
fprintf('The roller coaster ends at %.0f, %.0f, %.0f \n', sx(end), sy(end), sz(end));
fprintf('The roller coaster is %.1f meters long \n', s);


%plot the graph
figure(1)
color_line3(sx,sz,sy,N,'LineWidth',2.5);
c = colorbar;
colormap spring;
c.Label.String = 'Gs Felt';xlim([0 350]);
ylim([0 100]);
zlim([0 135]);
title('Number of Gravities felt at each point along a track');
xlabel('x (m)');
ylabel('z (m)');
zlabel('y (m)');

figure(2)
color_line3(sx,sz,sy,backGs,'LineWidth',2.5);
c = colorbar;
c.Label.String = 'Gs Felt';
xlim([0 350]);
ylim([0 100]);
zlim([0 135]);
title('Number of Backwards Gravities felt at each point along a track');
xlabel('x (m)');
ylabel('z (m)');
zlabel('y (m)');

figure(3)
color_line3(sx,sz,sy,DownGs,'LineWidth',2.5);
c = colorbar;
c.Label.String = 'Gs Felt';
xlim([0 350]);
ylim([0 100]);
zlim([0 135]);
title('Number of  Downward Gravities felt at each point along a track');
xlabel('x (m)');
ylabel('z (m)');
zlabel('y (m)');

figure(4)
color_line3(sx,sz,sy,hGs,'LineWidth',2.5);
c = colorbar;
c.Label.String = 'Gs Felt';
xlim([0 350]);
ylim([0 100]);
zlim([0 135]);
title('Number of  Horizontal Gravities felt at each point along a track');
xlabel('x (m)');
ylabel('z (m)');
zlabel('y (m)');

figure(5)
color_line3(sx,sz,sy,vGs,'LineWidth',2.5);
c = colorbar;
c.Label.String = 'Gs Felt';
xlim([0 350]);
ylim([0 100]);
zlim([0 135]);
title('Number of Upward Gravities felt at each point along a track');
xlabel('x (m)');
ylabel('z (m)');
zlabel('y (m)');

figure(6)
color_line3(sx,sz,sy,V,'LineWidth',2.5);
colormap spring;
c = colorbar;
c.Label.String = 'Velocity in m/s';
title('Velocities in the rollercoaster');
xlim([0 350]);
ylim([0 100]);
zlim([0 135]);
xlabel('x (m)');
ylabel('z (m)');
zlabel('y (m)');