(define (problem hotel-ext1)
  (:domain hotel)

  (:objects
    h1 h2 h3 - habitacion
    r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 - reserva
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init
    (= (coste) 0)
    (= (capacidad h1) 2)
    (= (capacidad h2) 4)
    (= (capacidad h3) 3)

    (= (num-personas r1) 2)
    (= (dia-inicio r1) 17)
    (= (dia-fin r1) 21)
    (dia-de-reserva r1 d17)
    (dia-de-reserva r1 d18)
    (dia-de-reserva r1 d19)
    (dia-de-reserva r1 d20)
    (dia-de-reserva r1 d21)

    (= (num-personas r2) 3)
    (= (dia-inicio r2) 28)
    (= (dia-fin r2) 28)
    (dia-de-reserva r2 d28)

    (= (num-personas r3) 1)
    (= (dia-inicio r3) 13)
    (= (dia-fin r3) 14)
    (dia-de-reserva r3 d13)
    (dia-de-reserva r3 d14)

    (= (num-personas r4) 2)
    (= (dia-inicio r4) 1)
    (= (dia-fin r4) 2)
    (dia-de-reserva r4 d1)
    (dia-de-reserva r4 d2)

    (= (num-personas r5) 1)
    (= (dia-inicio r5) 19)
    (= (dia-fin r5) 19)
    (dia-de-reserva r5 d19)

    (= (num-personas r6) 1)
    (= (dia-inicio r6) 6)
    (= (dia-fin r6) 12)
    (dia-de-reserva r6 d6)
    (dia-de-reserva r6 d7)
    (dia-de-reserva r6 d8)
    (dia-de-reserva r6 d9)
    (dia-de-reserva r6 d10)
    (dia-de-reserva r6 d11)
    (dia-de-reserva r6 d12)

    (= (num-personas r7) 3)
    (= (dia-inicio r7) 23)
    (= (dia-fin r7) 25)
    (dia-de-reserva r7 d23)
    (dia-de-reserva r7 d24)
    (dia-de-reserva r7 d25)

    (= (num-personas r8) 3)
    (= (dia-inicio r8) 21)
    (= (dia-fin r8) 24)
    (dia-de-reserva r8 d21)
    (dia-de-reserva r8 d22)
    (dia-de-reserva r8 d23)
    (dia-de-reserva r8 d24)

    (= (num-personas r9) 3)
    (= (dia-inicio r9) 13)
    (= (dia-fin r9) 19)
    (dia-de-reserva r9 d13)
    (dia-de-reserva r9 d14)
    (dia-de-reserva r9 d15)
    (dia-de-reserva r9 d16)
    (dia-de-reserva r9 d17)
    (dia-de-reserva r9 d18)
    (dia-de-reserva r9 d19)

    (= (num-personas r10) 3)
    (= (dia-inicio r10) 22)
    (= (dia-fin r10) 24)
    (dia-de-reserva r10 d22)
    (dia-de-reserva r10 d23)
    (dia-de-reserva r10 d24)
  )

  (:goal
    (and
      (forall (?r - reserva)
        (or (asignada ?r) (descartada ?r))
      )
    )
  )
  (:metric minimize (coste))
)