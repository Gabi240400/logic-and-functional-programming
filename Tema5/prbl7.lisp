;returneaza nivelul la care se afla nodul nod in arborele arb (radacina este la nivelul 0)
;arb - lista (arbore de tipul 1)
;nod - atom
;nivel - int
(defun nivel_nod (arb nod nivel)
	(cond
		((null arb) 0)
		((equal nod (car arb)) nivel)
		(t(+ (nivel_nod (subarb_stg arb) nod (+ 1 nivel)) (nivel_nod (subarb_dr arb) nod (+ 1 nivel))))
	)
)

;returneaza subarborele stang dintr-o lista de forma (subarbore_stang, subarbore_drept)
;arb - lista
;nr_vf - int
;nr_muchii - int
(defun stg (arb nr_vf nr_muchii)
	(cond
		((null arb) nil)
 		((= nr_vf (+ 1 nr_muchii)) nil)
 		(t (cons (car arb) (cons (cadr arb) (stg (cddr arb) (+ 1 nr_vf) (+ (cadr arb) nr_muchii)))))
	)
)

;returneaza subarborele stang al arborelui arb
;arb - lista
(defun subarb_stg (arb)
	(stg (cddr arb) 0 0)
)

;returneaza subarborele drept dintr-o lista de forma (subarbore_stang, subarbore_drept)
;arb - lista
;nr_vf - int
;nr_muchii - int
(defun dr (arb nr_vf nr_muchii)
	(cond
		((null arb) nil)
 		((= nr_vf (+ 1 nr_muchii)) arb)
 		(t (dr (cddr arb) (+ 1 nr_vf) (+ (cadr arb) nr_muchii)))
	)
)

;returneaza subarborele drept al arborelui arb
;arb - lista
(defun subarb_dr (arb)
	(dr (cddr arb) 0 0)
)

;returneaza nivelul la care se afla nodul nod in arborele arb (de tip 1)
;arb - lista
;nod - int
(defun nivel (arb nod)
	(nivel_nod arb nod 0)
)
