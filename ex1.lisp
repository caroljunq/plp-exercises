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

(defun apaga_elem (el l)
  (let ((resp '()))
    (do ((aux l (cdr aux)))
      ((null aux) resp)
      (if (not (equal el (car aux))) (setq resp (append resp (list (car aux)))))
    )
  )
)

(defun conta_todos (lst)
    (do ((aux lst (apaga_elem (car aux) aux)) (Lout ()))
    ((null aux) Lout)
    (setq Lout (append Lout (list (list (car aux) (conta_elem (car aux) aux)))))
  )
)
