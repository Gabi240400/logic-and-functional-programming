;elemina elementul de pe pozitia m din lita l
;cu variabila poz parcurg lista
;l-lista, m-int, poz-int
(defun elim_elem(l m poz)
	(cond
		((> poz m) l)
		((equal m poz)(elim_elem (cdr l) m (+ poz 1)))
		(t(cons (car l) (elim_elem (cdr l) m (+ poz 1))))
	)
)

;in elim_elem, poz trebuie sa fie dat mereu 1
;l-lista, m-int
(defun elim(l m)
	(elim_elem l m 1)
)

;inverseaza lista l
;l-lista
(defun inversare_lista(l)
	(cond
		((null l) ())
		(t(append (inversare_lista (cdr l)) (list (car l))))
	)
)

;transforma o lista liniara de cifre in numar (1 2 3 4) => 1234
;l-lista, nr-int
(defun transf_nr(l nr)
	(cond
		((null l) nr)
		(t(transf_nr (cdr l) (+ (* nr 10) (car l))))
	)
)

;transforma un numar intr-o lista liniara formata din cifrele sale 1234 in ordine inversa => (4 3 2 1)
;nr-int
(defun transf_lista(nr)
	(cond
		((= nr 0) ())
		(t(cons (mod nr 10) (transf_lista (floor nr 10))))
	)
)

;gaseste succesorul unui numar dat ca lista (1 2 3 9) => (1 2 4 0)
;l-lista
(defun succesor(l)
	(inversare_lista (transf_lista (+(transf_nr l 0) 1)))
)

;returneaza t daca atomul el se gaseste in lista l, nil altfel
;l-lista, el-atom
(defun el_in_lista(l el)
	(cond
		((null l) nil)
		((equal el (car l)) t)
		(t(el_in_lista(cdr l) el))
	)
)

;verifica daca lista liniara l este o multime
;l-lista
(defun e_multime(l)
	(cond
		((null l) t)
		((el_in_lista (cdr l) (car l)) nil)
		(t(e_multime (cdr l)))
	)
)

;returneaza multimea c (lista liniara) cu atomii din lista l
;l-lista, c-lista
(defun mult_atomi(l c)
	(cond 
		((null l) c)
		((and (atom (car l)) (not(el_in_lista c (car l)))) (mult_atomi (cdr l) (cons (car l) c)))
		((atom (car l)) (mult_atomi (cdr l) c))
		(t (mult_atomi (cdr l) (mult_atomi (car l) c)))
	) 
)

;returneaza multimea atomilor din lista l
;l-lista
(defun multime(l)
	(mult_atomi l ())
)