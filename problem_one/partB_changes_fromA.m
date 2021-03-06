% ------------------------------------------------------------
% linear equality matrix and vector
%   note matlab arrays/vectors start at index 1 (not 0)
%   16 equations in 32 variables
% ------------------------------------------------------------
Aeq = zeros(16, 32);
beq = zeros(16, 1);
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
%np12 + np22 + np32 + np42 = 0
Aeq(15,[2,4,6,8]) = [1,1,1,1];
%nw23 + nw24 + nw25 + nw26 = 0
Aeq(16,[14,15,16,17]) = [1,1,1,1];
