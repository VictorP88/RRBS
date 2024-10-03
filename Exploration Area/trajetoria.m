clear all
close all
clc

%% popular o plano de usuarios
U = populaEspaco(30,[0 100 0 100]);

%  U = [
% 
%    98.7935   12.4873
%    17.0432    2.4434
%    25.7792   29.0185
%    39.6799   31.7521
%     7.3995   65.3690
%    68.4096   95.6936
%    40.2388   93.5731
%    98.2835   45.7886
%    40.2184   24.0478
%    62.0672   76.3898
%    15.4370   75.9327
%    38.1345   74.0648
%    16.1134   74.3688
%    75.8112   10.5920
%    87.1111   68.1560
%    35.0777   46.3261
%    68.5536   21.2163
%    29.4149    9.8519
%    53.0629   82.3574
%    83.2423   17.5010
%    59.7490   16.3570
%    33.5311   66.5987
%    29.9225   89.4389
%    45.2593   51.6558
%    42.2646   70.2702
%    35.9606   15.3590
%    55.8319   95.3457
%    74.2545   54.0884
%    42.4335   67.9734
%    42.9356    3.6563
% 
%    ]
   
hU = plot(U(:,1),U(:,2),'o');
hold on;

% RRBS: uma estrutura da seguinte forma
RRBS.raio = 20; %sqrt(2);
RRBS.posicao = [mean(U(:,1)) mean(U(:,2))]; %[50 50];
r = desenhaRRBS(RRBS);

% usuarios atendidos pela RRBS
[Ufilt,DistMatrix] = usuariosAtendidos(U,RRBS);
hUfilt = plot(Ufilt(:,1),Ufilt(:,2),'or');
hold on

% poligono convexo
[index] = convexSetIndex(Ufilt);
hUfiltCS = plot(Ufilt(index,1),Ufilt(index,2));
UfiltCS = Ufilt(index,:);
size_CS = length(index)-1;

% intercessão dos círculos de raio RRBS.raio centrados em cada usuários
% vértice do convex hull
[traj_vert, traj_users] = intersec(UfiltCS(1:end-1,:),RRBS.raio);
tU = plot(traj_vert(:,1),traj_vert(:,2),'h');
tam = size(traj_vert);
tam = max(tam);

axis equal;
hold on

% rotina para escrever a tripla de pontos que descrevem cada arco

aux = [traj_users(:,1)];
t = size(aux);
t = max(t);
aux(t+1:2*t,1) = traj_users(:,2);
aux1 = sort(aux);
aux = unique(aux1);
for i = 1:tam
    tripla(i,1:2) = UfiltCS(aux(i),1:2);
end
tripla(1,3:6) = [traj_vert(1,1) traj_vert(1,2) traj_vert(2,1) traj_vert(2,2)];
tripla(2,3:6) = [traj_vert(1,1) traj_vert(1,2) traj_vert(3,1) traj_vert(3,2)];
for i = 3:tam-1
    tripla(i,3:6) = [traj_vert(i,1) traj_vert(i,2) traj_vert(i+1,1) traj_vert(i+1,2)];
end
tripla(tam,3:6) = [traj_vert(2,1) traj_vert(2,2) traj_vert(tam,1) traj_vert(tam,2)];

% rotina para desenhar os arcos correspondentes à trajetória

for i = 3:tam-1
    x1 = traj_vert(i+1,1);
    y1 = traj_vert(i+1,2); % Point A to be on circle circumference
    x2 = traj_vert(i,1);
    y2 = traj_vert(i,2);% Same with point B
    r = RRBS.raio; % Choose R radius >= d/2
    d = sqrt((x2-x1)^2+(y2-y1)^2); % Distance between points
    a = atan2((x2-x1),-(y2-y1)); % Perpendicular bisector angle
    b = asin(d/2/r); % Half arc angle
    c = linspace(a-b,a+b); % Arc angle range
    e = sqrt(r^2-d^2/4); % Distance, center to midpoint
    x = (x1+x2)/2-e*cos(a)+r*cos(c); % Cartesian coords. of arc
    y = (y1+y2)/2-e*sin(a)+r*sin(c);
    plot(x,y,'y.',x1,y1,'r*',x2,y2,'b*')
