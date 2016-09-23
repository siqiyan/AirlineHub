% This function is called in minhubs() function. It generates a list based on
% the following options:
% 1. 'degree':
%   Generates a list of degrees of vertices in G, and sort them in decreasing
%   order.
% 2. 'cake':
%   This option works as follows: assuming the graph G represents a socal
%   network, and each vertex is a person, whose friends are those who connected
%   to him/her. Each person has a cake of same size, and everyone will splite
%   their cake and give them equaliy to their friends, while also receive cakes
%   from their friends. In the end, a list is computed based on how many cakes
%   each person get, and the person who received the most number of cakes will
%   be the first in the list, and vice versa.
%
% Parameters:
%   G: a graph G
%   mG: the adjacent matrix of G
%   option: either 'degree' or 'cake', the last one results a faster computation
%       in function minhubs()
%
function hublist = get_hublist(G, mG, option)
    deg = degree(G);
    if strcmp(option, 'degree'),
        [discard hublist] = sort(deg, 'descend');
    else if strcmp(option, 'cake'),
        cake = bsxfun(@times, mG ~= 0, 1./deg); % calculate the distrubution of cakes along the edges
        cake = sum(cake)';                      % calculate the sum of cakes each vertex got
        [discard hublist] = sort(cake, 'descend');      % sort the index of cake into hublist
    end
end
