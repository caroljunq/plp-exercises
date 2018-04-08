add_ultimo(X,[ ], [X]) :- !.
add_ultimo(X,[E|Y],[E|Z]) :- add_ultimo(X,Y,Z).

shift_n_esq(0,L,L):-!.
shift_n_esq(N,[X|Y],L2):- add_ultimo(X,Y,R), N1 is N-1, shift_n_esq(N1,R,L2).
