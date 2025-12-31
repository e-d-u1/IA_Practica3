(define (problem hotel-basic)
  (:domain hotel)

  (:objects
    h1 h2 h3 - habitacion
    r1 r2 r3 r4 r5 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (capacidad h1) 2)
    (= (capacidad h2) 4)
    (= (capacidad h3) 3)

    (= (num-personas r1) 2)
    (= (dia-inicio r1) 7)
    (= (dia-fin r1) 9)
    (dia-de-reserva r1 d7)
    (dia-de-reserva r1 d8)
    (dia-de-reserva r1 d9)

    (= (num-personas r2) 1)
    (= (dia-inicio r2) 21)
    (= (dia-fin r2) 21)
    (dia-de-reserva r2 d21)

    (= (num-personas r3) 3)
    (= (dia-inicio r3) 25)
    (= (dia-fin r3) 30)
    (dia-de-reserva r3 d25)
    (dia-de-reserva r3 d26)
    (dia-de-reserva r3 d27)
    (dia-de-reserva r3 d28)
    (dia-de-reserva r3 d29)
    (dia-de-reserva r3 d30)

    (= (num-personas r4) 1)
    (= (dia-inicio r4) 28)
    (= (dia-fin r4) 30)
    (dia-de-reserva r4 d28)
    (dia-de-reserva r4 d29)
    (dia-de-reserva r4 d30)

    (= (num-personas r5) 3)
    (= (dia-inicio r5) 15)
    (= (dia-fin r5) 16)
    (dia-de-reserva r5 d15)
    (dia-de-reserva r5 d16)
  )

  (:goal
    (and
      (asignada r1)
      (asignada r2)
      (asignada r3)
      (asignada r4)
      (asignada r5)
    )
  )
)