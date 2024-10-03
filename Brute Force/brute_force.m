clear all
close all
clc

%% popular o plano de usuarios
U = populaEspaco(70,[0 100 0 100]);

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

% construindo todas possíveis combinações de polígonos convexos

% constrói uma matriz (n,3) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),3);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 6), onde os três pares de cada linha são a combinação de pontos
m3 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1)))];

t = 0;
for i=1:size(m1)
    for j=1:size(Ufilt)
        if m3(i,1) == Ufilt(j,1)
            m3(i,2) = Ufilt(j,2);
        end
        if m3(i,3) == Ufilt(j,1)
            m3(i,4) = Ufilt(j,2);
        end
        if m3(i,5) == Ufilt(j,1)
            m3(i,6) = Ufilt(j,2);
        end
    end
end
t = size(m3);
t = t(1);
Brute_Force = [m3 zeros(t,2)];

% constrói uma matriz (n,4) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),4);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 8), onde os quatro pares de cada linha são a combinação de pontos
m4 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m4(i,1) == Ufilt(j,1)
            m4(i,2) = Ufilt(j,2);
        end
        if m4(i,3) == Ufilt(j,1)
            m4(i,4) = Ufilt(j,2);
        end
        if m4(i,5) == Ufilt(j,1)
            m4(i,6) = Ufilt(j,2);
        end
        if m4(i,7) == Ufilt(j,1)
            m4(i,8) = Ufilt(j,2);
        end
    end
end
tam = size(m4);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m4];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end


% constrói uma matriz (n,5) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),5);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 10), onde os cinco pares de cada linha são a combinação de pontos
m5 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m5(i,1) == Ufilt(j,1)
            m5(i,2) = Ufilt(j,2);
        end
        if m5(i,3) == Ufilt(j,1)
            m5(i,4) = Ufilt(j,2);
        end
        if m5(i,5) == Ufilt(j,1)
            m5(i,6) = Ufilt(j,2);
        end
        if m5(i,7) == Ufilt(j,1)
            m5(i,8) = Ufilt(j,2);
        end
        if m5(i,9) == Ufilt(j,1)
            m5(i,10) = Ufilt(j,2);
        end
    end
end
tam = size(m5);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m5];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end
    
% constrói uma matriz (n,6) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),6);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 12), onde os seis pares de cada linha são a combinação de pontos
m6 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m6(i,1) == Ufilt(j,1)
            m6(i,2) = Ufilt(j,2);
        end
        if m6(i,3) == Ufilt(j,1)
            m6(i,4) = Ufilt(j,2);
        end
        if m6(i,5) == Ufilt(j,1)
            m6(i,6) = Ufilt(j,2);
        end
        if m6(i,7) == Ufilt(j,1)
            m6(i,8) = Ufilt(j,2);
        end
        if m6(i,9) == Ufilt(j,1)
            m6(i,10) = Ufilt(j,2);
        end
        if m6(i,11) == Ufilt(j,1)
            m6(i,12) = Ufilt(j,2);
        end
    end
end
tam = size(m6);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m6];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,7) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),7);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 14), onde os sete pares de cada linha são a combinação de pontos
m7 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m7(i,1) == Ufilt(j,1)
            m7(i,2) = Ufilt(j,2);
        end
        if m7(i,3) == Ufilt(j,1)
            m7(i,4) = Ufilt(j,2);
        end
        if m7(i,5) == Ufilt(j,1)
            m7(i,6) = Ufilt(j,2);
        end
        if m7(i,7) == Ufilt(j,1)
            m7(i,8) = Ufilt(j,2);
        end
        if m7(i,9) == Ufilt(j,1)
            m7(i,10) = Ufilt(j,2);
        end
        if m7(i,11) == Ufilt(j,1)
            m7(i,12) = Ufilt(j,2);
        end
        if m7(i,13) == Ufilt(j,1)
            m7(i,14) = Ufilt(j,2);
        end
    end
end
tam = size(m7);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m7];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,8) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),8);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 16), onde os oito pares de cada linha são a combinação de pontos
m8 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m8(i,1) == Ufilt(j,1)
            m8(i,2) = Ufilt(j,2);
        end
        if m8(i,3) == Ufilt(j,1)
            m8(i,4) = Ufilt(j,2);
        end
        if m8(i,5) == Ufilt(j,1)
            m8(i,6) = Ufilt(j,2);
        end
        if m8(i,7) == Ufilt(j,1)
            m8(i,8) = Ufilt(j,2);
        end
        if m8(i,9) == Ufilt(j,1)
            m8(i,10) = Ufilt(j,2);
        end
        if m8(i,11) == Ufilt(j,1)
            m8(i,12) = Ufilt(j,2);
        end
        if m8(i,13) == Ufilt(j,1)
            m8(i,14) = Ufilt(j,2);
        end
        if m8(i,15) == Ufilt(j,1)
            m8(i,16) = Ufilt(j,2);
        end
    end
