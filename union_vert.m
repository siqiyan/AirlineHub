% I learned this algorithm from CMPUT204. This algorithm do the union operation
% for graph that containing more than one component. Its mainly used for
% checking if two vertices are in the same component.
%
% Parameters:
%   set: a set variable created by createset() function
%   v1, v2: vertices, or integers
%
function set = union_vert(set, v1, v2)
    rep1 = findrep(set, v1);
    rep2 = findrep(set, v2);
    if rep1 ~= rep2,
        if set.rank(rep1) < set.rank(rep2),
            set.parent(rep1) = rep2;
        else,
            set.parent(rep2) = rep1;
            if set.rank(rep1) == set.rank(rep2),
                set.rank(rep1) = set.rank(rep1) + 1;
            end
        end
    end
end
