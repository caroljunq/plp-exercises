% Exercício 1 Trabalho Prolog

% desparentiza e elimina os não atomicos (variaveis e estruturas)
dispar([],[]):-!.
dispar([X1|Y],L):- X1 \== [], is_list(X1), dispar(X1,R), dispar(Y,R1), append(R,R1,L), !.
dispar([X1|Y],L):- not(atomic(X1)), dispar(Y,L), !.
dispar([X1|Y],[X1|Z]):- dispar(Y,Z).

% A regra del_todas_ocorr é utilizada para eliminar a ocorrência de determinado elemento em todos
% de uma lista dada

del_todas_ocorr(_,[],[]):- !.
del_todas_ocorr(X,[X|Y],Z):- del_todas_ocorr(X,Y,Z), !.
del_todas_ocorr(X,[X1|Y],[X1|Z]):- X \== X1, del_todas_ocorr(X,Y,Z).

% A regra conta_elem realiza a contagem de um determinado elemento de uma lista dada.
conta_elem(_,[],0):- !.
conta_elem(X,[X|Y],N):- conta_elem(X,Y,N1), N is N1 + 1, !.
conta_elem(X,[X1|Y],N):- X \== X1, conta_elem(X,Y,N).

% A regra conta_todos conta todos os elementos de uma lista dada e coloca no formato [[a,1],[b,4],[[],3]]
conta_todos([],[]):- !.
conta_todos([X|Y],[[X,Count]|G]):- conta_elem(X,Y,N), Count is N + 1, del_todas_ocorr(X,Y,Z), conta_todos(Z,G).

conta(LIn,LOut):- dispar(LIn,R), conta_todos(R,LOut).
