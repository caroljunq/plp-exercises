% Exercício 1 Trabalho Prolog

dispar([],[]):-!.
dispar([X1|Y],L):- X1 \== [], is_list(X1), dispar(X1,R), dispar(Y,R1), append(R,R1,L), !.
dispar([X1|Y],L):- not(atomic(X1)), dispar(Y,L), !.
dispar([X1|Y],[X1|Z]):- dispar(Y,Z).


% A regra del_todas_ocorr é utilizada para eliminar a ocorrência de determinado elemento em todos
% os níveis de uma lista dada
% A primeira variável refere-se ao elemento, a segunda corresponde a lista dada,
% e a terceira é a lista resultante.

del_todas_ocorr(_,[],[]):- !.
del_todas_ocorr(X,[X|Y],Z):- del_todas_ocorr(X,Y,Z), !.
% del_todas_ocorr(X,[X1|Y],[Z|Y]):- is_list(X1), del_todas_ocorr(X,X1,Z), !.
del_todas_ocorr(X,[X1|Y],[X1|Z]):- X \== X1, del_todas_ocorr(X,Y,Z).

% A regra conta_elem realiza a contagem de um determinado elemento em todos os níveis de uma lista dada.
conta_elem(_,[],0):- !.
conta_elem(X,[X|Y],N):- conta_elem(X,Y,N1), N is N1 + 1, !.
% conta_elem(X,[X1|Y],N):- is_list(X1), conta_elem(X,X1,N1), conta_elem(X,Y,N2), N is N1+N2, !.
conta_elem(X,[X1|Y],N):- X \== X1, conta_elem(X,Y,N).

tamanho([],0):- !.
tamanho([_|Cauda],N):- tamanho(Cauda,N1), N is N1 + 1.

monta_lista([],[]):- !.
monta_lista([[X|Y]|Cauda],[[X,Count]|Cauda2]):- tamanho(Y, N), Count is N + 1, monta_lista(Cauda,Cauda2).

grup_elem([],[]):- !.
grup_elem([X,X|Cauda],Z):- grup_elem([[X,X]|Cauda],Z), !.
grup_elem([[X|Cauda1]|[X|Cauda2]],Z):- grup_elem([[X,X|Cauda1]|Cauda2],Z), !.
grup_elem([X|Cauda1],[[X]|Cauda2]):- not(is_list(X)), grup_elem(Cauda1,Cauda2), !.
grup_elem([X|Cauda1],[X|Cauda2]):- grup_elem(Cauda1,Cauda2).

conta_consec(LIn,Lout):- grup_elem(LIn,R), monta_lista(R,Lout).

% //tem que considerar todos os tipos incluinddo variaveis e estruturas --. estruturas está considerando, falta considerar variaveis