end
tam = size(m8);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m8];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,9) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),9);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 18), onde os nove pares de cada linha são a combinação de pontos
m9 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1))),m1(:,9),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m9(i,1) == Ufilt(j,1)
            m9(i,2) = Ufilt(j,2);
        end
        if m9(i,3) == Ufilt(j,1)
            m9(i,4) = Ufilt(j,2);
        end
        if m9(i,5) == Ufilt(j,1)
            m9(i,6) = Ufilt(j,2);
        end
        if m9(i,7) == Ufilt(j,1)
            m9(i,8) = Ufilt(j,2);
        end
        if m9(i,9) == Ufilt(j,1)
            m9(i,10) = Ufilt(j,2);
        end
        if m9(i,11) == Ufilt(j,1)
            m9(i,12) = Ufilt(j,2);
        end
        if m9(i,13) == Ufilt(j,1)
            m9(i,14) = Ufilt(j,2);
        end
        if m9(i,15) == Ufilt(j,1)
            m9(i,16) = Ufilt(j,2);
        end
        if m9(i,17) == Ufilt(j,1)
            m9(i,18) = Ufilt(j,2);
        end
    end
end
tam = size(m9);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m9];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,10) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),10);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 20), onde os dez pares de cada linha são a combinação de pontos
m10 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1))),m1(:,9),zeros(size(m1(:,1))),m1(:,10),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m10(i,1) == Ufilt(j,1)
            m10(i,2) = Ufilt(j,2);
        end
        if m10(i,3) == Ufilt(j,1)
            m10(i,4) = Ufilt(j,2);
        end
        if m10(i,5) == Ufilt(j,1)
            m10(i,6) = Ufilt(j,2);
        end
        if m10(i,7) == Ufilt(j,1)
            m10(i,8) = Ufilt(j,2);
        end
        if m10(i,9) == Ufilt(j,1)
            m10(i,10) = Ufilt(j,2);
        end
        if m10(i,11) == Ufilt(j,1)
            m10(i,12) = Ufilt(j,2);
        end
        if m10(i,13) == Ufilt(j,1)
            m10(i,14) = Ufilt(j,2);
        end
        if m10(i,15) == Ufilt(j,1)
            m10(i,16) = Ufilt(j,2);
        end
        if m10(i,17) == Ufilt(j,1)
            m10(i,18) = Ufilt(j,2);
        end
        if m10(i,19) == Ufilt(j,1)
            m10(i,20) = Ufilt(j,2);
        end
    end
end
tam = size(m10);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m10];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,11) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),11);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 22), onde os onze pares de cada linha são a combinação de pontos
m11 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1))),m1(:,9),zeros(size(m1(:,1))),m1(:,10),zeros(size(m1(:,1))),m1(:,11),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m11(i,1) == Ufilt(j,1)
            m11(i,2) = Ufilt(j,2);
        end
        if m11(i,3) == Ufilt(j,1)
            m11(i,4) = Ufilt(j,2);
        end
        if m11(i,5) == Ufilt(j,1)
            m11(i,6) = Ufilt(j,2);
        end
        if m11(i,7) == Ufilt(j,1)
            m11(i,8) = Ufilt(j,2);
        end
        if m11(i,9) == Ufilt(j,1)
            m11(i,10) = Ufilt(j,2);
        end
        if m11(i,11) == Ufilt(j,1)
            m11(i,12) = Ufilt(j,2);
        end
        if m11(i,13) == Ufilt(j,1)
            m11(i,14) = Ufilt(j,2);
        end
        if m11(i,15) == Ufilt(j,1)
            m11(i,16) = Ufilt(j,2);
        end
        if m11(i,17) == Ufilt(j,1)
            m11(i,18) = Ufilt(j,2);
        end
        if m11(i,19) == Ufilt(j,1)
            m11(i,20) = Ufilt(j,2);
        end
        if m11(i,21) == Ufilt(j,1)
            m11(i,22) = Ufilt(j,2);
        end
    end
