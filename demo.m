clear

A = [0 102 381 232 272 494 294 170 134; ...
     0 0 279 133 175 395 235 72 91; ...
     0 0 0 159 134 143 273 215 298; ...
     0 0 0 0 115 262 255 94 139; ...
     0 0 0 0 0 275 156 103 229; ...
     0 0 0 0 0 0 416 341 387; ...
     0 0 0 0 0 0 0 186 320; ...
     0 0 0 0 0 0 0 0 139; ...
     0 0 0 0 0 0 0 0 0];


nLabels = {'D' 'F' 'GB' 'GR' 'K' 'M' 'P' 'SB' 'T'};
A = A + A';
assert(Gisconnected(graph(A .* (A <= 200))));
G = graph(A);

disp(sprintf('The adjacent matrix of cities:'));
disp(A);
figure, plot(G, 'layout', 'circle', 'NodeLabel', nLabels), title('Original graph');

disp(sprintf('************************************'));
disp(sprintf('Algorithm1:'));
[H1 h1] = minhubs(A);
disp(sprintf('************************************'));
disp(sprintf('Algorithm2: degree'));
[H2 h2] = minhubs_greedy(A, 'degree');
disp(sprintf('************************************'));
disp(sprintf('Algorithm3: cake'));
[H3 h3] = minhubs_greedy(A, 'cake');
disp(sprintf('************************************'));

figure, plot(H1, 'layout', 'circle', 'NodeLabel', nLabels), title('Algorithm1'), xlabel(sprintf('hubs = %d', h1));
figure, plot(H2, 'layout', 'circle', 'NodeLabel', nLabels), title('Algorithm2: degree'), xlabel(sprintf('hubs = %d', h2));
figure, plot(H3, 'layout', 'circle', 'NodeLabel', nLabels), title('Algorithm3: cake'), xlabel(sprintf('hubs = %d', h3));
