% ------------------------------------------------------------
% reference: array index to variable mapping
% ------------------------------------------------------------
% (1) np11
% (2) np12
% (3) np21
% (4) np22
% (5) np31
% (6) np32
% (7) np33
% (8) np42
% (9) np43
% (10) nw11
% (11) nw12
% (12) nw13
% (13) nw14
% (14) nw23
% (15) nw24
% (16) nw25
% (17) nw26
% (18) nw34
% (19) nw35
% (20) nw36
% (21) nw37
% (22) s1
% (23) s2
% (24) s3
% (25) s4
% (26) d1
% (27) d2
% (28) d3
% (29) d4
% (30) d5
% (31) d6
% (32) d7

% ------------------------------------------------------------
% lower bounds vector
%   note matlab arrays/vectors start at index 1 (not 0)
% ------------------------------------------------------------
lb = zeros(32,1);
lb(26) = 100;   % d1
lb(27) = 150;   % d2
lb(28) = 100;   % d3
lb(29) = 200;   % d4
lb(30) = 200;   % d5
lb(31) = 150;   % d6
lb(32) = 100;   % d7

% ------------------------------------------------------------
% upper bounds vector
%   note matlab arrays/vectors start at index 1 (not 0)
% ------------------------------------------------------------
ub = Inf(32,1);
ub(1)  = 150;   % np11
ub(2)  = 150;   % np12
ub(3)  = 450;   % np21
ub(4)  = 450;   % np22
ub(5)  = 250;   % np31
ub(6)  = 250;   % np32
ub(7)  = 250;   % np33
ub(8)  = 150;   % np42
ub(9)  = 150;   % np43
ub(22) = 150;   % s1
ub(23) = 450;   % s2
ub(24) = 250;   % s3
ub(25) = 150;   % s4

% ------------------------------------------------------------
% linear inequality matrix and vector
%   note matlab arrays/vectors start at index 1 (not 0)
% ------------------------------------------------------------
A = [];
b = [];

% ------------------------------------------------------------
% linear equality matrix and vector
%   note matlab arrays/vectors start at index 1 (not 0)
%   14 equations in 32 variables
% ------------------------------------------------------------
Aeq = zeros(14, 32);
beq = zeros(14, 1);
%np11 + np21 + np31        = nw11 + nw12 + nw13 + nw14
%np11 + np21 + np31 - nw11 - nw12 - nw13 - nw14 = 0
Aeq(1,[1,3,5,10,11,12,13]) = [1,1,1,-1,-1,-1,-1];
%np12 + np22 + np32 + np42 =               nw23 + nw24 + nw25 + nw26
%np12 + np22 + np32 + np42 - nw23 - nw24 - nw25 - nw26 = 0
Aeq(2,[2,4,6,8,14,15,16,17]) = [1,1,1,1,-1,-1,-1,-1];
%              np33 + np43 =                      nw34 + nw35 + nw36 + nw37
%np33 + np43 - nw34 - nw35 - nw36 - nw37 = 0
Aeq(3,[7,9,18,19,20,21]) = [1,1,-1,-1,-1,-1];
%s1 = np11 + np12
%s1 - np11 - np12 = 0
Aeq(4,[22,1,2]) = [1,-1,-1];
%s2 = np21 + np22
%s2 - np21 - np22 = 0
Aeq(5,[23,3,4]) = [1,-1,-1];
%s3 = np31 + np32 + np33
%s3 - np31 - np32 - np33 = 0
Aeq(6,[24,5,6,7]) = [1,-1,-1,-1];
%s4 =        np42 + np43
%s4 - np42 - np43 = 0
Aeq(7,[25,8,9]) = [1,-1,-1];
%d1 = nw11
%d1 - nw11 = 0
Aeq(8,[26,10]) = [1,-1];
%d2 = nw12
%d2 - nw12 = 0
Aeq(9,[27,11]) = [1,-1];
%d3 = nw13 + nw23
%d3 - nw13 - nw23 = 0
Aeq(10,[28,12,14]) = [1,-1,-1];
%d4 = nw14 + nw24 + nw34
%d4 - nw14 - nw24 - nw34 = 0
Aeq(11,[29,13,15,18]) = [1,-1,-1,-1];
%d5 =        nw25 + nw35
%d5 - nw25 - nw35 = 0
Aeq(12,[30,16,19]) = [1,-1,-1];
%d6 =        nw26 + nw36
%d6 - nw26 - nw36 = 0
Aeq(13,[31,17,20]) = [1,-1,-1];
%d7 =                      nw37
%d7 - nw37 = 0
Aeq(14,[32,21]) = [1,-1];

