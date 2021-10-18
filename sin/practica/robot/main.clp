;; =======================
;; ======== FACTS ========
;; =======================

(defglobal ?*nod-gen* = 0)
(defglobal ?*prof* = 60)

(deffacts mapa

  (limiteX 1 5)
  (limiteY 1 8)

  (hueco 1 3)
  (hueco 1 5)
  (hueco 2 1)
  (hueco 4 3)
  (hueco 4 5)
  (hueco 6 1)
  (hueco 7 5)
  (hueco 8 1)
  (hueco 8 3)

  (juego pos 2 3 latas lata 3 3 lata 3 1 lata 6 4)

  )

;; =======================
;; ======== RULES ========
;; =======================

;; movimiento del robot
(defrule irder
  (juego pos ?x ?y latas $?l)
  (hueco ?hx ?hy)
  (limiteX ?xx ?xy)
  (limiteY ?yx ?yy)

  (test (not (member$ (create$ lata (+ ?x 1) ?y) $?l)))
  (not (hueco =(+ ?x 1) ?y))
  (test (< ?x ?xy))
 =>
  (bind ?*nod-gen* (+ ?*nod-gen* 1))
  (assert (juego pos (+ ?x 1) ?y latas $?l))
)

(defrule irizq
  (juego pos ?x ?y latas $?l)
  (hueco ?hx ?hy)
  (limiteX ?xx ?xy)
  (limiteY ?yx ?yy)

  (test (not (member$ (create$ lata (- ?x 1) ?y) $?l)))
  (not (hueco =(- ?x 1) ?y))
  (test (> ?x ?xx))
 =>
  (bind ?*nod-gen* (+ ?*nod-gen* 1))
  (assert (juego pos (- ?x 1) ?y latas $?l))
)

(defrule irarriba
  (juego pos ?x ?y latas $?l)
  (hueco ?hx ?hy)
  (limiteX ?xx ?xy)
  (limiteY ?yx ?yy)

  (test (not (member$ (create$ lata ?x (+ ?y 1)) $?l)))
  (not (hueco =?x (+ ?y 1)))
  (test (< ?y ?yy))
 =>
  (bind ?*nod-gen* (+ ?*nod-gen* 1))
  (assert (juego pos ?x (+ ?y 1) latas $?l))
)

(defrule irabajo
  (juego pos ?x ?y latas $?l)
  (hueco ?hx ?hy)
  (limiteX ?xx ?xy)
  (limiteY ?yx ?yy)

  (test (not (member$ (create$ lata ?x (- ?y 1)) $?l)))
  (not (hueco =?x (- ?y 1)))
  (test (> ?y ?yx))
 =>
  (bind ?*nod-gen* (+ ?*nod-gen* 1))
  (assert (juego pos ?x (- ?y 1) latas $?l))
)

;; mover la lata
(defrule mover_lata_der
  (juego pos ?x ?y latas $?w lata ?lx ?ly $?z)
  (hueco ?hx ?hy)
  (limiteX ?xmin ?xmax)
  (limiteY ?ymin ?ymax)

  (test (eq ?lx (+ ?x 1))) ; compruebo que hay lata a la derecha
  (test (< (+ ?lx 1) ?xmax))
  (not (hueco =(+ ?lx 1) ?ly))
 =>
  (bind ?*nod-gen* (+ ?*nod-gen* 1))
  (assert (juego pos (+ ?x 1) ?y latas $?w lata (+ ?lx 1) ?ly $?z))
)

(defrule mover_lata_izq
  (juego pos ?x ?y latas $?w lata ?lx ?ly $?z)
  (hueco ?hx ?hy)
  (limiteX ?xmin ?xmax)
  (limiteY ?ymin ?ymax)

  (test (eq ?lx (- ?x 1))) ; compruebo que hay lata a la izq
  (test (> (- ?lx 1) ?xmin))
  (not (hueco =(- ?lx 1) ?ly))
 =>
  (bind ?*nod-gen* (+ ?*nod-gen* 1))
  (assert (juego pos (- ?x 1) ?y latas $?w lata (- ?lx 1) ?ly $?z))
)

(defrule mover_lata_arriba
  (juego pos ?x ?y latas $?w lata ?lx ?ly $?z)
  (hueco ?hx ?hy)
  (limiteX ?xmin ?xmax)
  (limiteY ?ymin ?ymax)

  (test (eq ?ly (+ ?y 1)))
  (test (< (+ ?ly 1) ?ymax))
  (not (hueco =?lx (+ ?ly 1)))
 =>
  (bind ?*nod-gen* (+ ?*nod-gen* 1))
  (assert (juego pos ?x (+ ?y 1) latas $?w lata ?lx (+ ?ly 1) $?z))
)

(defrule mover_lata_abajo
  (juego pos ?x ?y latas $?w lata ?lx ?ly $?z)
  (hueco ?hx ?hy)
  (limiteX ?xmin ?xmax)
  (limiteY ?ymin ?ymax)

  (test (eq ?ly (- ?y 1)))
  (test (> (- ?ly 1) ?ymin))
  (not (hueco =?lx (- ?ly 1)))
 =>
  (bind ?*nod-gen* (+ ?*nod-gen* 1))
  (assert (juego pos ?x (- ?y 1) latas $?w lata ?lx (- ?ly 1) $?z))
)

;; meter las latas en el contenedor
(defrule empujar_lata_der
  (juego pos ?x ?y latas $?w lata ?lx ?ly $?z)
  (hueco ?hx ?hy)
  (limiteX ?xmin ?xmax)
  (limiteY ?ymin ?ymax)

  (test (eq ?lx (+ ?x 1)))
  (test (< (+ ?lx 1) ?xmax))
  (not (hueco =(+ ?lx 1) ?ly))
 =>
  (bind ?*nod-gen* (+ ?*nod-gen* 1))
  (assert (juego pos (+ ?x 1) ?y latas $?w lata (+ ?lx 1) ?ly $?z))
)
