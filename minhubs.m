% This function compute a subgraph H of a given graph G, such that:
%   1. H is connected;
%   2. All edges have weight less than or equal to 200;
%   3. The number of hubs is minimized (hopefully).
% This function works as follows: for each vertex v, it computes the number of
% "vacancies" it can connects to, and then take the vertex with max number of
% vacancies, and connect all its neighbours, while do not creating loop. Then
% recalculates the "vacancies" for the remaining vertices, do this until the
% graph is connected.
%
% Parameters:
%   mG: the adjacent matrix of graph G
%
function [H num_of_hubs] = minhubs(mG)
    % Initialization
    mG = mG .* (mG <= 200);                 % remove edges greater than 200
    G = graph(mG);                          % construct a graph G
    n = height(G.Nodes);                    % n = number of vertices in G
    H = graph(zeros(size(mG)));             % construct a graph H with no edges
    set = createset(G);                     % used to check if two vertices are in the same component

    vertlist = [1 : n];                     % from a list of all vertices
    while length(vertlist) > 0,

        % calculate how many "vacancies" each vertex can connects to
        count = zeros(1, length(vertlist));
        for i = 1 : length(vertlist),
            v = vertlist(i);
            neighbours = find((mG(v, :) ~= 0) .* [1 : n]);
            for j = 1 : length(neighbours),
                neighbour = neighbours(j);
                if findrep(set, v) ~= findrep(set, neighbour),
                    count(i) = count(i) + 1;
                end
            end
        end

        [discard hub] = max(count);         % choose the one with the max "vacancies"
        hub = vertlist(hub);

        % add all its neighbours while do not creating loop
        neighbours = find((mG(hub, :) ~= 0) .* [1 : n]);
        for i = 1 : length(neighbours),
            neighbour = neighbours(i);
            [H set] = add_no_loop(H, set, hub, neighbour, mG(hub, neighbour));
        end

        vertlist(vertlist == hub) = [];     % delete the hub from vertlist
        
        if isconnected(set),
            break
        end
    end
    num_of_hubs = sum(degree(H) >= 2);
    disp(sprintf('exit: number of hubs = %d', num_of_hubs));
end
