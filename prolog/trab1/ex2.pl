% Exercício 2 Trab1 Prolog
tamanho([],0):- !.
tamanho([_|Cauda],N):- tamanho(Cauda,N1), N is N1 + 1.

monta_lista([],[]):- !.
monta_lista([[X|Y]|Cauda],[[Count,X]|Cauda2]):- tamanho(Y, N), Count is N + 1, monta_lista(Cauda,Cauda2).

grup_elem([],[]):- !.
grup_elem([X,X|Cauda],Z):- grup_elem([[X,X]|Cauda],Z), !.
grup_elem([[X|Cauda1]|[X|Cauda2]],Z):- grup_elem([[X,X|Cauda1]|Cauda2],Z), !.
grup_elem([X|Cauda1],[[X]|Cauda2]):- not(is_list(X)), grup_elem(Cauda1,Cauda2), !.
grup_elem([X|Cauda1],[X|Cauda2]):- grup_elem(Cauda1,Cauda2).

conta_consec(LIn,Lout):- grup_elem(LIn,R), monta_lista(R,Lout).
