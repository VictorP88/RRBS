function MM = MaxMatch(a)
v=size(a,1);
n=size(a,2);
c=zeros(n,5);
m=zeros(v,n);
g=zeros(1,v);
h=zeros(1,n);
hh=zeros(1,n);
cp=0;
for i=1:v
    for j=1:n
        if (a(i,j)~=0)
            m(i,j)=1;
            break;
        end;
    end
    if (m(i,j)~=0)
        break;
    end
end
while (v>0)
    g=zeros(1,v);
    h=zeros(1,n);
    for i=1:v
        cd=1;
        for j=1:n
            if (m(i,j)~=0)
                cd=0;
                break;
            end
        end
        if (cd~=0)
            g(i)=-n-1;
        end
    end
    cd=0;
    while (v>0)
        gi=0;
        for i=1:v
            if (g(i)<0)
                gi=i;
                break;
            end;
        end
        if(gi==0)
            cd=1;
            break;
        end,g(gi)=-g(gi);
        k=1;
        for j=1:n
            if ((a(gi,j)~=0) & (h(j)==0))
                h(j)=gi;
                hh(k)=j;
                k=k+1;
            end
        end
        if (k>1)
            k=k-1;
            for j=1:k
                cp=1;
                for i=1:v
                    if (m(i,hh(j))~=0)
                        g(i)=-hh(j);
                        cp=0;
                        break
                    end
                end
                if (cp~=0)
                    break
                end
            end
            if (cp~=0)
                k=1;
                j=hh(j);
                while (v>0)
                    c(k,2)=j;
                    c(k,1)=h(j);
                    j=abs(g(h(j)));
                    if (j==(n+1))
                        break
                    end
                    k=k+1;
                end
                for i=1:k
                    if (m(c(i,1),c(i,2))~=0)
                        m(c(i,1),c(i,2))=0;
                    else m(c(i,1),c(i,2))=1
                    end
                end
                break
            end
        end
    end
    if (cd~=0)
        break
    end
end
fprintf(['Maximum matching:' '\n']);
m
MM = m;
end