end
tam = size(m11);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m11];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,12) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),12);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 24), onde os doze pares de cada linha são a combinação de pontos
m12 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1))),m1(:,9),zeros(size(m1(:,1))),m1(:,10),zeros(size(m1(:,1))),m1(:,11),zeros(size(m1(:,1))),m1(:,12),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m12(i,1) == Ufilt(j,1)
            m12(i,2) = Ufilt(j,2);
        end
        if m12(i,3) == Ufilt(j,1)
            m12(i,4) = Ufilt(j,2);
        end
        if m12(i,5) == Ufilt(j,1)
            m12(i,6) = Ufilt(j,2);
        end
        if m12(i,7) == Ufilt(j,1)
            m12(i,8) = Ufilt(j,2);
        end
        if m12(i,9) == Ufilt(j,1)
            m12(i,10) = Ufilt(j,2);
        end
        if m12(i,11) == Ufilt(j,1)
            m12(i,12) = Ufilt(j,2);
        end
        if m12(i,13) == Ufilt(j,1)
            m12(i,14) = Ufilt(j,2);
        end
        if m12(i,15) == Ufilt(j,1)
            m12(i,16) = Ufilt(j,2);
        end
        if m12(i,17) == Ufilt(j,1)
            m12(i,18) = Ufilt(j,2);
        end
        if m12(i,19) == Ufilt(j,1)
            m12(i,20) = Ufilt(j,2);
        end
        if m12(i,21) == Ufilt(j,1)
            m12(i,22) = Ufilt(j,2);
        end
        if m12(i,23) == Ufilt(j,1)
            m12(i,24) = Ufilt(j,2);
        end
    end
end
tam = size(m12);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m12];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,13) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),13);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 26), onde os doze pares de cada linha são a combinação de pontos
m13 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1))),m1(:,9),zeros(size(m1(:,1))),m1(:,10),zeros(size(m1(:,1))),m1(:,11),zeros(size(m1(:,1))),m1(:,12),zeros(size(m1(:,1))),m1(:,13),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m13(i,1) == Ufilt(j,1)
            m13(i,2) = Ufilt(j,2);
        end
        if m13(i,3) == Ufilt(j,1)
            m13(i,4) = Ufilt(j,2);
        end
        if m13(i,5) == Ufilt(j,1)
            m13(i,6) = Ufilt(j,2);
        end
        if m13(i,7) == Ufilt(j,1)
            m13(i,8) = Ufilt(j,2);
        end
        if m13(i,9) == Ufilt(j,1)
            m13(i,10) = Ufilt(j,2);
        end
        if m13(i,11) == Ufilt(j,1)
            m13(i,12) = Ufilt(j,2);
        end
        if m13(i,13) == Ufilt(j,1)
            m13(i,14) = Ufilt(j,2);
        end
        if m13(i,15) == Ufilt(j,1)
            m13(i,16) = Ufilt(j,2);
        end
        if m13(i,17) == Ufilt(j,1)
            m13(i,18) = Ufilt(j,2);
        end
        if m13(i,19) == Ufilt(j,1)
            m13(i,20) = Ufilt(j,2);
        end
        if m13(i,21) == Ufilt(j,1)
            m13(i,22) = Ufilt(j,2);
        end
        if m13(i,23) == Ufilt(j,1)
            m13(i,24) = Ufilt(j,2);
        end
        if m13(i,25) == Ufilt(j,1)
            m13(i,26) = Ufilt(j,2);
        end
    end
end
tam = size(m13);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m13];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,14) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),14);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 28), onde os doze pares de cada linha são a combinação de pontos
m14 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1))),m1(:,9),zeros(size(m1(:,1))),m1(:,10),zeros(size(m1(:,1))),m1(:,11),zeros(size(m1(:,1))),m1(:,12),zeros(size(m1(:,1))),m1(:,13),zeros(size(m1(:,1))),m1(:,14),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m14(i,1) == Ufilt(j,1)
            m14(i,2) = Ufilt(j,2);
        end
        if m14(i,3) == Ufilt(j,1)
            m14(i,4) = Ufilt(j,2);
        end
        if m14(i,5) == Ufilt(j,1)
            m14(i,6) = Ufilt(j,2);
        end
        if m14(i,7) == Ufilt(j,1)
            m14(i,8) = Ufilt(j,2);
        end
        if m14(i,9) == Ufilt(j,1)
            m14(i,10) = Ufilt(j,2);
        end
        if m14(i,11) == Ufilt(j,1)
            m14(i,12) = Ufilt(j,2);
        end
        if m14(i,13) == Ufilt(j,1)
            m14(i,14) = Ufilt(j,2);
        end
        if m14(i,15) == Ufilt(j,1)
            m14(i,16) = Ufilt(j,2);
        end
        if m14(i,17) == Ufilt(j,1)
            m14(i,18) = Ufilt(j,2);
        end
        if m14(i,19) == Ufilt(j,1)
            m14(i,20) = Ufilt(j,2);
        end
        if m14(i,21) == Ufilt(j,1)
            m14(i,22) = Ufilt(j,2);
        end
        if m14(i,23) == Ufilt(j,1)
            m14(i,24) = Ufilt(j,2);
        end
        if m14(i,25) == Ufilt(j,1)
            m14(i,26) = Ufilt(j,2);
        end
        if m14(i,27) == Ufilt(j,1)
            m14(i,28) = Ufilt(j,2);
        end
    end
