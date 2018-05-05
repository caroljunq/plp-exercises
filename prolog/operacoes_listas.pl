% Operacoes basicas listas

% X elemento buscado ex: pertence(5, [1,2,3]).
pertence(X,[X|Y]):- !.
pertence(X,[X1|Y]):- pertence(X,Y).

% concatena duas listas e retorna na terceira ex: concatena([1,2,3],[4,5,6],X).
concatena([],L2,L2):- !.
concatena([X|Y],L2,[X|Z]):-concatena(Y,L2,Z).

% adiciona elemento X no final da lista
add_ultimo(X,[],[X]):- !.
add_ultimo(X,[X1|Y],[X1|Z]):- add_ultimo(X,Y,Z).

% elemento X no inicio da list
add_inicio(X,Y,[X|Y]).

% deleta todas as ocorrencias de um elemento na lista no 1 nivel
del(X,[],[]):-!.
del(X,[X|Y],Z):-del(X,Y,Z), !.
del(X,[X1|Y],[X1|Z]):- X \== X1, del(X,Y,Z).

% retorna soma S de uma lista numerica
soma([],0):- !.
soma([X|Y], S):- soma(Y, S1), S is S1+X.

% conta numero de ocorrencias de um elemento X na lista
ocorr(X,[],0):-!.
ocorr(X,[X|Y],N):- conta(X,Y,N1), N is N1 + 1, !.
ocorr(X,[X1|Y],N):- conta(X,Y,N).

% retorna o comprimento da listas
conta([],0):-!.
conta([_|Y],N):- conta(Y, N1), N is N1 + 1.

% retirar repetições da lista no primeiro nível
tira_rep([],[]):-!.
tira_rep([X|Y],[X|Z]):- del(X,Y,L), tira_rep(L,Z).

% fatorial
fat(0,1).
fat(N,F) :- N>0, N1 is N-1, fat(N1,F1), F is N * F1.

% operacao de shift esq
shift_esq([],[]):-!.
shift_esq([X|Y],R):- add_ultimo(X,Y,R).

% operacao de shift direita
shift_dir(X,Y):-shift_esq(Y,X).

% retorna ultimo elemento
ultimo([X],X):-!.
ultimo([_|Y],R):-ultimo(Y,R).

% remove ultimo elemento
remove_ultimo([X],[]):-!.
remove_ultimo([X|Y],[X|Z]):-remove_ultimo(Y,Z).

% operacao de shift direita N vezes
shift_dir_n(0,L,L):-!.
shift_dir_n(N,Y,R):- ultimo(Y, Ul), add_inicio(Ul,Y,L2),
remove_ultimo(L2,R1), N1 is N-1, shift_dir_n(N1,R1,R).

% retorna valo maximo da lista
max_list([X],X):-!.
max_list([X|Y],X):- max_list(Y,Max),  X >= Max, !.
max_list([_|Y],Max):-max_list(Y,Max).

intervalo(N2,N2,[N2]):- N2 mod 2 =:= 0,!.
intervalo(N1,N2,[N1|Z]):- N1 =< N2, N1 mod 2 =:= 0, Novo is N1 + 1, intervalo(Novo,N2,Z), !.
intervalo(N1,N2,Z):- Novo is N1 + 1, intervalo(Novo,N2,Z).
