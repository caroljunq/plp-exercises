% Enunciado: Três músicos de uma banda multinacional executam um solo em um trecho de música. Cada um toca uma
% única vez. O pianista toca primeiro. John toca saxofone e toca antes do australiano. Mark é dos Estados
% Unidos e toca antes do violinista. Um solista vem do Japão e um se chama Sam. Encontre quem vem de
% qual país, quem toca qual instrumento e em qual ordem.

gera(musico(M, I, P, O)) :-
    member(M, [john, sam, mark]),
    member(I, [piano, saxofone, violino]),
    member(P, [eua,japao,austra]),
    member(O, [1, 2, 3]).

dif(musico(M1,I1,P1,O1),musico(M2,I2,P2,O2)):-
  M1 \= M2, I1 \= I2, P1 \= P2, O1 \= O2.

todas_dif(M1,M2,M3):-dif(M1,M2),dif(M1,M3),dif(M2,M3).

gera_efi(M1,M2,M3):-
  M1 = musico(_,_,_,1),
  M2 = musico(_,_,_,2),
  M3 = musico(_,_,_,3).
  gera(M1),gera(M2),gera(M3),
  todas_dif(M1,M2,M3).

solucao(S):-
  S = [M1,M2,M3],
  gera_efi(M1,M2,M3),
  member(musico(_,piano,_,1),S),
  member(musico(john,saxofone,_,OJohn),S),
  member(musico(_,_,austra,OAust),S),
  OJohn < OAust,
  member(musico(mark,_,eua,OMark),S),
  member(musico(_,violino,_,OViolino),S),
  OMark < OViolino,
  member(musico(sam,_,_,_),S),
  member(musico(_,_,japao,_),S).
