function [Ufilt,DistMatrix] = usuariosAtendidos(U,RRBS)
%% Entradas
% U: gerada pela função populaEspaco
% RRBS: uma estrutura da seguinte forma
%   RRBS.raio = escalar;
%   RRBS.posicao = vetor de duas posicoes (x,y) do centro da RRBS

%% Saidas
% Ufilt: vetor de n linhas e 2 colunas (n é o número de usuários atendidos)
% DistMatrix: uma matrix n x n simétrica com as distâncias entre os
% usuários i e j;


%% Objetivo
%Essa função deve retornar os usuários atendidos pela RRBS em sua posição
%atual e uma matriz de distancias de cada um destes usuários para qualquer
%outro usuario do conjunto Ufilt

%% retorno
t = size(U,1);
Ufilt = [];
for i = 1:t
    d = norm(RRBS.posicao - U(i,:));
    if d <= RRBS.raio
        Ufilt = [Ufilt;U(i,:)];
    end
end
s = size(Ufilt);
s = s(1);
DistMatrix = zeros(s,s);
for j = 1:s
    for k = 1:j-1
        DistMatrix(j,k) = norm(Ufilt(j,:) - Ufilt(k,:));
        DistMatrix(k,j) = DistMatrix(j,k);
    end
end

end