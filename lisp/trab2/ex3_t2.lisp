; exercicio 3 lisp
(defun monta_lista (LIn)
	(if (null LIn) nil
		(let ((el (car LIn))
			(Lout (monta_lista (cdr LIn))))
			(append (apply #'pega_elem el) Lout))))

(defun pega_elem (n el)
	(if (equal n 0) nil
		(cons el (pega_elem (- n 1) el))))
