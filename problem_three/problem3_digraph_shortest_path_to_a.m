s = [1  1  1  1  2  2  2  2  3  3  3  3  3  4  4  4  4  5  5  5  6  6  7  7  7  8  8  9  9  9  9  10  10  10  11  11 12];
t = [2  3  4  8  1  3  5  6  4  2  7  9  6  1  7 10  6  8  3  9  9  7  4 10 11  9 11 11 10 13  9  11  12  8    8  13 13];
weights = [2 3 8 9 4 5 7 4 10 5 9 11 4 8 2 5 1 5 4 10 2 2 2 8 12 5 10 20 6 2 12 2 4 5 10 10 2];
names = {'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm'};
G = digraph(s,t,weights,names);
plot(G, 'Layout', 'force', 'EdgeLabel', G.Edges.Weight);
for a = [2 3 4 5 6 7 8 9 10 11 12 13]
    [path, d] = shortestpath(G, 1, a);
    fprintf('a to %s: %d\n', names{a}, d);
end