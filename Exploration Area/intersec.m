
% given a radius and a list of centers for circles
% returns the vertices of the intersections of n circles, in O(n^3)
%
% output: vertices points
% format [ x1 y1 ; x2 y2 ; ... ; xn yn ]
%
% input c 
% centers of circles, format [ x1 y1 ; x2 y2 ; ... ; xn yn ]
% DO NOT repeat the first center at the end
%
% input r : scalar, a radius
% 
% example
% [trajvert traj_users] = intersec(UfiltCS(1:end-1,:),RRBS.raio);
function [v, centers_of_v] = intersec(c, r) 


v = [];
centers_of_v = [];
n = length(c);

for i=1:n
    for j=(i+1):n % do not need to test a->b and b->a
        % intersections between all pairs of circles
        if (i ~= j) % do not try a circle versus itself
            [auxx,auxy] = circcirc(c(i,1),c(i,2),r,c(j,1),c(j,2),r);
            v1 = [auxx(1) auxy(1)];
            v2 = [auxx(2) auxy(2)];        
            
            % check if each intersection belongs to all circles
            v1ok=true;
            v2ok=true;
            for k=1:n
                if (norm(v1-c(k,:))>r+1e-3)
                    v1ok=false;
                end
                if (norm(v2-c(k,:))>r+1e-3)
                    v2ok=false;
                end
            end%for
            if (v1ok)
                v(end+1,:) = v1 ;
                centers_of_v(end+1,:) = [ i j ];
            end
            if (v2ok)
                v(end+1,:) = v2 ;
                centers_of_v(end+1,:) = [ i j ];
            end
        end%if
    end%for
end%for

end