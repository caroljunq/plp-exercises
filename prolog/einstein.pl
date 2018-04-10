gera(casa(Num,Cor,Nac,Beb,Cig,Anim)):-
  member(Num,[1,2,3,4,5]),
  member(Cor,[vermelha,verde,amarela,azul,branca]),
  member(Nac,[noruegues,ingles,sueco,dinamarques,alemao]),
  member(Beb,[cha,cafe,leite,cerveja,agua]),
  member(Cig,[pall,dun,blue,prince,blends]),
  member(Anim,[caes,passaros,gatos,cavalos,peixes]).

dif(casa(Num1,Cor1,Nac1,Beb1,Cig1,Anim1), casa(Num2,Cor2,Nac2,Beb2,Cig2,Anim2)):-
  Num1 \= Num2, Cor1 \= Cor2, Nac1 \= Nac2, Beb1 \= Beb2, Cig1 \= Cig2, Anim1 \= Anim2.

todas_dif(C1,C2,C3,C4,C5):-
  dif(C1,C2),dif(C1,C3),dif(C1,C4),dif(C1,C5),dif(C2,C3),dif(C2,C4),
  dif(C2,C5),dif(C3,C4),dif(C4,C5).

gera_efi(C1,C2,C3,C4,C5):-
  C1 = casa(1,_,_,_,_,_),
  C2 = casa(2,_,_,_,_,_),
  C3 = casa(3,_,_,_,_,_),
  C4 = casa(4,_,_,_,_,_),
  C5 = casa(5,_,_,_,_,_),
  gera(C1),gera(C2),gera(C3),gera(C4),gera(C5),
  todas_dif(C1,C2,C3,C4,C5).

  direita(X, Y) :- X is Y+1.
  esquerda(X, Y) :- direita(Y, X).

  vizinho(X, Y) :- direita(X, Y).
  vizinho(X, Y) :- esquerda(X, Y).

solucao(S,Fish):-
  S = [C1,C2,C3,C4,C5],
  gera_efi(C1,C2,C3,C4,C5),
  member(casa(_,vermelha,ingles,_,_,_),S),
  member(casa(_,_,sueco,_,_,caes),S),
  member(casa(_,_,dinamarques,cha,_,_),S),
  member(casa(NVerde,_,verde,_,_,_),S),
  member(casa(NBranca,_,branca,_,_,_),S),
  esquerda(NVerde,NBranca),
  member(casa(_,verde,_,cafe,_,_),S),
  member(casa(_,_,_,_,pall,passaros),S),
  member(casa(_,amarela,_,_,dun,_),S),
  member(casa(3,_,_,leite,_,_),S),
  member(casa(1,noruegues,_,_,_,_),S),
  member(casa(NBlends,_,_,_,blends,_),S),
  member(casa(NGatos,_,_,_,_,gatos),S),
  vizinho(NBlends,NGatos),
  member(casa(NCavalo,_,_,_,_,cavalos),S),
  member(casa(NDun,_,_,_,dun,_),S),
  vizinho(NDun,NCavalo),
  member(casa(_,_,_,cerveja,blue,_),S),
  member(casa(_,alemao,_,_,prince,_),S),
  member(casa(NNor,noruegues,_,_,_),S),
  member(casa(NAzul,_,azul,_,_),S),
  vizinho(NNor,NAzul),
  member(casa(NBlends2,_,_,_,blends,_),S),
  member(casa(NAgua,_,_,agua,_,_),S),
  vizinho(NBlends2,NAgua),
  member(house(_,Fish,_,_,_,peixes),S).
