function [index,Area] = convexSetIndex(Us)
%% Entradas
% Us: um subconjunto do conjunto U gerado pela fun��o populaEspaco

%% Saidas
% index: posicao de todos usuarios que fazem parte do conjunto convexo
% (vetor n x 1)

%% Objetivo
% Essa fun��o deve retornar os indices dos usu�rios sobre o poligono convexo

%% retorno
[index,Area] = convhull(Us(:,1),Us(:,2));
end