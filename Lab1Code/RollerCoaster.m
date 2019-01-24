%initialize values
sx = 0;
sy = 125;
sz = 0;
N = [1];
s = 0;

%transition to the downhill portion
[synew, sxnew, sznew, Nnew, DownGinit, s0] = transition_down(60, 40, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;


%begin hill at 60 degrees
[sznew, synew, sxnew, Nnew, s0] = Drop(60, 30, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;

%to transition off of drop
[synew, sxnew, sznew, Nnew, s0] = transition_offdrop(60, 50, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;

%10m straight path
sx = cat(1, sx, sx(end)+10);
sy = cat(1, sy, sy(end));
sz = cat(1, sz, sz(end));
N = cat(1, N, 1);

%begin loop
[synew, sxnew, sznew, Nnew, s0] = loop(30, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;

%create straight
sx = cat(1, sx, sx(end)+5);
sy = cat(1, sy, sy(end));
sz = cat(1, sz, sz(end));
N = cat(1, N, 1);

%begin loop
[synew, sxnew, sznew, Nnew, s0] = loop(30, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;

%create straight
sx = cat(1, sx, sx(end)+5);
sy = cat(1, sy, sy(end));
sz = cat(1, sz, sz(end));
N = cat(1, N, 1);

%begin transition to parabola
[synew, sxnew, sznew, Nnew, s0] = transition_up(40, 50, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;

%begin parabola
[synew, sxnew, sznew, Nnew, s0] = parabola(40, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;

%transition down from parabola
[synew, sxnew, sznew, Nnew, s0] = transition_offdrop(40, 50, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;

%create corkscrew into banked turn
[sxnew, synew, sznew, Nnew, s0] = cart_turn(5, 40, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;

%banked turn
[synew, sxnew, sznew, Nnew, Vgsbankedturn, HgsBankedTurn, s0] = bankedTurn(40, 40, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;
HgsBankedTurn = abs(HgsBankedTurn);

%turn out of banked turn
[sxnew, synew, sznew, Nnew, s0] = cart_turn_exit(5, 40, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;

%transition down from banked turn
[synew, sxnew, sznew, Nnew, downGsec, s0] = transition_downopp(60, 50, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;
downGsec = abs(downGsec);

%transition to ground
loopr = vpa(sy(end))/cosd(60);
[synew, sxnew, sznew, Nnew, s0] = transition_offdropopp(60, loopr, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;

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
s = s + s0;
s = double(s);

fprintf('The max gs felt is %.3f \n', max(N));
fprintf('The max horizontal gs felt is %.3f on the banked turn \n', max(HgsBankedTurn));
fprintf('The max back gs felt is %.3f during deceleration \n', max(backGsdec));
fprintf('The roller coaster begins at %.0f, %.0f, %.0f. \n', sx(1), sy(1), sz(1));
fprintf('The roller coaster ends at %.0f, %.0f, %.0f \n', sx(end), sy(end), sz(end));
fprintf('The roller coaster is %.1f meters long \n', s);


%plot the graph
surf([sx,sx],[sz,sz],[sy,sy],N,'LineWidth', 3);
colorbar
xlim([0 350]);
ylim([0 100]);
zlim([0 135]);
title('Number of Gravities felt at each point along a track');
xlabel('x');
ylabel('z');
zlabel('y');




