;returneaza produsul atomilor numerici dintr-o lista
(defun produs(n)
	(cond
		((numberp n) n)
		((atom n) 1)
		(t(apply #'* (mapcar #'produs n)))
	)
)