% ------------------------------------------------------------
% objective function vector
%   note matlab arrays/vectors start at index 1 (not 0)
% ------------------------------------------------------------
f = zeros(32,1);
f(1)  = 10;    % np11(value in f is cp11)
f(2)  = 15;    % np12(value in f is cp12)
f(3)  = 11;    % np21(value in f is cp21)
f(4)  = 8;     % np22(value in f is cp22)
f(5)  = 13;    % np31(value in f is cp31)
f(6)  = 8;     % np32(value in f is cp32)
f(7)  = 9;     % np33(value in f is cp33)
f(8)  = 14;    % np42(value in f is cp42)
f(9)  = 8;     % np43(value in f is cp43)
f(10) = 5;     % nw11(value in f is cw11)
f(11) = 6;     % nw12(value in f is cw12)
f(12) = 7;     % nw13(value in f is cw13)
f(13) = 10;    % nw14(value in f is cw14)
f(14) = 12;    % nw23(value in f is cw23)
f(15) = 8;     % nw24(value in f is cw24)
f(16) = 10;    % nw25(value in f is cw25)
f(17) = 14;    % nw26(value in f is cw26)
f(18) = 14;    % nw34(value in f is cw34)
f(19) = 12;    % nw35(value in f is cw35)
f(20) = 12;    % nw36(value in f is cw36)
f(21) = 6;     % nw37(value in f is cw37)

% ------------------------------------------------------------
% call solver and obtain solution
% ------------------------------------------------------------
[x fval] = linprog(f,A,b,Aeq,beq,lb,ub);

% ------------------------------------------------------------
% print the optimum shipping routes and min cost
% ------------------------------------------------------------
fileID = fopen('partA.out','w');
fprintf(fileID, '-----------------------------------------------------\n');
fprintf(fileID, 'Project 3 Problem 1 Part A Solution\n');
fprintf(fileID, '-----------------------------------------------------\n');
fprintf(fileID, '\n');
fprintf(fileID, ['Ship %3.0f units from plant #%d to warehouse #%d ', ...
    'at a cost of $%4.0f.\n'], x(1), 1, 1, x(1) * f(1));
fprintf(fileID, ['Ship %3.0f units from plant #%d to warehouse #%d ', ...
    'at a cost of $%4.0f.\n'], x(2), 1, 2, x(2) * f(2));
fprintf(fileID, ['Ship %3.0f units from plant #%d to warehouse #%d ', ...
    'at a cost of $%4.0f.\n'], x(3), 2, 1, x(3) * f(3));
fprintf(fileID, ['Ship %3.0f units from plant #%d to warehouse #%d ', ...
    'at a cost of $%4.0f.\n'], x(4), 2, 2, x(4) * f(4));
fprintf(fileID, ['Ship %3.0f units from plant #%d to warehouse #%d ', ...
    'at a cost of $%4.0f.\n'], x(5), 3, 1, x(5) * f(5));
fprintf(fileID, ['Ship %3.0f units from plant #%d to warehouse #%d ', ...
    'at a cost of $%4.0f.\n'], x(6), 3, 2, x(6) * f(6));
fprintf(fileID, ['Ship %3.0f units from plant #%d to warehouse #%d ', ...
    'at a cost of $%4.0f.\n'], x(7), 3, 3, x(7) * f(7));
fprintf(fileID, ['Ship %3.0f units from plant #%d to warehouse #%d ', ...
    'at a cost of $%4.0f.\n'], x(8), 4, 2, x(8) * f(8));
fprintf(fileID, ['Ship %3.0f units from plant #%d to warehouse #%d ', ...
    'at a cost of $%4.0f.\n'], x(9), 4, 3, x(9) * f(9));
fprintf(fileID, '\n');
fprintf(fileID, ['Ship %3.0f units from warehouse #%d to retailer ', ...
    '#%d at a cost of $%4.0f.\n'], x(10), 1, 1, x(10) * f(10));
fprintf(fileID, ['Ship %3.0f units from warehouse #%d to retailer ', ...
    '#%d at a cost of $%4.0f.\n'], x(11), 1, 2, x(11) * f(11));
fprintf(fileID, ['Ship %3.0f units from warehouse #%d to retailer ', ...
    '#%d at a cost of $%4.0f.\n'], x(12), 1, 3, x(12) * f(12));
fprintf(fileID, ['Ship %3.0f units from warehouse #%d to retailer ', ...
    '#%d at a cost of $%4.0f.\n'], x(13), 1, 4, x(13) * f(13));
