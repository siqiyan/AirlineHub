% I learned this algorithm from CMPUT204. This function find the
% prepresentative of a given vertex in the given set. Vertices in a same
% component will have the same representative, so it can be used to check if
% two vertices are in the same component.
%
% Parameters:
%   set: a set variable created by createset() function
%   vertex: a vertex or integer
%
function rep = findrep(set, vertex)
    if set.parent(vertex) == vertex,
        rep = vertex;
    else,
        rep = findrep(set, set.parent(vertex));
    end
end
