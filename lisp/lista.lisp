; ex1
; //iterativa
(defun reversa (lista)
  (setq aux '())
  (dolist (x lista aux) (setq aux (append (list x) aux)))
)

(defun rev (Lista)
 (cond ((null Lista) NIL)
 ((null (cdr Lista)) Lista)
 (T (append (rev (cdr Lista)) (list (car Lista))))))

(defun palindromize (L)
  (append L (reversa L))
)

; ---------------------------------------------------
; ex2
(defun reverte(lista)
  (setq aux '())
  (dolist (x lista aux)
    (push x aux)
  )
)

(defun palindromop (lista)
  (cond ((atom lista) null)
    ((equal lista (reverte lista)) T)
  )
)
; -------------------------------------------------------
; ex3
(defun tri-retan (L1 L2 L3)
  (cond ((> (/ (+ (* L2 L2) (* L3 L3)) (* L1 L1)) 0.98) T))
)

; ---------------------------------------------------------
; ex4
(setq PI 3.14)
(defun circulo (R)
  (list (* 2 PI R) (* PI R R)))

; ---------------------------------------------------
; ex5
(defun misterio (s)
(cond ((null s) 1)
((atom s) 0)
(t (max (+ 1 (misterio (car s))) (misterio (cdr s))))))

; ---------------------------------------------
; ex6
(defun estranho (l)
(cond ((null l) nil)
((atom l ) l)
(t (cons (estranho (car l))
(estranho (cdr l))))))
; _----------------------------
; ex7

(defun squash (lista)
  (cond ((null lista) nil)
    ((atom (car lista)) (cons (car lista) (squash (cdr lista))))
    (t (append (squash (car lista)) (squash (cdr lista))))
  )
)

; ----------------------
; ex8
(defun esta_em (el lista)
  (cond ((null lista) nil)
    ((atom (car lista))
      (cond ((equal el (car lista)) t)
        (t (esta_em el (cdr lista)))
      )
    )
    ((esta_em el (car lista)) t)
    (t (esta_em el (cdr lista)))
  )
)
; ---------------------------------------
; ex9
; iterativos e recursivo
(defun mini (first l)
  (setq aux first)
  (dolist (x l aux)
    (if (< x aux) (setq aux x))
  )
)

(defun maxi (cur l)
  (cond ((null l) cur)
    ((> (car l) cur) (setq cur (car l)) (maxi cur (cdr l)))
    (t (maxi cur (cdr l)))
  )
)

(defun difmm (L)
  (- (maxi (car L) (cdr L)) (mini (car L) (cdr L)))
)

; -------------------------------------------------
; ex10
(defun uniaoIter (l1 l2)
  (do ((aux l1 (cdr aux)))
    ((null aux) l2)
    (setq l2 (append l2 (list (car aux))))
  )
)

(defun uniaoR (l1 l2)
  (cond
    ((null l1) l2)
    ((null l2) l1)
    (t (cons (car l1) (uniaoR (cdr l1) l2)))
  )
)

(defun interR (l1 l2)
  (cond
    ((null l1) nil)
    ((null l2) nil)
    ((member (car l1) l2) (cons (car l1) (interR (cdr l1) l2)))
    (t (interR (cdr l1) l2))
  )
)
(defun diferR (l1 l2)
  (cond
    ((null l1) nil)
    ((null l2) l1)
    ((not (member (car l1) l2)) (cons (car l1) (diferR (cdr l1) l2)))
    (t (diferR (cdr l1) l2))
  )
)

; ----------------------
; EX11
(defun comum (l1 l2)
  (dolist (x l1 nil)
    (if (member x l2) (return t))
  )
)
; -------------------------------
; ex12
(defun mesmos (l1 l2)
  (cond
    ((and (null (diferR l1 l2)) (null (diferR l2 l1))) t)
  )
)

; ----------------------
; ex13
(defun apaga (el l)
  (cond
    ((null l) nil)
    ((equal el (car l)) (apaga el (cdr l)))
    (t (cons (car l) (apaga el (cdr l))))
  )
)

(defun apagaIt (el l)
  (let ((resp '()))
    (do ((aux l (cdr aux)))
      ((null aux) resp)
      (if (not (equal el (car aux))) (setq resp (append resp (list (car aux)))))
    )
  )
)

; ------------------------
; ex14
; 1 nivel
(defun sub (e1 e2 l)
  (cond
    ((null l) nil)
    ((equal e1 (car l)) (cons e2 (sub e1 e2 (cdr l))))
    (t (cons (car l) (sub e1 e2 (cdr l))))
  )
)

(defun subI (e1 e2 l)
  (let ((resp '()))
    (do ((aux l (cdr aux)))
      ((null aux) resp)
      (cond
        ((equal e1 (car aux)) (setq resp (cons e2 resp)))
        (t (setq resp (cons (car aux) resp)))
      )
    )
  )
)
; --------------------
; ex15
(defun subTodos (e1 e2 l)
  (cond
    ((null l) nil)
    ((atom (car l))
      (cond
        ((equal e1 (car l)) (cons e2 (subTodos e1 e2 (cdr l))))
        (t (cons (car l) (subTodos e1 e2 (cdr l))))
      )
    )
    (t (cons (subTodos e1 e2 (car l)) (subTodos e1 e2 (cdr l))))
  )
)

;----- --------
; EX16
(defun eco ()
  (loop
    (setq x (read))
    (when (equal x 'FIM) (return x))
    (prin1 x)
  )
)
; ---------------------
; ex17
(defun eco2 (N)
  (do ((i 0 (+ i 1)))
    ((equal i N) nil)
    (setq r (read))
    (print r)
  )
)
; ------------------------------
; ex18
(defun apaga18 (el L)
  (do ((aux l (cdr aux)) (resp '()))
    ((null aux) resp)
    (if (not (equal (car aux) el)) (setq resp (append (list(car aux)) resp)))
  )
)
; ----------------------------------------
; ex19
(defun subRe (e1 e2 l)
  (cond ((null l) nil)
    ((equal (car l) e1) (cons e2 (subRe e1 e2 (cdr l))))
    (t (cons (car l) (subRe e1 e2 (cdr l))))
  )
)

(defun subIterat (e1 e2 l)
  (do ((aux l (cdr aux)) (res '()))
    ((null aux) res)
    (cond
      ((equal e1 (car aux)) (setq res (append (list e2) res)))
      (t (setq res (append (list (car aux)) res)))
    )
  )
)
; -------------------------------
; ex20
(defun sub20I (e1 e2 l)
  (cond ((null l) nil)
    ((equal e1 (car l)) (cons e2 (sub20I e1 e2 (cdr l))))
    ((equal e2 (car l)) (cons e1 (sub20I e1 e2 (cdr l))))
    (t (cons (car l) (sub20I e1 e2 (cdr l))))
  )
)

(defun sub20R (e1 e2 l)
  (do ((aux l (cdr aux)) (res '()))
    ((null aux) res)
    (cond
      ((equal e1 (car aux)) (setq res (append res (list e2))))
      ((equal e2 (car aux)) (setq res (append res (list e1))))
      (t (setq res (append res (list (car aux)))))
    )
  )
)

; ----------------------------------------------------------
; ex21
(defun encontra (el l)
  (do ((aux l (cdr aux)))
    ((null aux) nil)
    (cond
      ((equal el (car aux)) (return t))
      ((listp (car aux))
        (dolist (x (car aux))
          (print x)
          (if (equal x el) (return t))
        )
      )
    )
  )
)
; --------------------------------------------------------------
; ex23
(defun difer (l1 l2)
  (do ((aux l1 (cdr aux)) (res '()))
    ((null aux) res)
    (if (not (member (car aux) l2)) (setq res (cons (car aux) res)))
  )
)

(defun mesmos23 (l1 l2)
  (if (and (equal (difer l1 l2) '()) (equal (difer l2 l1) '())) t nil)
)
; ----------------------------------------------------------
; ex24
(defun sub24 (e1 e2 l)
  (cond
    ((null l) nil)
    ((atom (car l))
      (cond
        ((equal e1 (car l)) (cons e2 (sub24 e1 e2 (cdr l))))
        (t (cons (car l) (sub24 e1 e2 (cdr l))))
      )
    )
    (t (cons (sub24 e1 e2 (car l)) (sub24 e1 e2 (cdr l))))
  )
)

(defun sub24IT (e1 e2 l)
  (do ((aux l (cdr aux)) (res '()))
    ((null aux) res)
    (cond
      ((atom (car aux))
        (cond
          ((equal e1 (car aux)) (setq res (append res (list e2))))
          (t (setq res (append res (list (car aux)))))
        )
      )
      (t (setq res (append res (list (sub24IT e1 e2 (car aux))))))
    )
  )
)

; ----------------------------------------
; ex25
(defun carte (c1 c2)
  (do ((aux c1 (cdr aux)) (res '()))
    ((null aux) res)
    (dolist (x c2)
      (setq res (append res (list (list (car aux) x))))
    )
  )
)

(defun monta-pares (el l)
  (cond ((null l) nil)
    (t (cons (list el (car l)) (monta-pares el (cdr l))))
  )
)

(defun cartesiano (c1 c2)
  (cond ((null c1) nil)
    (t (append (monta-pares (car c1) c2) (cartesiano (cdr c1) c2)))
  )
)
