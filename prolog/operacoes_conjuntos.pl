del_todas(X,[],[]):-!.
del_todas(X,[X|Y],Z):- del_todas(X,Y,Z), !.
del_todas(X,[X1|Y],[X1|Z]):- X \== X1, del_todas(X,Y,Z).

conjunto([],[]).
conjunto([X|Y],[X|Z]):-del_todas(X,Y,L), conjunto(L,Z).

inter(L1,L2,R):-conjunto(L1,R1),conjunto(L2,R2),intersec(R1,R2,R).

intersec([],_,[]):- !.
intersec([X|Y],L2,[X|Z]):-member(X,L2),intersec(Y,L2,Z), !.
intersec([X|Y],L2,Z):-intersec(Y,L2,Z).

% uniao(L1,L2,R):-append(L1,L2,R), conjunto(R).

uniao([ ], Y, Y):- !.
uniao([X|Cauda], Y, [X|Z]) :- not(member(X,Y)), uniao(Cauda,Y,Z),!.
uniao([X|Cauda], Y, Z) :- uniao(Cauda,Y,Z).

dif([],_,[]):-!.
dif([X|Y],L2,[X|Z]):-not(member(X,L2)),dif(Y,L2,Z), !.
dif([_|Y],L2,Z):-dif(Y,L2,Z).
