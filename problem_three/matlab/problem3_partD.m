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

%% SHORTEST PATH FROM OTHER VERTICES TO I
% Going from other vertices to I is equivalent to reversing the edge
% directions and going from I to other vertcies.

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

% Single equality constraint -- distance to i must be zero, since we start
% at i
Aeq = zeros(3, numberOfNodes);
startNode = double('i') - double('a') + 1;
nodeL = double('l') - double('a') + 1;
nodeM = double('m') - double('a') + 1;
Aeq(1, startNode) = 1;
Aeq(2, nodeL) = 1;
Aeq(3, nodeM) = 1;
beq = [0; 99999; 99999];

% Minimization constriant is to maximimize negative sum of distances
f = -ones(numberOfNodes, 1);

[x, fval, exitflag] = linprog(f,A,b,Aeq,beq);

fprintf('----- P3.C SOLUTION -----\n')
for j = 1:numel(x)
    fprintf('Distance from %c to i = %2.0f \n', char('a'+ j - 1), x(j))
end

distanceToNodeI = x;

%% SHORTEST PATH FROM I TO OTHER VERTICES

% Number of nodes is highest numbered node in our data
numberOfNodes = max([edgeStart, edgeEnd]);

% Build A and b matrices from edgeEnd and edgeStart
% Size of A is number of inequalities by number of nodes
A = zeros(numel(edgeWeight), numberOfNodes);

for j = 1:numel(edgeWeight)
    A(j, edgeStart(j)) = -1;
    A(j, edgeEnd(j)) = 1;
end

b = edgeWeight';

% Additional constriant that all distances must be greater than 0
A = [A; -eye(numberOfNodes)];

b = [b; zeros(numberOfNodes, 1)];

% Single equality constraint -- distance to i must be zero, since we start
% at i
% Aeq = zeros(3, numberOfNodes);
Aeq = zeros(1, numberOfNodes);
startNode = double('i') - double('a') + 1;
% nodeL = double('l') - double('a') + 1;
% nodeM = double('m') - double('a') + 1;
Aeq(1, startNode) = 1;
% Aeq(2, nodeL) = 1;
% Aeq(3, nodeM) = 1;
% beq = [0; 99999; 99999];
beq = 0;

% Minimization constriant is to maximimize negative sum of distances
f = -ones(numberOfNodes, 1);

[x, fval, exitflag] = linprog(f,A,b,Aeq,beq);

fprintf('----- P3.C SOLUTION -----\n')
for j = 1:numel(x)
    fprintf('Distance from i to %c = %2.0f \n', char('a'+ j - 1), x(j))
end

distanceFromNodeI = x;

%% COMBINE THE RESULTS:
for i = 1:numberOfNodes
    for j = 1:numberOfNodes
        distFromTo(i,j) = distanceToNodeI(i) + distanceFromNodeI(j);
        if distFromTo(i,j) > 999
            distFromTo(i,j) = NaN;
        end
    end
end

fid = fopen('P3D_solution.txt','w');
fprintf(fid, '----- P3.D SOLUTION -----\n');
for i = 1:numberOfNodes
    for j = 1:numberOfNodes
        fprintf(fid, 'Distance from %c to %c through i = %2.0f \n', ...
            char('a' + i - 1), char('a'+ j - 1), distFromTo(i,j));
    end
end

fclose(fid);

    