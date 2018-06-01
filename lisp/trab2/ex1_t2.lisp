; ex1
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

(defun elimina_rep (lst)
    (let ((pilha))
        (loop for elem in lst
            do
            (if (not (member elem pilha))
                (setq pilha (append (list elem) pilha)))) pilha))

; ----------------exer1
(defun conta_todos (lst)
    (let ((pilha (elimina_rep lst)))
      (do ((aux pilha (cdr aux)) (Lout '()))
        ((null aux) Lout)
        (setq Lout (append Lout (list (list (car aux) (conta_elem (car aux) lst)))))
      )
    )
)
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

(defun elimina_rep (lst)
    (let ((pilha))
        (loop for elem in lst
            do
            (if (not (member elem pilha))
                (setq pilha (append (list elem) pilha)))) pilha))

(defun conta_todos (lst)
    (let ((pilha (elimina_rep lst)))
      (do ((aux pilha (cdr aux)) (Lout '()))
        ((null aux) Lout)
        (setq Lout (append Lout (list (list (car aux) (conta_elem (car aux) lst)))))
      )
    )
)
