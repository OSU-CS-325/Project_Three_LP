clear variables
close all
clc

%% PARSE INPUT DATA
% Open file
fid = fopen('p3_input.txt');

% Read line while there is data remaining
tline = fgets(fid);
rowIdx = 0;
while ischar(tline)
    % Increment row counter to store data
    rowIdx = rowIdx + 1;
    
    % fgetl reads line in as char array -- split on spaces
    C = strsplit(tline, ' ');
    
    % Convert node letter to index using ASCII codes (a = 1, b = 2, ...)
    edgeStart(rowIdx) = double(C{1}) - double('a') + 1;
    edgeEnd(rowIdx) = double(C{2}) - double('a') + 1;
    edgeWeight(rowIdx) = str2num(C{3});  
    % Grab the next line
    tline = fgetl(fid);
end

fclose(fid);

%% SHORTEST PATH FROM OTHER VERTICES TO M
% Going from other vertices to M is equivalent to reversing the edge
% directions and going from M to other vertcies.

% Number of nodes is highest numbered node in our data
numberOfNodes = max([edgeStart, edgeEnd]);

% Build A and b matrices from edgeEnd and edgeStart
% Size of A is number of inequalities by number of nodes
A = zeros(numel(edgeWeight), numberOfNodes);

% Since we're reversing the direction of the edges, we'll swap the +1 and
% -1 values to capture that.
for j = 1:numel(edgeWeight)
    A(j, edgeStart(j)) = 1;
    A(j, edgeEnd(j)) = -1;
end

b = edgeWeight';

% Additional constriant that all distances must be greater than 0
A = [A; -eye(numberOfNodes)];

b = [b; zeros(numberOfNodes, 1)];

% Single equality constraint -- distance to m must be zero, since we start
% at m
Aeq = zeros(1, numberOfNodes);
startNode = double('m') - double('a') + 1;
Aeq(1, startNode) = 1;
beq = 0;

% Minimization constriant is to maximimize negative sum of distances
f = -ones(numberOfNodes, 1);

[x, fval, exitflag] = linprog(f,A,b,Aeq,beq);

fprintf('----- P3.C SOLUTION -----\n')
for j = 1:numel(x)
    fprintf('Distance from %c to m = %2.0f \n', char('a'+ j - 1), x(j))
end

