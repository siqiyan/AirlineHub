clear

n = 100;         % number of vertices of the random graph

A = rand(n) * 200;
A = A + A';
A = A - A .* eye(n);
assert(Gisconnected(graph(A .* (A <= 200))));
G = graph(A);

figure, plot(G, 'layout', 'circle'), title('Original graph');

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

figure, plot(H1, 'layout', 'circle'), title('Algorithm1'), xlabel(sprintf('hubs = %d', h1));
figure, plot(H2, 'layout', 'circle'), title('Algorithm2: degree'), xlabel(sprintf('hubs = %d', h2));
figure, plot(H3, 'layout', 'circle'), title('Algorithm3: cake'), xlabel(sprintf('hubs = %d', h3));