end
tam = size(m14);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m14];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,15) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),15);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 30), onde os doze pares de cada linha são a combinação de pontos
m15 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1))),m1(:,9),zeros(size(m1(:,1))),m1(:,10),zeros(size(m1(:,1))),m1(:,11),zeros(size(m1(:,1))),m1(:,12),zeros(size(m1(:,1))),m1(:,13),zeros(size(m1(:,1))),m1(:,14),zeros(size(m1(:,1))),m1(:,15),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m15(i,1) == Ufilt(j,1)
            m15(i,2) = Ufilt(j,2);
        end
        if m15(i,3) == Ufilt(j,1)
            m15(i,4) = Ufilt(j,2);
        end
        if m15(i,5) == Ufilt(j,1)
            m15(i,6) = Ufilt(j,2);
        end
        if m15(i,7) == Ufilt(j,1)
            m15(i,8) = Ufilt(j,2);
        end
        if m15(i,9) == Ufilt(j,1)
            m15(i,10) = Ufilt(j,2);
        end
        if m15(i,11) == Ufilt(j,1)
            m15(i,12) = Ufilt(j,2);
        end
        if m15(i,13) == Ufilt(j,1)
            m15(i,14) = Ufilt(j,2);
        end
        if m15(i,15) == Ufilt(j,1)
            m15(i,16) = Ufilt(j,2);
        end
        if m15(i,17) == Ufilt(j,1)
            m15(i,18) = Ufilt(j,2);
        end
        if m15(i,19) == Ufilt(j,1)
            m15(i,20) = Ufilt(j,2);
        end
        if m15(i,21) == Ufilt(j,1)
            m15(i,22) = Ufilt(j,2);
        end
        if m15(i,23) == Ufilt(j,1)
            m15(i,24) = Ufilt(j,2);
        end
        if m15(i,25) == Ufilt(j,1)
            m15(i,26) = Ufilt(j,2);
        end
        if m15(i,27) == Ufilt(j,1)
            m15(i,28) = Ufilt(j,2);
        end
        if m15(i,29) == Ufilt(j,1)
            m15(i,30) = Ufilt(j,2);
        end
    end
end
tam = size(m15);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m15];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,16) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),16);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 32), onde os doze pares de cada linha são a combinação de pontos
m16 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1))),m1(:,9),zeros(size(m1(:,1))),m1(:,10),zeros(size(m1(:,1))),m1(:,11),zeros(size(m1(:,1))),m1(:,12),zeros(size(m1(:,1))),m1(:,13),zeros(size(m1(:,1))),m1(:,14),zeros(size(m1(:,1))),m1(:,15),zeros(size(m1(:,1))),m1(:,16),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m16(i,1) == Ufilt(j,1)
            m16(i,2) = Ufilt(j,2);
        end
        if m16(i,3) == Ufilt(j,1)
            m16(i,4) = Ufilt(j,2);
        end
        if m16(i,5) == Ufilt(j,1)
            m16(i,6) = Ufilt(j,2);
        end
        if m16(i,7) == Ufilt(j,1)
            m16(i,8) = Ufilt(j,2);
        end
        if m16(i,9) == Ufilt(j,1)
            m16(i,10) = Ufilt(j,2);
        end
        if m16(i,11) == Ufilt(j,1)
            m16(i,12) = Ufilt(j,2);
        end
        if m16(i,13) == Ufilt(j,1)
            m16(i,14) = Ufilt(j,2);
        end
        if m16(i,15) == Ufilt(j,1)
            m16(i,16) = Ufilt(j,2);
        end
        if m16(i,17) == Ufilt(j,1)
            m16(i,18) = Ufilt(j,2);
        end
        if m16(i,19) == Ufilt(j,1)
            m16(i,20) = Ufilt(j,2);
        end
        if m16(i,21) == Ufilt(j,1)
            m16(i,22) = Ufilt(j,2);
        end
        if m16(i,23) == Ufilt(j,1)
            m16(i,24) = Ufilt(j,2);
        end
        if m16(i,25) == Ufilt(j,1)
            m16(i,26) = Ufilt(j,2);
        end
        if m16(i,27) == Ufilt(j,1)
            m16(i,28) = Ufilt(j,2);
        end
        if m16(i,29) == Ufilt(j,1)
            m16(i,30) = Ufilt(j,2);
        end
        if m16(i,31) == Ufilt(j,1)
            m16(i,32) = Ufilt(j,2);
        end
    end