end

hold on
x1 = traj_vert(3,1);
y1 = traj_vert(3,2); % Point A to be on circle circumference
x2 = traj_vert(1,1);
y2 = traj_vert(1,2);% Same with point B
r = RRBS.raio; % Choose R radius >= d/2
d = sqrt((x2-x1)^2+(y2-y1)^2); % Distance between points
a = atan2((x2-x1),-(y2-y1)); % Perpendicular bisector angle
b = asin(d/2/r); % Half arc angle
c = linspace(a-b,a+b); % Arc angle range
e = sqrt(r^2-d^2/4); % Distance, center to midpoint
x = (x1+x2)/2-e*cos(a)+r*cos(c); % Cartesian coords. of arc
y = (y1+y2)/2-e*sin(a)+r*sin(c);
plot(x,y,'y.',x1,y1,'r*',x2,y2,'b*')


x1 = traj_vert(2,1);
y1 = traj_vert(2,2); % Point A to be on circle circumference
x2 = traj_vert(tam,1);
y2 = traj_vert(tam,2);% Same with point B
r = RRBS.raio; % Choose R radius >= d/2
d = sqrt((x2-x1)^2+(y2-y1)^2); % Distance between points
a = atan2((x2-x1),-(y2-y1)); % Perpendicular bisector angle
b = asin(d/2/r); % Half arc angle
c = linspace(a-b,a+b); % Arc angle range
e = sqrt(r^2-d^2/4); % Distance, center to midpoint
x = (x1+x2)/2-e*cos(a)+r*cos(c); % Cartesian coords. of arc
y = (y1+y2)/2-e*sin(a)+r*sin(c);
plot(x,y,'y.',x1,y1,'r*',x2,y2,'b*')


x1 = traj_vert(1,1);
y1 = traj_vert(1,2); % Point A to be on circle circumference
x2 = traj_vert(2,1);
y2 = traj_vert(2,2);% Same with point B
r = RRBS.raio; % Choose R radius >= d/2
d = sqrt((x2-x1)^2+(y2-y1)^2); % Distance between points
a = atan2((x2-x1),-(y2-y1)); % Perpendicular bisector angle
b = asin(d/2/r); % Half arc angle
c = linspace(a-b,a+b); % Arc angle range
e = sqrt(r^2-d^2/4); % Distance, center to midpoint
x = (x1+x2)/2-e*cos(a)+r*cos(c); % Cartesian coords. of arc
y = (y1+y2)/2-e*sin(a)+r*sin(c);
plot(x,y,'y.',x1,y1,'r*',x2,y2,'b*')

% if we want the bending to go clockwise, just change 'a':
% a = atan2(x2-x1,-(y2-y1));


% rotina para encontrar os vértices da cobertura
for i = 1:tam
    v1_cobertura(i,1:2) = [tripla(i,1) tripla(i,2)];
    v1_cobertura(i,3:4) = [tripla(i,1) tripla(i,2)] + 2*([tripla(i,3) tripla(i,4)] - [tripla(i,1) tripla(i,2)]);
    v1_cobertura(i,5:6) = [tripla(i,1) tripla(i,2)] + 2*([tripla(i,5) tripla(i,6)] - [tripla(i,1) tripla(i,2)]);
end

hold on
plot(v1_cobertura(:,3),v1_cobertura(:,4),'s');
hold on
plot(v1_cobertura(:,5),v1_cobertura(:,6),'s');
hold on

% rotina para desenhar os arcos 2*RRBS.raio que correspondem aos limites de exploração
vertices_arco_exp_x = NaN;
vertices_arco_exp_y = NaN;

