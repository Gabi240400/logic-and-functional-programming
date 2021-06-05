%verif1(X:int)
%verifica daca X este de forma 2^n
verif1(2):- true.
verif1(X):- X mod 2 =:= 0, X1 is X div 2, verif1(X1).

%verif(X:int)
%verifica daca X este de forma 2^n-1
verif(X):-X1 is X+1, verif1(X1).

%ins1(L:lista,E:int,I:int,REZ:lista)
%(i,i,i,o),(o,i,i,i),(i,o,i,i),(i,i,i,i)
ins1([],_,_,[]):-!.
ins1([H|T],E,I,[H,E|REZ]):-verif(I), I1 is I+1, !, ins1(T, E, I1, REZ).
ins1([H|T],E,I,[H|REZ]):-I1 is I+1, ins1(T, E, I1, REZ).

%ins(L:lista,E:int,REZ:lista)
%(i,i,o),(o,i,i),(i,o,i)
ins(L,E,REZ):-ins1(L,E,1,REZ).

%insb1(L:lista, E:int, REZ:lista)
%(i,i,o)
insb1([], _, []):- !.
insb1([H|T], _, [H|REZ]):- number(H), insb1(T, H, REZ), !.
insb1([H|T], E, [L|REZ]):- is_list(H), ins(H, E, L), insb1(T, E, REZ).

%insb(L:lista, REZ:lista)
%(i,o)
insb(L,REZ):-insb1(L,0,REZ).
