function S=Area_M(N)
% by Konstantin Ninidze
%
% Monte Carlo method for estimating the area for a plane figure.
% Suppose we need to calculate an area S(A) of a figure A, bounded by a
% Jordan curve (which in our case is  constructed by a cubic spline
% approximation). We'll place A inside a square of known area S(sq) and
% then place a known number of points (N) at random locations inside the
% square. After this we'll count the number of the random points (M) that lie
% inside the contour A and taking in mind, that the area S(A) of the object
% A is proportional to the number of points (M) that lie inside square
% we'll obtain a formula for the area: S(A)=S(sq)*M/N.
% A slight modification of Matlab "getcurve" function is needed to obtaine
% the closed curve, see mygetcurve1. 
close
X=mygetcurve1;
X=[X,X(:,1)];
x=2*rand(1,N)-1;
y=2*rand(1,N)-1;
in = inpolygon(x,y,X(1,:),X(2,:));
M=sum(in);
S=4*M/N;
hold on
plot(x(in),y(in),'r+',x(~in),y(~in),'bo')
title([' area estimation is ',num2str(S)])
xlabel([' N= ',num2str(N)])
