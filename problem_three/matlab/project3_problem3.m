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

%% PART A: SHORTEST PATH FROM A TO OTHER VERTICES

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

% Single equality constraint -- distance to a must be zero, since we start at a
Aeq = zeros(1, numberOfNodes);
Aeq(1, 1) = 1;
beq = 0;

% Minimization constriant is to minimize sum of all node distances
f = -ones(numberOfNodes, 1); % this is the part I don't quite understand yet...

[x, fval, exitflag] = linprog(f,A,b,Aeq,beq);

for j = 1:numel(x)
    fprintf('Distance to %c = %2.0f \n', char('a'+ j - 1), x(j))
end