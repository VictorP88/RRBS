function [Ufilt,DistMatrix] = usuariosAtendidos(U,RRBS)
%% Entradas
% U: gerada pela fun��o populaEspaco
% RRBS: uma estrutura da seguinte forma
%   RRBS.raio = escalar;
%   RRBS.posicao = vetor de duas posicoes (x,y) do centro da RRBS

%% Saidas
% Ufilt: vetor de n linhas e 2 colunas (n � o n�mero de usu�rios atendidos)
% DistMatrix: uma matrix n x n sim�trica com as dist�ncias entre os
% usu�rios i e j;


%% Objetivo
%Essa fun��o deve retornar os usu�rios atendidos pela RRBS em sua posi��o
%atual e uma matriz de distancias de cada um destes usu�rios para qualquer
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