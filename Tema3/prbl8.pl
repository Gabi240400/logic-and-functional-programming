%elem(L:lista, E:int).
%(i,o)
elem([H|_],H).
elem([_|T],Rez):-elem(T,Rez).

%pronostic1(L:lista, C:lista, Lung:int, Apar_X:int, R:lista, N:int)
%(i,i,i,i,o)
pronostic1(_,C,N,_,C,N).
pronostic1(L,[],Lung1,Apar_X,R,N):-
    elem(L,E),
    E = 1,
    Lung is Lung1+1,
    pronostic1(L,[E],Lung,Apar_X,R,N).
pronostic1(L,C,Lung1,Apar_X1,R,N):-
    elem(L,E),
    E = 'X',
    Apar_X1 < 2,
    Apar_X is Apar_X1 +1,
    Lung1 < N,
    Lung is Lung1 +1,
    pronostic1(L,[E|C],Lung,Apar_X,R,N).
pronostic1(L,C,Lung1,Apar_X,R,N):-
    elem(L,E),
    number(E),
    Lung1 < N,
    Lung1 > 0,
    Lung is Lung1 +1,
    pronostic1(L,[E|C],Lung,Apar_X,R,N).

%pronostic(R:lista)
%(o)
pronostic(N,R):-pronostic1([1,'X',2],[],0,0,R,N).

%pronosticuri(R:lista)
%(o)
pronosticuri(N,R):-findall(Rez, pronostic(N,Rez),R).