end
tam = size(m16);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m16];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,17) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),17);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 34), onde os doze pares de cada linha são a combinação de pontos
m17 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1))),m1(:,9),zeros(size(m1(:,1))),m1(:,10),zeros(size(m1(:,1))),m1(:,11),zeros(size(m1(:,1))),m1(:,12),zeros(size(m1(:,1))),m1(:,13),zeros(size(m1(:,1))),m1(:,14),zeros(size(m1(:,1))),m1(:,15),zeros(size(m1(:,1))),m1(:,16),zeros(size(m1(:,1))),m1(:,17),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m17(i,1) == Ufilt(j,1)
            m17(i,2) = Ufilt(j,2);
        end
        if m17(i,3) == Ufilt(j,1)
            m17(i,4) = Ufilt(j,2);
        end
        if m17(i,5) == Ufilt(j,1)
            m17(i,6) = Ufilt(j,2);
        end
        if m17(i,7) == Ufilt(j,1)
            m17(i,8) = Ufilt(j,2);
        end
        if m17(i,9) == Ufilt(j,1)
            m17(i,10) = Ufilt(j,2);
        end
        if m17(i,11) == Ufilt(j,1)
            m17(i,12) = Ufilt(j,2);
        end
        if m17(i,13) == Ufilt(j,1)
            m17(i,14) = Ufilt(j,2);
        end
        if m17(i,15) == Ufilt(j,1)
            m17(i,16) = Ufilt(j,2);
        end
        if m17(i,17) == Ufilt(j,1)
            m17(i,18) = Ufilt(j,2);
        end
        if m17(i,19) == Ufilt(j,1)
            m17(i,20) = Ufilt(j,2);
        end
        if m17(i,21) == Ufilt(j,1)
            m17(i,22) = Ufilt(j,2);
        end
        if m17(i,23) == Ufilt(j,1)
            m17(i,24) = Ufilt(j,2);
        end
        if m17(i,25) == Ufilt(j,1)
            m17(i,26) = Ufilt(j,2);
        end
        if m17(i,27) == Ufilt(j,1)
            m17(i,28) = Ufilt(j,2);
        end
        if m17(i,29) == Ufilt(j,1)
            m17(i,30) = Ufilt(j,2);
        end
        if m17(i,31) == Ufilt(j,1)
            m17(i,32) = Ufilt(j,2);
        end
        if m17(i,33) == Ufilt(j,1)
            m17(i,34) = Ufilt(j,2);
        end
    end
end
tam = size(m17);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m17];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,18) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),18);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 36), onde os doze pares de cada linha são a combinação de pontos
m18 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1))),m1(:,9),zeros(size(m1(:,1))),m1(:,10),zeros(size(m1(:,1))),m1(:,11),zeros(size(m1(:,1))),m1(:,12),zeros(size(m1(:,1))),m1(:,13),zeros(size(m1(:,1))),m1(:,14),zeros(size(m1(:,1))),m1(:,15),zeros(size(m1(:,1))),m1(:,16),zeros(size(m1(:,1))),m1(:,17),zeros(size(m1(:,1))),m1(:,18),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m18(i,1) == Ufilt(j,1)
            m18(i,2) = Ufilt(j,2);
        end
        if m18(i,3) == Ufilt(j,1)
            m18(i,4) = Ufilt(j,2);
        end
        if m18(i,5) == Ufilt(j,1)
            m18(i,6) = Ufilt(j,2);
        end
        if m18(i,7) == Ufilt(j,1)
            m18(i,8) = Ufilt(j,2);
        end
        if m18(i,9) == Ufilt(j,1)
            m18(i,10) = Ufilt(j,2);
        end
        if m18(i,11) == Ufilt(j,1)
            m18(i,12) = Ufilt(j,2);
        end
        if m18(i,13) == Ufilt(j,1)
            m18(i,14) = Ufilt(j,2);
        end
        if m18(i,15) == Ufilt(j,1)
            m18(i,16) = Ufilt(j,2);
        end
        if m18(i,17) == Ufilt(j,1)
            m18(i,18) = Ufilt(j,2);
        end
        if m18(i,19) == Ufilt(j,1)
            m18(i,20) = Ufilt(j,2);
        end
        if m18(i,21) == Ufilt(j,1)
            m18(i,22) = Ufilt(j,2);
        end
        if m18(i,23) == Ufilt(j,1)
            m18(i,24) = Ufilt(j,2);
        end
        if m18(i,25) == Ufilt(j,1)
            m18(i,26) = Ufilt(j,2);
        end
        if m18(i,27) == Ufilt(j,1)
            m18(i,28) = Ufilt(j,2);
        end
        if m18(i,29) == Ufilt(j,1)
            m18(i,30) = Ufilt(j,2);
        end
        if m18(i,31) == Ufilt(j,1)
            m18(i,32) = Ufilt(j,2);
        end
        if m18(i,33) == Ufilt(j,1)
            m18(i,34) = Ufilt(j,2);
        end
        if m18(i,35) == Ufilt(j,1)
            m18(i,36) = Ufilt(j,2);
        end
    end