fprintf(fileID, ['Ship %3.0f units from warehouse #%d to retailer ', ...
    '#%d at a cost of $%4.0f.\n'], x(14), 2, 3, x(14) * f(14));
fprintf(fileID, ['Ship %3.0f units from warehouse #%d to retailer ', ...
    '#%d at a cost of $%4.0f.\n'], x(15), 2, 4, x(15) * f(15));
fprintf(fileID, ['Ship %3.0f units from warehouse #%d to retailer ', ...
    '#%d at a cost of $%4.0f.\n'], x(16), 2, 5, x(16) * f(16));
fprintf(fileID, ['Ship %3.0f units from warehouse #%d to retailer ', ...
    '#%d at a cost of $%4.0f.\n'], x(17), 2, 6, x(17) * f(17));
fprintf(fileID, ['Ship %3.0f units from warehouse #%d to retailer ', ...
    '#%d at a cost of $%4.0f.\n'], x(18), 3, 4, x(18) * f(18));
fprintf(fileID, ['Ship %3.0f units from warehouse #%d to retailer ', ...
    '#%d at a cost of $%4.0f.\n'], x(19), 3, 5, x(19) * f(19));
fprintf(fileID, ['Ship %3.0f units from warehouse #%d to retailer ', ...
    '#%d at a cost of $%4.0f.\n'], x(20), 3, 6, x(20) * f(20));
fprintf(fileID, ['Ship %3.0f units from warehouse #%d to retailer ', ...
    '#%d at a cost of $%4.0f.\n'], x(21), 3, 7, x(21) * f(21));
fprintf(fileID, '\n');
fprintf(fileID, ['%3.0f total units will leave plant #%d (capacity ', ...
    'is %3.0f).\n'], x(1) + x(2), 1, x(22));
fprintf(fileID, ['%3.0f total units will leave plant #%d (capacity ', ...
    'is %3.0f).\n'], x(3) + x(4), 2, x(23));
fprintf(fileID, ['%3.0f total units will leave plant #%d (capacity ', ...
    'is %3.0f).\n'], x(5) + x(6) + x(7), 3, x(24));
fprintf(fileID, ['%3.0f total units will leave plant #%d (capacity ', ...
    'is %3.0f).\n'], x(8) + x(9), 4, x(25));
fprintf(fileID, '\n');
temp = x(10) + x(11) + x(12) + x(13);
fprintf(fileID, ['%3.0f total units will enter warehouse #%d, %3.0f ', ...
    'units will leave.\n'], x(1) + x(3) + x(5), 1, temp);
temp = x(14) + x(15) + x(16) + x(17);
fprintf(fileID, ['%3.0f total units will enter warehouse #%d, %3.0f ', ...
    'units will leave.\n'], x(2) + x(4) + x(6) + x(8), 2, temp);
temp = x(18) + x(19) + x(20) + x(21);
fprintf(fileID, ['%3.0f total units will enter warehouse #%d, %3.0f ', ...
    'units will leave.\n'], x(7) + x(9), 3, temp);
fprintf(fileID, '\n');
fprintf(fileID, ['%3.0f total units will enter retailer #%d (demand ', ...
    'is %3.0f).\n'], x(10), 1, x(26));
fprintf(fileID, ['%3.0f total units will enter retailer #%d (demand ', ...
    'is %3.0f).\n'], x(11), 2, x(27));
fprintf(fileID, ['%3.0f total units will enter retailer #%d (demand ', ...
    'is %3.0f).\n'], x(12) + x(14), 3, x(28));
fprintf(fileID, ['%3.0f total units will enter retailer #%d (demand ', ...
    'is %3.0f).\n'], x(13) + x(15) + x(18), 4, x(29));
fprintf(fileID, ['%3.0f total units will enter retailer #%d (demand ', ...
    'is %3.0f).\n'], x(16) + x(19), 5, x(30));
fprintf(fileID, ['%3.0f total units will enter retailer #%d (demand ', ...
    'is %3.0f).\n'], x(17) + x(20), 6, x(31));
fprintf(fileID, ['%3.0f total units will enter retailer #%d (demand ', ...
    'is %3.0f).\n'], x(21), 7, x(32));
fprintf(fileID, '\n');
total = x(22) + x(23) + x(24) + x(25);
fprintf(fileID, ['In all %3.0f units will travel through the network ', ...
    'at a minimum cost of $%5.0f.\n'], total, fval);
fclose(fileID);