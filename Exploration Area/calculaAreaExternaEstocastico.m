function area = calculaAreaExternaEstocastico(u,RRBS)

%menor quadrado
r = RRBS.raio;
xmin = min(u(:,1)-2*r);
xmax = max(u(:,1)+2*r);
ymin = min(u(:,2)-2*r);
ymax = max(u(:,2)+2*r);

rectangle('Position',[xmin ymin xmax-xmin ymax-ymin]);

for zzz = [1000]
    
    X = linspace(xmin,xmax,zzz);
    Y = linspace(ymin,ymax,zzz);
    
    
    posicoes = ones(numel(X),numel(Y));
    
    for i=1:numel(X)
        for j =1:numel(Y)
            for k = 1:size(u,1)
                if (X(i)-u(k,1))^2+(Y(j)-u(k,2))^2 > (2*r)^2
                    posicoes(i,j) = 0;
                    break
                end
            end
        end
    end
    
    XY = zeros(sum(sum(posicoes)),2);
    k=1;
    for i=1:numel(X)
        for j =1:numel(Y)
            if posicoes(i,j)==1;
                XY(k,:) = [X(i) Y(j)];
                k=k+1;
            end
        end
    end
    
    
    hold on
    plot(XY(:,1),XY(:,2),'.')
    
    area = sum(sum(posicoes))/numel(posicoes)*(xmax-xmin)*(ymax-ymin)
    
end

newRRBS.raio = 2*r;
for i=1:size(u,1)
    newRRBS.posicao = u(i,:);
    desenhaRRBS(newRRBS)    ;
end


end