end
tam = size(m18);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m18];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,19) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),19);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 38), onde os doze pares de cada linha são a combinação de pontos
m19 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1))),m1(:,9),zeros(size(m1(:,1))),m1(:,10),zeros(size(m1(:,1))),m1(:,11),zeros(size(m1(:,1))),m1(:,12),zeros(size(m1(:,1))),m1(:,13),zeros(size(m1(:,1))),m1(:,14),zeros(size(m1(:,1))),m1(:,15),zeros(size(m1(:,1))),m1(:,16),zeros(size(m1(:,1))),m1(:,17),zeros(size(m1(:,1))),m1(:,18),zeros(size(m1(:,1))),m1(:,19),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m19(i,1) == Ufilt(j,1)
            m19(i,2) = Ufilt(j,2);
        end
        if m19(i,3) == Ufilt(j,1)
            m19(i,4) = Ufilt(j,2);
        end
        if m19(i,5) == Ufilt(j,1)
            m19(i,6) = Ufilt(j,2);
        end
        if m19(i,7) == Ufilt(j,1)
            m19(i,8) = Ufilt(j,2);
        end
        if m19(i,9) == Ufilt(j,1)
            m19(i,10) = Ufilt(j,2);
        end
        if m19(i,11) == Ufilt(j,1)
            m19(i,12) = Ufilt(j,2);
        end
        if m19(i,13) == Ufilt(j,1)
            m19(i,14) = Ufilt(j,2);
        end
        if m19(i,15) == Ufilt(j,1)
            m19(i,16) = Ufilt(j,2);
        end
        if m19(i,17) == Ufilt(j,1)
            m19(i,18) = Ufilt(j,2);
        end
        if m19(i,19) == Ufilt(j,1)
            m19(i,20) = Ufilt(j,2);
        end
        if m19(i,21) == Ufilt(j,1)
            m19(i,22) = Ufilt(j,2);
        end
        if m19(i,23) == Ufilt(j,1)
            m19(i,24) = Ufilt(j,2);
        end
        if m19(i,25) == Ufilt(j,1)
            m19(i,26) = Ufilt(j,2);
        end
        if m19(i,27) == Ufilt(j,1)
            m19(i,28) = Ufilt(j,2);
        end
        if m19(i,29) == Ufilt(j,1)
            m19(i,30) = Ufilt(j,2);
        end
        if m19(i,31) == Ufilt(j,1)
            m19(i,32) = Ufilt(j,2);
        end
        if m19(i,33) == Ufilt(j,1)
            m19(i,34) = Ufilt(j,2);
        end
        if m19(i,35) == Ufilt(j,1)
            m19(i,36) = Ufilt(j,2);
        end
        if m19(i,37) == Ufilt(j,1)
            m19(i,38) = Ufilt(j,2);
        end
    end
