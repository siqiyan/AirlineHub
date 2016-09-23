% This function create a set variable, which can be used to do component
% checking for graphs.
%
% Parameters:
%   G: a graph
%
function set = createset(G)
    n = height(G.Nodes);
    set = struct('parent', [], 'rank', []);
    for i = 1 : n,
        set.parent(i) = i;
        set.rank(i) = 0;
    end
end
