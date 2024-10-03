function [area,b0,vhandles,vlegends] = calculaAreaExterna(u,RRBS)

r = RRBS.raio;

m0 = [u(1:end-1,:) + u(2:end,:)] / 2;
v0 = [u(2:end,:) - u(1:end-1,:) ];
c0 = (v0(:,1).^2 + v0(:,2).^2).^0.5;
h0 = r - sqrt(r^2 - 0.25*c0.^2);
u0 = (-[0 1; -1 0] * v0')'; % v0 must point inside, not outside
u0 = u0./[ c0 c0 ]; % u0 must be unitary, see (10) in paper
b0vec = [(2*r-h0) (2*r-h0)] .* u0 ;
b0 = b0vec + m0;

lw =3;
mksize = 10;

hold on; axis equal; grid on;
hu = plot(u(:,1),u(:,2),'r-x','MarkerSize',mksize);
hm0 = plot(m0(:,1),m0(:,2),'go','MarkerSize',mksize);
hv0 = quiver(u(1:end-1,1),u(1:end-1,2),v0(:,1),v0(:,2),0,'LineWidth',lw);
hu0 = quiver(m0(:,1),m0(:,2),u0(:,1),u0(:,2),0,'--','LineWidth',lw);
hb0vec = quiver(m0(:,1),m0(:,2),b0vec(:,1),b0vec(:,2),0,':','LineWidth',lw);
hb0 = plot(b0(:,1),b0(:,2),'bs','MarkerSize',mksize);
vhandles = [hu,hm0,hv0,hu0,hb0vec,hb0];
vlegends = {'u','m0','v0','u0','b0vec','b0'};


% 
b0aux = [ b0;b0(1,:) ]; % repeat first line at the end
b0diff =   -(b0aux(2:end,:) - b0aux(1:end-1,:)); % vectors b_i -> b_i+1
b0norm = (b0diff(:,1).^2 + b0diff(:,2).^2).^0.5; % norms of b_i->b_i+1, your c(j)
newR = 2*r;
h = newR - sqrt( (newR)^2 - 0.25 * b0norm.^2);
theta = 2 * atan(0.5 * b0norm ./ ((newR)^2 - h));
A = 0.5 * (newR)^2*(theta - sin(theta));



areaCirculos = sum(A);
AreaCP = polyarea(b0(:,1),b0(:,2));

area = areaCirculos+AreaCP;


end