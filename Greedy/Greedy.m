clear all
close all
clc

%% popular o plano de usuarios
U = populaEspaco(100,[0 100 0 100]);

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

covered_users = Ufilt;
t = size(covered_users);
t = t(1);
greedy = zeros(t,2*t);
k = 1;
while t >= 4
    temp1 = 0;
    temp2 = 0;
    t = size(covered_users);
    t = t(1);
    c = 1;
    for i = 1:t
        greedy(k,c) = covered_users(i,1);
        greedy(k,c+1) = covered_users(i,2);
        c = c + 2;
    end
    k = k + 1;
    matriz_dist = pdist(covered_users);
    matriz_dist = squareform(matriz_dist);
    max_dist = max(matriz_dist);
    max_dist = max(max_dist);
    for i = 1:t
        for j = 1:t
            if max_dist == matriz_dist(i,j)
                temp1 = i;
                temp2 = j;
            end
        end
    end
    covered_users(temp1,:) = [];
    covered_users(temp2,:) = [];
end