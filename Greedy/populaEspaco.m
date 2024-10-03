function U = populaEspaco(numeroUsuarios,dimensao)
%% Entradas
% numeroUsuarios: escalar com o numero de usuários que estarão na área
% considerada
% dimensao: vetor de 4 posicoes compreendendo a caracterizacao da região retangular 
% contendo os usuários [xmin xmax ymin ymax]

%% Saidas
% U: vetor com numeroUsuarios linhas e 2 colunas, correspondendo as
% coordenadas (x,y) de cada usuário

%% Objetivo
%Essa função deve retornar posições aleatórias de usuários restrito a suas dimensões

%% retorno
% fórmula utilizada para gerar números aleatórios em um intervalo (a,b):
% r = a + (b-a).*rand(N,1)
x = dimensao(1) + (dimensao(2)-dimensao(1)).*rand(numeroUsuarios,1);
y = dimensao(3) + (dimensao(4)-dimensao(3)).*rand(numeroUsuarios,1);
U = [x,y] ;
end