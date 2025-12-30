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

    (= (dia-inicio r2) 1)
    (= (dia-fin    r2) 3)

    (= (dia-inicio r3) 7)
    (= (dia-fin    r3) 8)
   
   ;; MAPEADO DE DIAS R1 ocupa días 1 a 3
   (dia-de-reserva r1 d1)
   (dia-de-reserva r1 d2)
   (dia-de-reserva r1 d3)

   ;; R2 ocupa días 1 a 3
   (dia-de-reserva r2 d1)
   (dia-de-reserva r2 d2)
   (dia-de-reserva r2 d3)

   ;; R3 ocupa días 1 a 3
   (dia-de-reserva r3 d7)
   (dia-de-reserva r3 d8)
  )

  (:goal
    (and
      (asignada r1)
      (asignada r2)
      (asignada r3)
    )
  )
)
