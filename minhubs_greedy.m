% This function compute a subgraph H of a given graph G, such that:
%   1. H is connected;
%   2. All edges have weight less than or equal to 200;
%   3. The number of hubs is minimized (hopefully).
% And this is done by greedy algorithm, which generate a list of either degrees
% of vertices or "cakes" of vertices (determined by the second parameter). The
% function will then add edges to the graph H in the order of the list while do
% not greating loops. So after a certain number of iterations (less than the
% length of the list), the graph H will be connected and then we are done.
%
% Parameters:
%   mG: the adjacent matrix of graph G
%   option: only two options are available: 'degree' and 'cake', the last one
%       is faster.
%
function [H num_of_hubs] = minhubs_greedy(mG, option)
    % Initialization
    mG = mG .* (mG <= 200);                 % remove edges greater than 200
    G = graph(mG);                          % construct a graph G
    n = height(G.Nodes);                    % n = number of vertices in G
    H = graph(zeros(size(mG)));             % construct a graph H with no edges
    set = createset(G);                     % used to check if two vertices are in the same component

    hublist = get_hublist(G, mG, option);   % generate a list used by the greedy algorithm, based on option
    for i = 1 : length(hublist),
        hub = hublist(i);                           % a hub is chosen based on the order of the hublist
        disp(sprintf('iter = %d, hub = %d', i, hub));
        neighbours = find((mG(hub, :) ~= 0) .* [1 : n]);   % get a list of the hub's neighbours
        for j = 1 : length(neighbours),
            neighbour = neighbours(j);              % try to add one of the neighbour
            [H set] = add_no_loop(H, set, hub, neighbour, mG(hub, neighbour));
        end
        if isconnected(set),          % we don't need to go over all the hublist, if the graph is connected, we are done
            break;
        end
    end
    num_of_hubs = sum(degree(H) >= 2);
    disp(sprintf('exit: number of hubs = %d', num_of_hubs));
end
