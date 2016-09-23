% This function add the edge [v1, v2] into the graph H, while do not creating a
% loop.
% Parameters:
%   H: the objective graph
%   set: the union-find set of graph H
%   v1, v2: vertices
%   weight: the weight of the edge [v1, v2]
function [H set] = add_no_loop(H, set, v1, v2, weight)
    rep1 = findrep(set, v1);
    rep2 = findrep(set, v2);
    if rep1 ~= rep2,                        % check if the hub and the neighbour are in the same component
        disp(sprintf('\tadded edge: %d - %d', v1, v2));
        set = union_vert(set, v1, v2);   % not, union them so they are now in the same component
        H = addedge(H, v1, v2, weight); % and add the edge [hub, neighbour] into H
    end
end
