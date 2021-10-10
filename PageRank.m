function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  fid = fopen(nume,'r');
  N = fscanf(fid, "%d", 1);
  outname = strcat(nume, '.out'); % creez fisierul .out
   %---------------------------
  val1 = fscanf(fid, "%d", 1);
	val2 = fscanf(fid, "%d", 1);  
  R1 = Iterative(nume, d, eps);
	R2 = Algebraic(nume, d);
  outID = fopen(outname, 'w');
  fprintf(outID, '%d\n\n', N);
  fprintf(outID, '%d\n\n', R1);
  fprintf(outID, '%d\n\n', R2);
  [R01, ind] = sort(R2, 'descend');
  for i = 1 : N
    x = Apartenenta(R01(i), val1, val2);
    fprintf(outID, '%d %d %d\n', i, ind(i), x);
  endfor
  fclose(outID);
  fclose(fid);
endfunction
    