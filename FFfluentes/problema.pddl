(define (problem hotel-basic)
  (:domain hotel)

  (:objects
    ;; habitaciones
    h1 h2 - habitacion

    ;; reservas
    r1 r2 r3 - reserva

    ;; días
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - dia
  )

  (:init
    ;; capacidades de habitaciones
    (= (capacidad h1) 2)
    (= (capacidad h2) 4)

    ;; personas por reserva
    (= (num-personas r1) 2)
    (= (num-personas r2) 1)
    (= (num-personas r3) 3)

    ;; días de inicio y fin
    (= (dia-inicio r1) 1)
    (= (dia-fin    r1) 3)

    (= (dia-inicio r2) 3)
    (= (dia-fin    r2) 5)

    (= (dia-inicio r3) 2)
    (= (dia-fin    r3) 6)
  )

  (:goal
    (and
      (asignada r1)
      (asignada r2)
      (asignada r3)
    )
  )
)
