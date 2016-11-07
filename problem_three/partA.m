% lower bounds vector
%   note matlab arrays/vectors start at index 1 (not 0)
lb = zeros(32,1);
lb(1)  = 0     % np11
lb(2)  = 0     % np12
lb(3)  = 0     % np21
lb(4)  = 0     % np22
lb(5)  = 0     % np31
lb(6)  = 0     % np32
lb(7)  = 0     % np33
lb(8)  = 0     % np42
lb(9)  = 0     % np43
lb(10) = 0     % nw11
lb(11) = 0     % nw12
lb(12) = 0     % nw13
lb(13) = 0     % nw14
lb(14) = 0     % nw23
lb(15) = 0     % nw24
lb(16) = 0     % nw25
lb(17) = 0     % nw26
lb(18) = 0     % nw34
lb(19) = 0     % nw35
lb(20) = 0     % nw36
lb(21) = 0     % nw37
lb(22) = 0     % s1
lb(23) = 0     % s2
lb(24) = 0     % s3
lb(25) = 0     % s4
lb(26) = 100   % d1
lb(27) = 150   % d2
lb(28) = 100   % d3
lb(29) = 200   % d4
lb(30) = 200   % d5
lb(31) = 150   % d6
lb(32) = 100   % d7
% upper bounds vector
%   note matlab arrays/vectors start at index 1 (not 0)
ub = Inf(32,1);
ub(1)  = 150   % np11
ub(2)  = 150   % np12
ub(3)  = 450   % np21
ub(4)  = 450   % np22
ub(5)  = 250   % np31
ub(6)  = 250   % np32
ub(7)  = 250   % np33
ub(8)  = 150   % np42
ub(9)  = 150   % np43
ub(10) = Inf   % nw11
ub(11) = Inf   % nw12
ub(12) = Inf   % nw13
ub(13) = Inf   % nw14
ub(14) = Inf   % nw23
ub(15) = Inf   % nw24
ub(16) = Inf   % nw25
ub(17) = Inf   % nw26
ub(18) = Inf   % nw34
ub(19) = Inf   % nw35
ub(20) = Inf   % nw36
ub(21) = Inf   % nw37
ub(22) = 150   % s1
ub(23) = 450   % s2
ub(24) = 250   % s3
ub(25) = 150   % s4
ub(26) = Inf   % d1
ub(27) = Inf   % d2
ub(28) = Inf   % d3
ub(29) = Inf   % d4
ub(30) = Inf   % d5
ub(31) = Inf   % d6
ub(32) = Inf   % d7
% linear inequality matrix and vector
%   note matlab arrays/vectors start at index 1 (not 0)
% linear inequality matrix and vector
%   note matlab arrays/vectors start at index 1 (not 0)
% objective function vector
%   note matlab arrays/vectors start at index 1 (not 0)
f = zeros(32,1);
f(1)  = 10    % np11
f(2)  = 15    % np12
f(3)  = 11    % np21
f(4)  = 8     % np22
f(5)  = 13    % np31
f(6)  = 8     % np32
f(7)  = 9     % np33
f(8)  = 14    % np42
f(9)  = 8     % np43
f(10) = 5     % nw11
f(11) = 6     % nw12
f(12) = 7     % nw13
f(13) = 10    % nw14
f(14) = 12    % nw23
f(15) = 8     % nw24
f(16) = 10    % nw25
f(17) = 14    % nw26
f(18) = 14    % nw34
f(19) = 12    % nw35
f(20) = 12    % nw36
f(21) = 6     % nw37
f(22) = 0     % s1
f(23) = 0     % s2
f(24) = 0     % s3
f(25) = 0     % s4
f(26) = 0     % d1
f(27) = 0     % d2
f(28) = 0     % d3
f(29) = 0     % d4
f(30) = 0     % d5
f(31) = 0     % d6
f(32) = 0     % d7

