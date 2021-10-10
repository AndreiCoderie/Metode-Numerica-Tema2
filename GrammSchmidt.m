function B = GrammSchmidt(A)
    % YOUR CODE HERE
 [m n]=size(A);
    Q = zeros(m,n);
    R = zeros(n,n);
    for j = 1 : n
        v = A(:,j);
            for i = 1 : j-1
                R(i,j) = Q(:,i)' * A(:,j);
                v = v - R(i,j) * Q(:,i);
            endfor
        R(j,j) = norm(v);
        Q(:,j) = v / R(j,j);
    endfor
    B=[];
    Q = Q';
    for i = 1:n
      b = SST(R, Q(1:n, i));
      B = [B b];
    endfor
%error('No Answer Given!')
endfunction