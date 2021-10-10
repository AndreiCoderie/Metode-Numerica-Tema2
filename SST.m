function [x] = SST(A, b)
% YOUR CODE HERE
n = length(b);
x = zeros(n, 1);
for i = n:-1:1
    x(i) = (b(i) - A(i,i+1:n) * x(i+1:n,1)) / A(i,i);
endfor
%error('No Answer Given!')
endfunction