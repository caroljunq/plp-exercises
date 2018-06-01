## Trabalho 2 - LISP

### Disciplina
Paradigmas de Linguagem de Programação - 2018-1

### Grupo
Carolina Junqueira Ferreira

Julio Brito

<br>

## Exercício 1
### Código

```
(defun cnt (LIn)
    (conta_todos (despar LIn)))

(defun despar (lst)
  (cond ((null lst) nil)
        ((atom (car lst)) (cons (car lst) (despar (cdr lst))))
        (t (append (despar (car lst)) (despar (cdr lst))))))

(defun conta_elem (x lst)
  (let ((counter 0))
    (dolist (el lst counter) (if (equal x el) (setq counter (+ 1 counter))))
  )
)

(defun conta_todos (lst)
    (let ((pilha (elimina_rep lst)))
      (do ((aux pilha (cdr aux)) (Lout '()))
        ((null aux) Lout)
        (setq Lout (append Lout (list (list (car aux) (conta_elem (car aux) lst)))))
      )
    )
)

(defun elimina_rep (lst)
    (let ((pilha))
        (loop for elem in lst
            do
            (if (not (member elem pilha))
                (setq pilha (append (list elem) pilha)))) pilha))
```

### Descrição dos Predicados
* **cnt:** recebe uma lista como entrada para contagem;
* **despar:** recebe uma lista e a desparentiza;
* * **elimina_rep:** retorna uma lista eliminando as repetições da lista dada;
* **conta_elem:** conta todas as ocorrências de um elemento na lista dada;
* **conta_todos:** constrói a lista Lout no formato desejado no exercício. Primeiro recebe uma lista sem parênteses e cria-se uma nova lista "pilha" sem as repetições. Depois, roda-se a "pilha" e, a cada elemento, adiciona-se a Lout o par "topo/elemento da pilha" e sua contagem dentro de "lst" (lista com repetições).

### Casos teste

* **Caso Exemplo:** (a b Z x 4.6 (a x) () (5 z x) ())

```
Comando: (cnt '(a b Z x 4.6 (a x) () (5 z x) ()))

Saída: ((5 1) (NIL 2) (4.6 1) (X 3) (Z 2) (B 1) (A 2))

```

* **Caso 1:** (MARIA (1 2 4 JOAO) (((MARIA (() joao)) MARIA b joao ())))

```
Comando: (cnt '(MARIA (1 2 4 JOAO) (((MARIA (() joao)) MARIA b joao ()))))

Saída: ((B 1) (NIL 2) (JOAO 3) (4 1) (2 1) (1 1) (MARIA 3))
```

* **Caso 2**: (MARIA (1 2 4 JOAO) (((MARIA (() joao)) MARIA b joao ())))

```
Comando: (cnt '(X1 b (1 a 2 4 JOAO) 4.3222 (((2 MARIA (() (a 4.322 ())))) MARIA b joao ())))

Saída: ((4.322 1) (NIL 3) (MARIA 2) (4.3222 1) (JOAO 2) (4 1) (2 2) (A 2) (1 1) (B 2) (X1 1))
```

<br>
## Exercício 2
### Código

```
(defun cnt (lst)
	(if (consp lst)
		(conta_todos (car lst) 1 (cdr lst))
		lst))

(defun conta_todos (elt n lst)
	(if (null lst)
		(list (conta_elem elt n))
		(let ((next (car lst)))
			(if (eql next elt)
				(conta_todos elt (+ n 1) (cdr lst))
				(cons (conta_elem elt n)
					(conta_todos next 1 (cdr lst)))))))

(defun conta_elem (elt n)
	(if (> n 0)
		(list n elt)
		elt))

```

### Descrição dos Predicados
* **cnt:** recebe uma lista como entrada para contagem.
* **conta_todos:** conta as todas as ocorrências de elementos em uma lista.
* **conta_elem:** conta os elementos da lista.


### Casos teste

* **Caso Exemplo:** [a,a,a,a,b,c,c,a,a,d,e,e,e,e]

```
?- (print (cnt '(a a a a b c c a a d e e e e)))
Lout = ((4 A) (1 B) (2 C) (2 A) (1 D) (4 E))

```

* **Caso 1:** (a a (c c) (c c) ((c c)) d e e e e)

```
?- (print (cnt '(a a (c c) (c c) ((c c)) d e e e e)))
Lout = ((2 A) (1 (C C)) (1 (C C)) (1 ((C C))) (1 D) (4 E))

```

* **Caso 2:** (() a b z x 4.6 () (a x) (5 (() (() a x)) z x) ())

```
?- (print (cnt '(() a b z x 4.6 () (a x) (5 (() (() a x)) z x) ())))
Lout = ((1 NIL) (1 A) (1 B) (1 Z) (1 X) (1 4.6) (1 NIL) (1 (A X)) (1 (5 (NIL (NIL A X)) Z X)) (1 NIL))

```

* **Caso 3:** (((( () (() b)))) a a a a (b c) c a a (d e) e e e)

```
?- (print (cnt '(((( () (() b)))) a a a a (b c) c a a (d e) e e e)))
Lout = ((1 (((NIL (NIL B))))) (4 A) (1 (B C)) (1 C) (2 A) (1 (D E)) (3 E))

```

<br>

## Exercício 3
### Código

```
(defun monta_lista (lst)
	(if (null lst)
		nil
		(let ((elt (car lst))
			(cdr (monta_lista (cdr lst))))
		(if (consp elt)
			(append (apply #'pega_elem elt)
				cdr)
			(cons elt cdr)))))

(defun pega_elem (n elt)
	(if (zerop n)
		nil
		(cons elt (pega_elem (- n 1) elt))))

```

### Descrição de Predicados
* **pega_elem:** para cada valor de quantidade de elementos, repete o elemento decrescendo até 0.
* **monta_lista:** a partir no formato de lista de entrada do exercício, gera uma lista com sublistas.

### Casos teste
* **Caso Exemplo:** ((4 a) (1 b) (2 c) (2 a) (1 d) (4 e))


```
?- (print (monta_lista '((4 a) (1 b) (2 c) (2 a) (1 d) (4 e))))
Lout = (A A A A B C C A A D E E E E)

```

* **Caso 1:** ((1 ()) (1 A) (1 B) (1 Z) (1 X) (1 4.6) (1 ()) (1 (A X)) (1 (5 () Z X)) (1 ()))

```
?- (print (monta_lista '((1 ()) (1 A) (1 B) (1 Z) (1 X) (1 4.6) (1 ()) (1 (A X)) (1 (5 () Z X)) (1 ()))))
Lout = (NIL A B Z X 4.6 NIL (A X) (5 NIL Z X) NIL)

```

* **Caso 2:** ((1 (((() (() B))))) (4 A) (1 B) (2 C) (2 A) (1 D) (4 E))

```
?- (print (monta_lista '((1 (((() (() B))))) (4 A) (1 B) (2 C) (2 A) (1 D) (4 E))))
Lout = ((((NIL (NIL B)))) A A A A B C C A A D E E E E)

```
