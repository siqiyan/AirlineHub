% This function check if the graph represent by set is connected, and return a
% boolean value.
%
% Parameters:
%   set: a set variable which is create by function createset(), used to do the
%   component checking for graphs
%
function ans = isconnected(set)
    count = 0;
    for i = 1 : length(set.parent),
        if set.parent(i) == i,
            count = count + 1;
        end
    end
    ans = (count == 1);
end
