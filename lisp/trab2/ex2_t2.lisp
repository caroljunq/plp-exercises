; ex2
(defun cnt (LIn) (if (null LIn) nil (conta_todos (car LIn) 1 (cdr LIn))))

(defun conta_todos (topo n lst)
	(if (null lst)
		(list (list n topo))
		(let ((prox (car lst)))
			(if (equal prox topo)
				(conta_todos topo (+ n 1) (cdr lst))
				(cons (list n topo)
					(conta_todos prox 1 (cdr lst)))))))