for i = 2:tam-1
    x1 = v1_cobertura(i,5);
    y1 = v1_cobertura(i,6); % Point A to be on circle circumference
    x2 = v1_cobertura(i,3);
    y2 = v1_cobertura(i,4);% Same with point B
    r = 2*RRBS.raio; % Choose R radius >= d/2
    d = sqrt((x2-x1)^2+(y2-y1)^2); % Distance between points
    a = atan2((x2-x1),-(y2-y1)); % Perpendicular bisector angle
    b = asin(d/2/r); % Half arc angle
    c = linspace(a-b,a+b); % Arc angle range
    e = sqrt(r^2-d^2/4); % Distance, center to midpoint
    x = (x1+x2)/2-e*cos(a)+r*cos(c); % Cartesian coords. of arc
    y = (y1+y2)/2-e*sin(a)+r*sin(c);
    plot(x,y,'y.',x1,y1,'r*',x2,y2,'b*')
    vertices_arco_exp_x = [vertices_arco_exp_x, x];
    vertices_arco_exp_y = [vertices_arco_exp_y, y];
end

[vertices_arco_exp_x, vertices_arco_exp_y] = poly2cw(vertices_arco_exp_x, vertices_arco_exp_y);
sz = size(vertices_arco_exp_x);

x1 = v1_cobertura(1,3);
y1 = v1_cobertura(1,4); % Point A to be on circle circumference
x2 = v1_cobertura(1,5);
y2 = v1_cobertura(1,6);% Same with point B
r = 2*RRBS.raio; % Choose R radius >= d/2
d = sqrt((x2-x1)^2+(y2-y1)^2); % Distance between points
a = atan2((x2-x1),-(y2-y1)); % Perpendicular bisector angle
b = asin(d/2/r); % Half arc angle
c = linspace(a-b,a+b); % Arc angle range
e = sqrt(r^2-d^2/4); % Distance, center to midpoint
x = (x1+x2)/2-e*cos(a)+r*cos(c); % Cartesian coords. of arc
y = (y1+y2)/2-e*sin(a)+r*sin(c);
plot(x,y,'y.',x1,y1,'r*',x2,y2,'b*')
vertices_arco_exp_x = [vertices_arco_exp_x, x];
vertices_arco_exp_y = [vertices_arco_exp_y, y];

x1 = v1_cobertura(tam,3);
y1 = v1_cobertura(tam,4); % Point A to be on circle circumference
x2 = v1_cobertura(tam,5);
y2 = v1_cobertura(tam,6);% Same with point B
r = 2*RRBS.raio; % Choose R radius >= d/2
d = sqrt((x2-x1)^2+(y2-y1)^2); % Distance between points
a = atan2((x2-x1),-(y2-y1)); % Perpendicular bisector angle
b = asin(d/2/r); % Half arc angle
c = linspace(a-b,a+b); % Arc angle range
e = sqrt(r^2-d^2/4); % Distance, center to midpoint
x = (x1+x2)/2-e*cos(a)+r*cos(c); % Cartesian coords. of arc
y = (y1+y2)/2-e*sin(a)+r*sin(c);
plot(x,y,'y.',x1,y1,'r*',x2,y2,'b*')
vertices_arco_exp_x = [vertices_arco_exp_x, x];
vertices_arco_exp_y = [vertices_arco_exp_y, y];

% rotina para desenhar os arcos RRBS.raio que correspondem aos limites de exploração

for i = 2:tam-2
    x1 = v1_cobertura(i+1,3);
    y1 = v1_cobertura(i+1,4); % Point A to be on circle circumference
    x2 = v1_cobertura(i,5);
    y2 = v1_cobertura(i,6);% Same with point B
    r = RRBS.raio; % Choose R radius >= d/2
    d = sqrt((x2-x1)^2+(y2-y1)^2); % Distance between points
    a = atan2((x2-x1),-(y2-y1)); % Perpendicular bisector angle
    b = asin(d/2/r); % Half arc angle
    c = linspace(a-b,a+b); % Arc angle range
    e = sqrt(r^2-d^2/4); % Distance, center to midpoint
    x = (x1+x2)/2-e*cos(a)+r*cos(c); % Cartesian coords. of arc
    y = (y1+y2)/2-e*sin(a)+r*sin(c);
    plot(x,y,'y.',x1,y1,'r*',x2,y2,'b*')
    vertices_arco_exp_x = [vertices_arco_exp_x, x];
    vertices_arco_exp_y = [vertices_arco_exp_y, y];
