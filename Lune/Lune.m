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

% dado o conjunto de usuários cobertos, construindo a matriz com todas as 
% possíveis combinações de pares de pontos deste conjunto

% constrói uma matriz (n,2) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),2);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 4), onde os dois pares de cada linha são a combinação de pontos
m2 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1)))];

for i = 1:size(m1)
    for j = 1:size(Ufilt)
        if m2(i,1) == Ufilt(j,1)
            m2(i,2) = Ufilt(j,2);
        end
        if m2(i,3) == Ufilt(j,1)
            m2(i,4) = Ufilt(j,2);
        end
    end
end

% construindo a matriz lune(m,n) onde m são os pares de pontos e n são os
% pontos que satisfazem a condição da regra para cada par de pontos m
s = size(m2);
s = s(1);
t = size(Ufilt);
t = t(1);;
lune = zeros(s);

for i = 1:s
    c = 0;
    lune1 = zeros(s);
    norma(i) = norm([m2(i,3),m2(i,4)] - [m2(i,1),m2(i,2)]);
    for j = 1:t
        if (norm([m2(i,1),m2(i,2)] - [Ufilt(j,1),Ufilt(j,2)]) < norma(i)) && (norm([m2(i,3),m2(i,4)] - [Ufilt(j,1),Ufilt(j,2)]) < norma(i))
            lune1(i,1 + c) = Ufilt(j,1);
            lune1(i,2 + c) = Ufilt(j,2);
            c = c + 2;
        end
    end
    lune2 = unique(lune1,'stable');
    lune3 = nonzeros(lune2);
    lune(i,1:size(lune3)) = lune3';
end

% construindo a matriz V(m,n) onde m são os pares de pontos e n são os
% pontos que satisfazem a condição da regra para cada par de pontos m
V = zeros(s);
for i = 1:s
    c = 0;
    V1 = zeros(s);
    for j = 1:2:s
        for k = 1:2:s
            if (lune(i,j) > 0) && (lune(i,j+1) > 0) && (lune(i,k) > 0) && (lune(i,k+1) > 0)
                if (norm([lune(i,j),lune(i,j+1)] - [lune(i,k),lune(i,k+1)]) > norma(i))
                    V1(i, 1 + c) = lune(i,j);
                    V1(i, 2 + c) = lune(i,j+1);
                    V1(i, 3 + c) = lune(i,k);
                    V1(i, 4 + c) = lune(i,k+1);
                    c = c + 4;
                end
            end
        end
    end
    V2 = unique(V1,'stable');
    V3 = nonzeros(V2);
    V(i,1:size(V3)) = V3';
end


% construindo as matrizes Lu e Ld para cada par de pontos que constroem o 
% Lune
Lu = zeros(s);
Ld = zeros(s);
for i = 1:s
    c1 = 0;
    c2 = 0;
    for j = 1:2:s
        if (lune(i,j) > 0) && (lune(i,j+1) > 0)
            if max(cross([m2(i,3) - m2(i,1), m2(i,4) - m2(i,2), 0],[m2(i,3) - lune(i,j), m2(i,4) - lune(i,j+1), 0])) > 0
                Lu(i, 1 + c1) = lune(i,j);
                Lu(i, 2 + c1) = lune(i,j+1);
                c1 = c1 + 2;
            else
                Ld(i, 1 + c2) = lune(i,j);
                Ld(i, 2 + c2) = lune(i,j+1);
                c2 = c2 + 2;
            end
        end
    end
end


% construindo as matrizes Lu_int_V e Ld_int_V para cada par de pontos que
% constroem o Lune
for c1 = 1:s
    for c2 = 1:s
        for c3 = 1:s
            if V(c1,c2) == Lu(c1,c3)
                Lu_int_V(c1,c2) = V(c1,c2);
            end
        end
    end
end

for c1 = 1:s
    for c2 = 1:s
        for c3 = 1:s
            if V(c1,c2) == Ld(c1,c3)
                Ld_int_V(c1,c2) = V(c1,c2);
            end
        end
    end
end

% para cada par de pontos que que constroem o Lune, encontrando o número
% de pontos de Lu_int_V e Ld_int_V
tam_Lu_int_V = 0;
tam_Ld_int_V = 0;
for i = 1:s
    tu = 0;
    td = 0;
    for j = 1:2:s
        if Lu_int_V(i,j) > 0
            tu = tu + 1;
        end
        if Ld_int_V(i,j) > 0
            td = td + 1;
        end
    end
    tam_Lu_int_V(i) = tu;
    tam_Ld_int_V(i) = td;
end

% construindo a matriz de incidencias entre Lu_int_V e Ld_int_V
M = zeros(s);
for i = 1:s
    c = 0;
    for j = 1:2:s
        for k = 1:2:s
            if Lu_int_V(i,j) > 0 && Ld_int_V(i,k) > 0
                if norm([Lu_int_V(i,j),Lu_int_V(i,j+1)] - [Ld_int_V(i,k),Ld_int_V(i,k+1)]) > norma(i)
                    M(i,1+c) = j;
                    M(i,2+c) = k;
                    c = c + 2;
                end
            end
        end
    end
