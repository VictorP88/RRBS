 function B = sortBlikeA(A,B)
   [~, Ao] = sort(A);
   Bs=sort(B);
   B(Ao)=Bs;
 end