end


hold on
x1 = v1_cobertura(2,3);
y1 = v1_cobertura(2,4); % Point A to be on circle circumference
x2 = v1_cobertura(1,3);
y2 = v1_cobertura(1,4);% Same with point B
r = RRBS.raio; % Choose R radius >= d/2
d = sqrt((x2-x1)^2+(y2-y1)^2); % Distance between points
a = atan2((x2-x1),-(y2-y1)); % Perpendicular bisector angle
b = asin(d/2/r); % Half arc angle
c = linspace(a-b,a+b); % Arc angle range
e = sqrt(r^2-d^2/4); % Distance, center to midpoint
x = (x1+x2)/2-e*cos(a)+r*cos(c); % Cartesian coords. of arc
y = (y1+y2)/2-e*sin(a)+r*sin(c);
plot(x,y,'y.',x1,y1,'r*',x2,y2,'b*')
vertices_arco_exp_x = [vertices_arco_exp_x, x];
vertices_arco_exp_y = [vertices_arco_exp_y, y];

hold on
x1 = v1_cobertura(tam,5);
y1 = v1_cobertura(tam,6); % Point A to be on circle circumference
x2 = v1_cobertura(tam-1,5);
y2 = v1_cobertura(tam-1,6);% Same with point B
r = RRBS.raio; % Choose R radius >= d/2
d = sqrt((x2-x1)^2+(y2-y1)^2); % Distance between points
a = atan2((x2-x1),-(y2-y1)); % Perpendicular bisector angle
b = asin(d/2/r); % Half arc angle
c = linspace(a-b,a+b); % Arc angle range
e = sqrt(r^2-d^2/4); % Distance, center to midpoint
x = (x1+x2)/2-e*cos(a)+r*cos(c); % Cartesian coords. of arc
y = (y1+y2)/2-e*sin(a)+r*sin(c);
plot(x,y,'y.',x1,y1,'r*',x2,y2,'b*')
vertices_arco_exp_x = [vertices_arco_exp_x, x];
vertices_arco_exp_y = [vertices_arco_exp_y, y];

hold on
x1 = v1_cobertura(1,5);
y1 = v1_cobertura(1,6); % Point A to be on circle circumference
x2 = v1_cobertura(tam,3);
y2 = v1_cobertura(tam,4);% Same with point B
r = RRBS.raio; % Choose R radius >= d/2
d = sqrt((x2-x1)^2+(y2-y1)^2); % Distance between points
a = atan2((x2-x1),-(y2-y1)); % Perpendicular bisector angle
b = asin(d/2/r); % Half arc angle
c = linspace(a-b,a+b); % Arc angle range
e = sqrt(r^2-d^2/4); % Distance, center to midpoint
x = (x1+x2)/2-e*cos(a)+r*cos(c); % Cartesian coords. of arc
y = (y1+y2)/2-e*sin(a)+r*sin(c);
p = plot(x,y,'y.',x1,y1,'r*',x2,y2,'b*')
vertices_arco_exp_x = [vertices_arco_exp_x, x];
vertices_arco_exp_y = [vertices_arco_exp_y, y];

h = gca;

% cálculo da área de exploração usando convhull
figure
K = convhull(vertices_arco_exp_x,vertices_arco_exp_y);
sx = vertices_arco_exp_x(K);
sy = vertices_arco_exp_y(K);
plot(sx,sy);
axis equal;

fill(sx,sy,'g');
S = polyarea(sx,sy) - pi*(RRBS.raio)^2;

xlim(get(h,'XLim'))
ylim(get(h,'YLim'))