clear all
close all
clc

%% popular o espaco de usuarios
U = populaEspaco(30,[0 100 0 100]);
hU = plot(U(:,1),U(:,2),'o');hold on;

% RRBS: uma estrutura da seguinte forma
RRBS.raio = 20; %sqrt(2);
RRBS.posicao = [mean(U(:,1)) mean(U(:,2))]; %[50 50];
r = desenhaRRBS(RRBS);

% usuarios atendidos pela RRBS
[Ufilt,DistMatrix] = usuariosAtendidos(U,RRBS);
hUfilt = plot(Ufilt(:,1),Ufilt(:,2),'or');

% poligono convexo
[index] = convexSetIndex(Ufilt);
hUfiltCS = plot(Ufilt(index,1),Ufilt(index,2));

area2 = calculaAreaExternaEstocastico(Ufilt(index,:),RRBS);
hUfiltCS = plot(Ufilt(index,1),Ufilt(index,2));
hUfilt = plot(Ufilt(:,1),Ufilt(:,2),'or');
desenhaRRBS(RRBS);

[area, b0, vhand, vleg] = calculaAreaExterna(Ufilt(index,:),RRBS);
% legend([ [hU, hUfilt, hUfiltCS] vhand],{'users' 'atendidos' 'poly' vleg{:} },'FontSize',16 );
axis equal;

axis equal;

