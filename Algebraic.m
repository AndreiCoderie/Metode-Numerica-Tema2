function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
      fid = fopen(nume,'r');
      N = fscanf(fid, "%d", 1);
      M = zeros(N, N); 
	    A = M; 
      for i = 1 : N
          nod = fscanf(fid, '%d', 1);
          nrnod = fscanf(fid, '%d', 1);
        for j= 1 : nrnod
          col = fscanf(fid, '%d', 1);
          A(nod, col) = 1;
        endfor
      endfor
      for i = 1 : N
        A(i, i) = 0;
      endfor
        for i = 1:N
		      leg = 0;
         for j = 1 : N
            leg = leg + A(i,j);
	     	 endfor
         for j = 1:N
	    		  if (A(i, j) == 1) 
			  	    M(j, i) = 1 / leg;
			      endif
		      endfor
      endfor 
% ------------------------------------------------------------------
      I = eye(N);                    
      I1 = ones(N, 1);                
      R2 = GrammSchmidt(I - d * M);
      R = R2 * (1 - d) / N * ones(N , 1) ;
      fclose(fid);
endfunction 