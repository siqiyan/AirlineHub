function ans = Gisconnected(G)
    % Check if G is connected after removing the long edges:
    set = createset(G);                     % re-initialize the set
    [vlist1 vlist2] = find(adjacency(G));   % form a list of edges
    for i = 1 : length(vlist1),
        for j = 1 : length(vlist2),
            set = union_vert(set, vlist1(i), vlist2(j));
        end
    end
    ans = isconnected(set);
end
