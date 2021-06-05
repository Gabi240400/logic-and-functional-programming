%substituie_el(L:lista, EL:int, ELNOU:int, REZ:lista)
%(i,i,i,o),(i,i,o,i),(o,i,i,i),(i,o,i,i)
substituie_el([], _, _, []).
substituie_el([EL|T], EL, ELNOU, [ELNOU|REZ]):-substituie_el(T, EL, ELNOU, REZ), !.
substituie_el([H|T], EL, ELNOU, [H|REZ]):-substituie_el(T, EL, ELNOU, REZ).



%sublista_partiala(L:lista, POZ1:int, POZ2:int, REZ:lista)
%(i,i,i,o)
sublista_partiala([], _, _, []).
sublista_partiala([_|T], POZ1, POZ2, REZ):- POZ2<0, sublista_partiala(T, POZ1, POZ2, REZ), !.
sublista_partiala([H|T], POZ1, POZ2, [H|REZ]):- POZ2N is POZ2-1,  POZ1=:=0, sublista_partiala(T, POZ1, POZ2N, REZ), !.
sublista_partiala([_|T], POZ1, POZ2, REZ):- POZ1N is POZ1-1, POZ2N is POZ2-1, sublista_partiala(T, POZ1N, POZ2N, REZ).


