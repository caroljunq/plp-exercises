% % Exercício 3 Trabalho Prolog
%
pega_elem([],[]):-!.
pega_elem([X1|Y],L):- pega_elem(Y,R), append(X1,R,L).

lista_rep(Elem,1,[Elem]):- !.
lista_rep(Elem,N,[Elem|Cauda]):- N1 is N - 1, lista_rep(Elem,N1,Cauda).

monta_lista([],[]):- !.
monta_lista([[Count,X]|Y],[Z|Cauda]):- lista_rep(X,Count,Z), monta_lista(Y,Cauda).

decode(LIn,Lout):- monta_lista(LIn,R), pega_elem(R,Lout).
