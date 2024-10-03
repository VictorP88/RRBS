function [xy, spcv] = mygetcurve1
% do not repeat points! 
w = [-1 1 -1 1];  
clf, 
axis(w), hold on, grid on
title('Use mouse clicks to pick points INSIDE the gridded area.')
pts = line('Xdata',NaN,'Ydata',NaN,'marker','o','erase','none');
maxpnts = 100; xy = zeros(2,maxpnts);
while 1
   for j=1:maxpnts
      [x,y] = ginput(1);
      if isempty(x)||x<w(1)||x>w(2)||y<w(3)||y>w(4), break, end
      xy(:,j) = [x;y];
      if j>1
         set(pts,'Xdata',xy(1,1:j),'Ydata',xy(2,1:j))
      else
         set(pts,'Xdata',x,'Ydata',y)
         xlabel('When you are done, click OUTSIDE the gridded area.')
      end
   end
   if j>1, break, end
   xlabel(' You need to click INSIDE the gridded area at least once')
end 
xy(:,j:maxpnts)=[];
if norm(xy(:,1)-xy(:,j-1))<.05, xy(:,j-1)=xy(:,1); end
set(pts,'Xdata',xy(1,:),'Ydata',xy(2,:),'erase','xor','linestyle','none')
xy=[xy,xy(:,1)];
spcv = cscvn(xy); fnplt(spcv)