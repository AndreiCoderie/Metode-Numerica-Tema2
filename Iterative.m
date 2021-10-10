function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  fid = fopen(nume ,'r');
  n = fscanf(fid , "%f", 1);
  M = zeros(n , n);  
  A = M;  
  for i = 1 : n
    aux1 = fscanf(fid , '%d', 1); 
    nod = fscanf(fid , '%d', 1);  
    for j= 1 : nod
       aux2 = fscanf(fid, '%d', 1);
       A(aux1 , aux2) = 1;
    endfor
  endfor
  for i = 1 : n
      A(i , i) = 0; 
  endfor
  for i = 1 : n
    leg = 0;
    for j = 1 : n
        leg = leg + A(i , j);
    endfor
    for j = 1 : n
        if (A(i , j) == 1)  
           M(j, i ) = 1 / leg;
        endif
    endfor
  endfor
  R0(1 : n, 1) = 1 / n;
  R = d * M * R0 +((1 - d) / n) * ones(n,1);
  while (norm(R - R0)) > eps
      R0 = R;
      R = d * M * R0 + ((1 - d) / n) * ones(n,1);
  endwhile
  R = R0;  
  fclose(fid);
endfunction 
       
     