end
  
% construindo a matriz de adjacencias entre Lu_int_V e Ld_int_V e
% encontrando o máximo emparelhamento
for i = 1:s
    adj = zeros(s);
    for j = 1:2:s
        if M(i,j) > 0
            adj(M(i,j),M(i,j+1)) = 1;
        end
    end
    max_match(i,:) = card_match(adj);
end

max_match2 = zeros(s);
for i = 1:s
    for j = 1:2:s-1
        for k = 1:s
            for c = 1:s
                if M(i,j) == max_match(i,k) && M(i,j+1) == max_match(i,c)
                    max_match2(i,j) = max_match(i,k);
                    max_match2(i,j+1) = max_match(i,c);
                end
            end
        end
    end
end
                    

% construindo as matrizes Qu e Qd
Qu = zeros(s);
Qd = zeros(s);
for i = 1:s
    for j = 1:2:s
        if max_match2(i,j) > 0
            Qu(i,max_match2(i,j)) = Lu_int_V(i,max_match2(i,j));
            Qu(i,max_match2(i,j)+1) = Lu_int_V(i,max_match2(i,j)+1);
        end
    end
    for k = 2:2:s
        if max_match2(i,k) > 0
            Qd(i,max_match2(i,k)) = Ld_int_V(i,max_match2(i,k));
            Qd(i,max_match2(i,k)+1) = Ld_int_V(i,max_match2(i,k)+1);
        end
    end
end

tam_Qu = 0;
tam_Qd = 0;
for i = 1:s
    for j = 1:s
        if Qu(i,j) > 0
            tam_Qu = tam_Qu + 1;
        end
        if Qd(i,j) > 0
            tam_Qd = tam_Qd + 1;
        end
    end
end
tam_Qu = tam_Qu/2;
tam_Qd = tam_Qd/2;


% construindo a função Lune corrigida
LUNE = lune;
for i = 1:s
    if (tam_Lu_int_V(i) > 0) && (tam_Ld_int_V(i) > 0)
        if tam_Lu_int_V(i) < tam_Ld_int_V(i)
            for j = 1:2:s
                for k = 1:2:s
                    if LUNE(i,j) == Qu(i,k)
                        LUNE(i,j) = 0;
                        LUNE(i,j+1) = 0;
                    end
                end
            end
        elseif tam_Lu_int_V(i) > tam_Ld_int_V(i)
            for j = 1:2:s
                for k = 1:2:s
                    if LUNE(i,j) == Qd(i,k)
                        LUNE(i,j) = 0;
                        LUNE(i,j+1) = 0;
                    end
                end
            end
        else
            for j = 1:2:s
                for k = 1:2:s
                    if LUNE(i,j) == Qu(i,k)
                        LUNE(i,j) = 0;
                        LUNE(i,j+1) = 0;
                    end
                end
            end
            for j = 1:2:s
                for k = 1:2:s
                    if LUNE(i,j) == Qd(i,k)
                        LUNE(i,j) = 0;
                        LUNE(i,j+1) = 0;
                    end
                end
            end
        end
    end
end


% teste do algoritmo (verificar se é vazio novo conjunto V)
V_teste = zeros(s);
for i = 1:s
    c = 0;
    V1_teste = zeros(s);
    for j = 1:2:s
        for k = 1:2:s
            if (LUNE(i,j) > 0) && (LUNE(i,j+1) > 0) && (LUNE(i,k) > 0) && (LUNE(i,k+1) > 0)
                if (norm([LUNE(i,j),LUNE(i,j+1)] - [LUNE(i,k),LUNE(i,k+1)]) > norma(i))
                    V1_teste(i, 1 + c) = LUNE(i,j);
                    V1_teste(i, 2 + c) = LUNE(i,j+1);
                    V1_teste(i, 3 + c) = LUNE(i,k);
                    V1_teste(i, 4 + c) = LUNE(i,k+1);
                    c = c + 4;
                end
            end
        end
    end
    V2_teste = unique(V1_teste,'stable');
    V3_teste = nonzeros(V2_teste);
    V_teste(i,1:size(V3_teste)) = V3_teste';
end

% acrescentando os pontos da máxima diagonal a matriz de pontos LUNE
temp = max(size(LUNE));
if temp ~= s
    LUNE(:,temp) = [];
end
    
tam = size(m2);
tam = tam(2);
Lune_final = zeros(s+tam);
for i = 1:s
    c = 0;
    for j = 1:s
        if LUNE(i,j) ~= 0
            c = c + 1;
        end
    end
    if c~= 0
        Lune_final(i,:) = [m2(i,1:4) LUNE(i,:)];
    end
end