end
tam = size(m19);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m19];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,20) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),20);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 40), onde os doze pares de cada linha são a combinação de pontos
m20 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1))),m1(:,9),zeros(size(m1(:,1))),m1(:,10),zeros(size(m1(:,1))),m1(:,11),zeros(size(m1(:,1))),m1(:,12),zeros(size(m1(:,1))),m1(:,13),zeros(size(m1(:,1))),m1(:,14),zeros(size(m1(:,1))),m1(:,15),zeros(size(m1(:,1))),m1(:,16),zeros(size(m1(:,1))),m1(:,17),zeros(size(m1(:,1))),m1(:,18),zeros(size(m1(:,1))),m1(:,19),zeros(size(m1(:,1))),m1(:,20),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m20(i,1) == Ufilt(j,1)
            m20(i,2) = Ufilt(j,2);
        end
        if m20(i,3) == Ufilt(j,1)
            m20(i,4) = Ufilt(j,2);
        end
        if m20(i,5) == Ufilt(j,1)
            m20(i,6) = Ufilt(j,2);
        end
        if m20(i,7) == Ufilt(j,1)
            m20(i,8) = Ufilt(j,2);
        end
        if m20(i,9) == Ufilt(j,1)
            m20(i,10) = Ufilt(j,2);
        end
        if m20(i,11) == Ufilt(j,1)
            m20(i,12) = Ufilt(j,2);
        end
        if m20(i,13) == Ufilt(j,1)
            m20(i,14) = Ufilt(j,2);
        end
        if m20(i,15) == Ufilt(j,1)
            m20(i,16) = Ufilt(j,2);
        end
        if m20(i,17) == Ufilt(j,1)
            m20(i,18) = Ufilt(j,2);
        end
        if m20(i,19) == Ufilt(j,1)
            m20(i,20) = Ufilt(j,2);
        end
        if m20(i,21) == Ufilt(j,1)
            m20(i,22) = Ufilt(j,2);
        end
        if m20(i,23) == Ufilt(j,1)
            m20(i,24) = Ufilt(j,2);
        end
        if m20(i,25) == Ufilt(j,1)
            m20(i,26) = Ufilt(j,2);
        end
        if m20(i,27) == Ufilt(j,1)
            m20(i,28) = Ufilt(j,2);
        end
        if m20(i,29) == Ufilt(j,1)
            m20(i,30) = Ufilt(j,2);
        end
        if m20(i,31) == Ufilt(j,1)
            m20(i,32) = Ufilt(j,2);
        end
        if m20(i,33) == Ufilt(j,1)
            m20(i,34) = Ufilt(j,2);
        end
        if m20(i,35) == Ufilt(j,1)
            m20(i,36) = Ufilt(j,2);
        end
        if m20(i,37) == Ufilt(j,1)
            m20(i,38) = Ufilt(j,2);
        end
        if m20(i,39) == Ufilt(j,1)
            m20(i,40) = Ufilt(j,2);
        end
    end
end
tam = size(m20);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m20];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,21) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),21);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 42), onde os doze pares de cada linha são a combinação de pontos
m21 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1))),m1(:,9),zeros(size(m1(:,1))),m1(:,10),zeros(size(m1(:,1))),m1(:,11),zeros(size(m1(:,1))),m1(:,12),zeros(size(m1(:,1))),m1(:,13),zeros(size(m1(:,1))),m1(:,14),zeros(size(m1(:,1))),m1(:,15),zeros(size(m1(:,1))),m1(:,16),zeros(size(m1(:,1))),m1(:,17),zeros(size(m1(:,1))),m1(:,18),zeros(size(m1(:,1))),m1(:,19),zeros(size(m1(:,1))),m1(:,20),zeros(size(m1(:,1))),m1(:,21),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m21(i,1) == Ufilt(j,1)
            m21(i,2) = Ufilt(j,2);
        end
        if m21(i,3) == Ufilt(j,1)
            m21(i,4) = Ufilt(j,2);
        end
        if m21(i,5) == Ufilt(j,1)
            m21(i,6) = Ufilt(j,2);
        end
        if m21(i,7) == Ufilt(j,1)
            m21(i,8) = Ufilt(j,2);
        end
        if m21(i,9) == Ufilt(j,1)
            m21(i,10) = Ufilt(j,2);
        end
        if m21(i,11) == Ufilt(j,1)
            m21(i,12) = Ufilt(j,2);
        end
        if m21(i,13) == Ufilt(j,1)
            m21(i,14) = Ufilt(j,2);
        end
        if m21(i,15) == Ufilt(j,1)
            m21(i,16) = Ufilt(j,2);
        end
        if m21(i,17) == Ufilt(j,1)
            m21(i,18) = Ufilt(j,2);
        end
        if m21(i,19) == Ufilt(j,1)
            m21(i,20) = Ufilt(j,2);
        end
        if m21(i,21) == Ufilt(j,1)
            m21(i,22) = Ufilt(j,2);
        end
        if m21(i,23) == Ufilt(j,1)
            m21(i,24) = Ufilt(j,2);
        end
        if m21(i,25) == Ufilt(j,1)
            m21(i,26) = Ufilt(j,2);
        end
        if m21(i,27) == Ufilt(j,1)
            m21(i,28) = Ufilt(j,2);
        end
        if m21(i,29) == Ufilt(j,1)
            m21(i,30) = Ufilt(j,2);
        end
        if m21(i,31) == Ufilt(j,1)
            m21(i,32) = Ufilt(j,2);
        end
        if m21(i,33) == Ufilt(j,1)
            m21(i,34) = Ufilt(j,2);
        end
        if m21(i,35) == Ufilt(j,1)
            m21(i,36) = Ufilt(j,2);
        end
        if m21(i,37) == Ufilt(j,1)
            m21(i,38) = Ufilt(j,2);
        end
        if m21(i,39) == Ufilt(j,1)
            m21(i,40) = Ufilt(j,2);
        end
        if m21(i,41) == Ufilt(j,1)
            m21(i,42) = Ufilt(j,2);
        end
    end
