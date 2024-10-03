function U = populaEspaco(numeroUsuarios,dimensao)
%% Entradas
% numeroUsuarios: escalar com o numero de usu�rios que estar�o na �rea
% considerada
% dimensao: vetor de 4 posicoes compreendendo a caracterizacao da regi�o retangular 
% contendo os usu�rios [xmin xmax ymin ymax]

%% Saidas
% U: vetor com numeroUsuarios linhas e 2 colunas, correspondendo as
% coordenadas (x,y) de cada usu�rio

%% Objetivo
%Essa fun��o deve retornar posi��es aleat�rias de usu�rios restrito a suas dimens�es

%% retorno
% f�rmula utilizada para gerar n�meros aleat�rios em um intervalo (a,b):
% r = a + (b-a).*rand(N,1)
x = dimensao(1) + (dimensao(2)-dimensao(1)).*rand(numeroUsuarios,1);
y = dimensao(3) + (dimensao(4)-dimensao(3)).*rand(numeroUsuarios,1);
U = [x,y] ;
end