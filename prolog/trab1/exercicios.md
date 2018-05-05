## Trabalho 1 - Prolog

#### Disciplina
Paradigmas de Linguagem de Programação - 2018-1

#### Grupo
Carolina Junqueira Ferreira

Julio Brito



## Exercício 1
### Predicados

```
despar([],[]):- !.
despar([X1|Y],L):- X1 \== [], is_list(X1), despar(X1,R), despar(Y,R1), append(R,R1,L), !.
despar([X1|Y],L):- not(atomic(X1)), despar(Y,L), !.
despar([X1|Y],[X1|Z]):- despar(Y,Z).

del_todas_ocorr(_,[],[]):- !.
del_todas_ocorr(X,[X|Y],Z):- del_todas_ocorr(X,Y,Z), !.
del_todas_ocorr(X,[X1|Y],[X1|Z]):- X \== X1, del_todas_ocorr(X,Y,Z).

conta_elem(_,[],0):- !.
conta_elem(X,[X|Y],N):- conta_elem(X,Y,N1), N is N1 + 1, !.
conta_elem(X,[X1|Y],N):- X \== X1, conta_elem(X,Y,N).

conta_todos([],[]):- !.
conta_todos([X|Y],[[X,Count]|R]):- conta_elem(X,Y,N), Count is N + 1, del_todas_ocorr(X,Y,Z), conta_todos(Z,R).

conta(LIn,LOut):- despar(LIn,R), conta_todos(R,LOut).

```

### Descrição dos Predicados
* **despar:** recebe uma lista e a desparentiza, eliminando também elementos que não são atômicos;
* **del_todas_ocorr:** remove todas as ocorrências de um elemento no primeiro nível de uma lista;
* **conta_elem:** conta as ocorrências de um elemento no primeiro nível de uma lista;
* **conta_todos:** conta as ocorrências dos elementos de uma lista dada e resulta numa segunda lista no formato pedido no exercício. Ex: [[a,2],[b,3],[[],2]].
* **conta:** recebe a lista LIn, a desparentiza e conta as ocorrências de seus elementos, resultando na LOut que possui o formato requerido no exercício Ex: [[a,2],[b,3],[[],2]].

### Casos teste

* **Caso Exemplo:** [a,b,Z,x,4.6,[a,x],[],[5,z,x],[]]

```
?- conta([a,b,Z,x,4.6,[a,x],[],[5,z,x],[]], LOut).
LOut = [[a, 2], [b, 1], [x, 3], [4.6, 1], [[], 2], [5, 1], [z, 1]].

```

* **Caso 1:** [VAR,4.6,[],5,filho_de("maria","joao"),[a,z],[irmao("rui","joana"),VAR,[]],[5,z,x],[]]

```
?- conta([VAR,4.6,[],5,filho_de("maria","joao"),[a,z],[irmao("rui","joana"),VAR,[]],[5,z,x],[]],LOut).
LOut = [[4.6, 1], [[], 3], [5, 2], [a, 1], [z, 2], [x, 1]].

```

* **Caso 2**: [[],[],VAR,4.6,[a,[x]],[[[VAR,filho_de("maria","joao"),[]]]],[5,z,x],[]]

```
?- conta([[],[],VAR,4.6,[a,[x]],[[[VAR,filho_de("maria","joao"),[]]]],[5,z,x],[]],LOut).
LOut = [[[], 4], [4.6, 1], [a, 1], [x, 2], [5, 1], [z, 1]].

```
