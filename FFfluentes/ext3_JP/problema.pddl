(define (problem hotel-basic)
  (:domain hotel)

  (:objects
    h2 h4 - habitacion
    rA - reserva
    d1 d2 - dia
    n - direccion
  )

  (:init
    ;; capacidades
    (= (capacidad h2) 2)
    (= (capacidad h4) 4)

    ;; reserva de 2 personas
    (= (num-personas rA) 2)

    ;; intervalo y días de reserva
    (= (dia-inicio rA) 1)
    (= (dia-fin    rA) 2)
    (dia-de-reserva rA d1)
    (dia-de-reserva rA d2)

    ;; misma orientación para que no influya
    (orientacion h2 n)
    (orientacion h4 n)
    (preferencia rA n)

    ;; costes iniciales
    (= (coste-descartar) 0)
    (= (coste-orientacion) 0)
    (= (coste-desperdicio) 0)
  )

  (:goal
    (asignada rA)
  )

  (:metric minimize
    (+ (coste-descartar)
       (coste-orientacion)
       (* 1 (coste-desperdicio)))
  )
)