end
tam = size(m21);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m21];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end

% constrói uma matriz (n,22) onde n são as possíveis combinações de pontos,
% porém  utilizando apenas a primeira coordenada do ponto
m1 = nchoosek(Ufilt(:,1),22);

% adicionando a segunda coordenada do ponto, de maneira que fique uma
% matriz (n, 44), onde os doze pares de cada linha são a combinação de pontos
m22 = [m1(:,1),zeros(size(m1(:,1))),m1(:,2),zeros(size(m1(:,1))),m1(:,3),zeros(size(m1(:,1))),m1(:,4),zeros(size(m1(:,1))),m1(:,5),zeros(size(m1(:,1))),m1(:,6),zeros(size(m1(:,1))),m1(:,7),zeros(size(m1(:,1))),m1(:,8),zeros(size(m1(:,1))),m1(:,9),zeros(size(m1(:,1))),m1(:,10),zeros(size(m1(:,1))),m1(:,11),zeros(size(m1(:,1))),m1(:,12),zeros(size(m1(:,1))),m1(:,13),zeros(size(m1(:,1))),m1(:,14),zeros(size(m1(:,1))),m1(:,15),zeros(size(m1(:,1))),m1(:,16),zeros(size(m1(:,1))),m1(:,17),zeros(size(m1(:,1))),m1(:,18),zeros(size(m1(:,1))),m1(:,19),zeros(size(m1(:,1))),m1(:,20),zeros(size(m1(:,1))),m1(:,21),zeros(size(m1(:,1))),m1(:,22),zeros(size(m1(:,1)))];

for i=1:size(m1)
    for j=1:size(Ufilt)
        if m22(i,1) == Ufilt(j,1)
            m22(i,2) = Ufilt(j,2);
        end
        if m22(i,3) == Ufilt(j,1)
            m22(i,4) = Ufilt(j,2);
        end
        if m22(i,5) == Ufilt(j,1)
            m22(i,6) = Ufilt(j,2);
        end
        if m22(i,7) == Ufilt(j,1)
            m22(i,8) = Ufilt(j,2);
        end
        if m22(i,9) == Ufilt(j,1)
            m22(i,10) = Ufilt(j,2);
        end
        if m22(i,11) == Ufilt(j,1)
            m22(i,12) = Ufilt(j,2);
        end
        if m22(i,13) == Ufilt(j,1)
            m22(i,14) = Ufilt(j,2);
        end
        if m22(i,15) == Ufilt(j,1)
            m22(i,16) = Ufilt(j,2);
        end
        if m22(i,17) == Ufilt(j,1)
            m22(i,18) = Ufilt(j,2);
        end
        if m22(i,19) == Ufilt(j,1)
            m22(i,20) = Ufilt(j,2);
        end
        if m22(i,21) == Ufilt(j,1)
            m22(i,22) = Ufilt(j,2);
        end
        if m22(i,23) == Ufilt(j,1)
            m22(i,24) = Ufilt(j,2);
        end
        if m22(i,25) == Ufilt(j,1)
            m22(i,26) = Ufilt(j,2);
        end
        if m22(i,27) == Ufilt(j,1)
            m22(i,28) = Ufilt(j,2);
        end
        if m22(i,29) == Ufilt(j,1)
            m22(i,30) = Ufilt(j,2);
        end
        if m22(i,31) == Ufilt(j,1)
            m22(i,32) = Ufilt(j,2);
        end
        if m22(i,33) == Ufilt(j,1)
            m22(i,34) = Ufilt(j,2);
        end
        if m22(i,35) == Ufilt(j,1)
            m22(i,36) = Ufilt(j,2);
        end
        if m22(i,37) == Ufilt(j,1)
            m22(i,38) = Ufilt(j,2);
        end
        if m22(i,39) == Ufilt(j,1)
            m22(i,40) = Ufilt(j,2);
        end
        if m22(i,41) == Ufilt(j,1)
            m22(i,42) = Ufilt(j,2);
        end
        if m22(i,43) == Ufilt(j,1)
            m22(i,44) = Ufilt(j,2);
        end
    end
end
tam = size(m22);
tam = tam(1);
if tam > 0
    Brute_Force = [Brute_Force ; m22];
    t = size(Brute_Force);
    t = t(1);
    Brute_Force = [Brute_Force zeros(t,2)];
end