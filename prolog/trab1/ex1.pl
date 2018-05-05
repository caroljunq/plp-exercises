% Exercício 1 Trabalho Prolog

% dispar([],[]):-!.
% dispar([X1|Y],L):- is_list(X1), dispar(X1,R), dispar(Y,R1), append(R,R1,L), !.
% dispar([X1|Y],[X1|Z]):-dispar(Y,Z).


% A regra del_todas_ocorr é utilizada para eliminar a ocorrência de determinado elemento em todos
% os níveis de uma lista dada
% A primeira variável refere-se ao elemento, a segunda corresponde a lista dada,
% e a terceira é a lista resultante.

del_todas_ocorr(_,[],[]):- !.
del_todas_ocorr(X,[X|Y],Z):- del_todas_ocorr(X,Y,Z), !.
del_todas_ocorr(X,[X1|Y],[Z|Y]):- is_list(X1), del_todas_ocorr(X,X1,Z), !.
del_todas_ocorr(X,[X1|Y],[X1|Z]):- X \== X1, del_todas_ocorr(X,Y,Z).

% A regra conta_elem realiza a contagem de um determinado elemento em todos os níveis de uma lista dada.
conta_elem(_,[],0):- !.
conta_elem(X,[X|Y],N):- conta_elem(X,Y,N1), N is N1 + 1, !.
conta_elem(X,[X1|Y],N):- is_list(X1), conta_elem(X,X1,N1), conta_elem(X,Y,N2), N is N1+N2, !.
conta_elem(X,[X1|Y],N):- X \== X1, conta_elem(X,Y,N).

% A regra conta_todos conta todos os elementos de uma lista dada em todos os
% níveis e mostra o resultado numa lista.



conta_todos([],[]):- !.
conta_todos([X|Y], Z):- is_list(X), conta_todos(X,R), conta_todos(Y,R2), append(R,R2,Z), !.
conta_todos([X|Y],[[X,Count]|G]):- conta_elem(X,Y,N), Count is N + 1, del_todas_ocorr(X,Y,Z), conta_todos(Z,G).

% conta_todos([],_):- !.
% conta_todos([[]|Y],[[[],Count]|G]):- Y \= [], conta_elem([],Y,N), Count is N + 1, del_todas_ocorr([],Y,Z), conta_todos(Z,G).
% conta_todos([X|_], Z):- is_list(X), conta_todos(X,Z), !.
% conta_todos([X|Y],[[X,Count]|G]):- conta_elem(X,Y,N), Count is N + 1, del_todas_ocorr(X,Y,Z), conta_todos(Z,G).
% //falta contar o vazio como elementos
%quando ele termina de contar sublist não conta último

conta(LIn,LOut):- conta_todos(R,LOut).
