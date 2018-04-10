% Enunciado:Quatro rapazes estão passeando com os seus cachorros num parque. Siga
% as dicas e descubra os nomes dos donos, as raças e as idades dos cachorros.
% DICAS:
% 1. O bulldog é um ano mais velho que o cachorro do Igor.
% 2. O poddle é um ano mais velho que o bulldog.
% 3. Igor tem um labrador.
% 4. O cachorro de Fred é mais velho que o bulldog.
% 5. O cachorro de Fred é mais novo que o de Carlos.

gera(parque(D,C,I)):-
  member(D,[carlos,fred,igor,leandro]),
  member(C,[bulldog,dalma,labra,pod]),
  member(I,[1,2,3,4]).

dif(parque(D1,C1,I1), parque(D2,C2,I2)):-
  D1 \= D2, C1 \= C2, I1 \= I2.

todas_dif(P1,P2,P3,P4):-
  dif(P1,P2),dif(P1,P3),dif(P1,P4),dif(P2,P3),dif(P2,P4),dif(P3,P4).

gera_efi(P1,P2,P3,P4):-
  P1 = parque(carlos,_,_),
  P2 = parque(fred,_,_),
  P3 = parque(igor,_,_),
  P4 = parque(leandro,_,_),
  gera(P1),gera(P2),gera(P3),gera(P4),
  todas_dif(P1,P2,P3,P4).

solucao(S):-
  S = [P1,P2,P3,P4],
  gera_efi(P1,P2,P3,P4),
  member(parque(_,bulldog,IBull),S),
  member(parque(igor,labra,IIgor),S),
  IBull =:= IIgor + 1,
  member(parque(_,pod,IPod),S),
  IPod =:= IBull + 1,
  IPod =:= IIgor + 2,
  member(parque(fred,_,Ifred),S),
  Ifred > IBull,
  member(parque(carlos,_,ICarlos),S),
  Ifred < ICarlos,
  member(parque(leandro,_,_),S),
  member(parque(_,dalma,_),S).
