% % max_list([X],X):-!.
% % max_list([X|Y],X):- max_list(Y,Max),  X >= Max, !.
% % max_list([_|Y],Max):-max_list(Y,Max).
% % del_todas(_,[],[]):-!.
% % del_todas(X,[X|Y],Z):- del_todas(X,Y,Z), !.
% % del_todas(X,[X1|Y],[X1|Z]):- X \== X1, del_todas(X,Y,Z).
% %
% % conjunto([],[]).
% % conjunto([X|Y],[X|Z]):-del_todas(X,Y,L), conjunto(L,Z).
% %
% % inter(L1,L2,R):-conjunto(L1,R1),conjunto(L2,R2),intersec(R1,R2,R).
% %
% % intersec([],_,[]).
% % intersec([X|Y],L2,[X|Z]):- member(X,L2), intersec(Y,L2,Z).
% % intersec([X|Y],L2,Z):- not(member(X,L2)), intersec(Y,L2,Z).
% %
% % % uniao(L1,L2,R):-append(L1,L2,R), conjunto(R).
% %
% % uniao([ ], Y, Y):- !.
% % uniao([X|Cauda], Y, [X|Z]) :- not(member(X,Y)), uniao(Cauda,Y,Z),!.
% % uniao([X|Cauda], Y, Z) :- member(X,Y), uniao(Cauda,Y,Z).
% %
% % dif([],_,[]):-!.
% % dif([X|Y],L2,[X|Z]):-not(member(X,L2)),dif(Y,L2,Z), !.
% % dif([_|Y],L2,Z):-dif(Y,L2,Z).
% %
% % inter_3(L1,L2,L3,R):-intersec(L1,L2,R1),intersec(R1,L3,R).
% %
% % pertence(X,[X|_]):-!.
% % pertence(X,[X1|Y]):- X \== X1, pertence(X,Y).
% %
% % p(X,[X]):-!.
% % p(X,[X1|Y]):-is_list(X1),pertence(X,X1),p(X,Y), !.
% % p(X,[_|Y]):-pertence(X,Y),p(X,Y).
% %
% % ordena([],[]):-!.
% % ordena([X],[X]):-!.
% % ordena([X|Y],[X|Z]):-max_list(Y,X),ordena(Y,Z), !.
% % ordena([X|Y],Z):-ordena(Y,Z).
% %
% % insere_em_ordem(E, [ ], [E]) :- !.
% % insere_em_ordem(E, [X|Y], [E,X|Y]) :- E =< X, insere_em_ordem(E, Y, Z),!.
% % insere_em_ordem(E, [X|Y], [X|Z]) :- insere_em_ordem(E, Y, Z), !.
% %
% % % inverte(Lista,Z)
%
% add_ultimo(X,[],[X]):-!.
% add_ultimo(X,[X1|Y],[X1|Z]):- add_ultimo(X,Y,Z).
%
% inverte([],[]):-!.
% inverte([X|Y],Z):-inverte(Y,Y1),add_ultimo(X,Y1,Z).
% %
% %
% % sub([],_,_,[]):-!.
% % sub([E1|Y],E1,E2,[E2|Z]):- sub(Y,E1,E2,Z), !.
% % sub([X1|Y],E1,E2,[T|Z]):- is_list(X1), sub(X1,E1,E2,T),sub(Y,E1,E2,Z), !.
% % sub([X1|Y],E1,E2,[X1|Z]):- sub(Y,E1,E2,Z).
% %
% %
% % conta(X,[],0):-!.
% % conta(X,[X|Y],N):-conta(X,Y,N1),N is N1+1, !.
% % conta(X,[X1|Y],N):-is_list(X1),conta(X,X1,N1), conta(X,Y,N2), N is N1+N2, !.
% % conta(X,[X1|Y],N):-conta(X,Y,N).
% %
% % dispar([],[]):-!.
% % dispar([X1|Y],L):-dispar(X1,L1), dispar(L1,L), !.
% % dispar([X1|Y],[X1|Z]):-dispar(Y,Z).
%
% sub([],[]):-!.
% sub([X1|Y],[T|Z]):-inverte(X1,T), sub(Y,Z).
%
%
% inverte_pares([ ], [ ]) :- !.
% inverte_pares([X|Y], [Z|W]) :- troca_par(X,Z), inverte_pares(Y, W).
% troca_par([A,B], [B,A]).


gera(p(Nacio,Cor,Animal,Beb,Cigar)):-
  member(Nacio,[ingles,espanhol,ucraniano,noruegues,japones]),
  member(Cor,[vermelha,verde,marfim,amarela,azul]),
  member(Animal,[cao,caracois,raposa,cavalo,zebra]),
  member(Beb,[cafe,cha,leite,agua,laranja]),
  member(Cigar,[old,kools,chester,lucky,parliaments]).

dif(p(Nacio1,C1,A1,B1,Cig1),p(Nacio2,C2,A2,B2,Cig2)):-
  Nacio1 \= Nacio2, C1 \= C2, A1 \= A2, B1 \= B2, Cig1 \= Cig2.

todas_dif(P1,P2,P3,P4,P5):-
  dif(P1,P2),dif(P1,P3),dif(P1,P4),dif(P1,P5),
  dif(P2,P3),dif(P2,P4),dif(P2,P5),dif(P3,P4),dif(P3,P5),dif(P4,P5).

vizinho_esq(C1, C2, [C1,C2|_]).
vizinho_esq(C1, C2, [C3|T]) :- vizinho_esq(C1, C2, T).

vizinho_dir(C1, C2, [C2,C1|_]).
vizinho_dir(C1, C2, [C3|T]) :- vizinho_dir(C1, C2, T).

vizinho(C1, C2, S) :- vizinho_esq(C1, C2, S).
vizinho(C1, C2, S) :- vizinho_dir(C1, C2, S).

solucao(S):-
  S = [P1,P2,P3,P4,P5],
  P1 = p(noruegues,_,_,_,_),
  P3 = p(_,_,_,leite,_),
  gera(P1),gera(P2),gera(P3),gera(P4),gera(P5),
  todas_dif(P1,P2,P3,P4,P5),
  member(p(ingles,vermelha,_,_,_),S),
  member(p(espanhol,_,cao,_,_),S),
  member(p(_,verde,_,cafe,_),S),
  member(p(ucraniano,_,_,cha,_),S),
  vizinho_dir(p(_,verde,_,_,_),p(_,marfim,_,_,_)),
  member(p(_,_,caracois,_,old),S),
  member(p(_,amarela,_,_,kools),S),
  vizinho(p(_,_,_,_,chester),p(_,_,raposa,_,_)),
  vizinho(p(_,amarela,_,_,kools),p(_,_,cavalo,_,_)),
  member(p(_,_,_,laranja,lucky),S),
  member(p(japones,_,_,_,parliaments),S),
  vizinho(p(noruegues,_,_,_,_),p(_,azul,_,_,_)).
