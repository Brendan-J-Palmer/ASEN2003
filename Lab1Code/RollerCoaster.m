%initialize values
sx = 0;
sy = 125;
sz = 0;
N = [1];
s = 0;

%transition to the downhill portion
[synew, sxnew, sznew, Nnew, s0] = transition_down(60, 30, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;


%begin hill at 60 degrees
[sznew, synew, sxnew, Nnew, s0] = Drop(60, 60, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;

%to transition off of drop
[synew, sxnew, sznew, Nnew, s0] = transition_offdrop(60, 30, sx(end), sy(end), sz(end));
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
[synew, sxnew, sznew, Nnew, s0] = loop(35, sx(end), sy(end), sz(end));
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
[synew, sxnew, sznew, Nnew, s0] = transition_up(40, 30, sx(end), sy(end), sz(end));
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
[synew, sxnew, sznew, Nnew, s0] = transition_offdrop(40, 30, sx(end), sy(end), sz(end));
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
[synew, sxnew, sznew, Nnew, Vgsbankedturn, HgsBankedTurn, s0] = bankedTurn(40, 30, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;

%turn out of banked turn
[sxnew, synew, sznew, Nnew, s0] = cart_turn_exit(5, 40, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;

%transition down from banked turn
[synew, sxnew, sznew, Nnew, s0] = transition_downopp(60, 30, sx(end), sy(end), sz(end));
sx = cat(1, sx, sxnew);
sy = cat(1, sy, synew);
sz = cat(1, sz, sznew);
N = cat(1, N, Nnew);
s = s + s0;

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

%plot the graph
%plot3(sx,sz,sy);
surf([sx,sx],[sz,sz],[sy,sy],N,'LineWidth', 3);
colorbar
xlim([0 350]);
ylim([0 75]);
zlim([0 135]);
title('Number of Gravities felt at each point along a track');
xlabel('x');
ylabel('z');
zlabel('y');




