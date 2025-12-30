(define (problem hotel-basic)
  (:domain hotel)

  (:objects
    ;; habitaciones
    h1 h2 - habitacion

    ;; reservas
    r1 r2 r3 r4 - reserva

    ;; días
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - dia

    ;;orientacion
    n s e o - direccion
  )

  (:init
    ;; capacidades de habitaciones
    (= (capacidad h1) 2)
    (= (capacidad h2) 4)

    ;; personas por reserva
    (= (num-personas r1) 2)
    (= (num-personas r2) 1)
    (= (num-personas r3) 2)
    (= (num-personas r4) 1)

    ;; días de inicio y fin
    (= (dia-inicio r1) 1)
    (= (dia-fin    r1) 7)

    (= (dia-inicio r2) 1)
    (= (dia-fin    r2) 7)

    (= (dia-inicio r3) 1)
    (= (dia-fin    r3) 4)

    (= (dia-inicio r4) 5)
    (= (dia-fin    r4) 8)
   
   ;; MAPEADO DE DIAS R1 ocupa días 1 a 7
   (dia-de-reserva r1 d1)
   (dia-de-reserva r1 d2)
   (dia-de-reserva r1 d3)
   (dia-de-reserva r1 d4)
   (dia-de-reserva r1 d5)
   (dia-de-reserva r1 d6)
   (dia-de-reserva r1 d7)

   ;; R2 ocupa días 1 a 7
   (dia-de-reserva r2 d1)
   (dia-de-reserva r2 d2)
   (dia-de-reserva r2 d3)
   (dia-de-reserva r2 d4)
   (dia-de-reserva r2 d5)
   (dia-de-reserva r2 d6)
   (dia-de-reserva r2 d7)

   ;;R3 ocupa dias 1 4
   (dia-de-reserva r3 d1) (dia-de-reserva r3 d2) (dia-de-reserva r3 d3) (dia-de-reserva r3 d4)

   ;; R4 ocupa días 1 a 3
   (dia-de-reserva r4 d5) (dia-de-reserva r4 d6) (dia-de-reserva r4 d7) (dia-de-reserva r4 d8)

    ;; orientación de las habitaciones
    (orientacion h1 n)
    (orientacion h2 s)

    ;; preferencias de las reservas
    (preferencia r1 n)
    (preferencia r2 s)
    (preferencia r3 n)
    (preferencia r4 n)

    (= (coste-descartar) 0)
    (= (coste-orientacion) 0)
    (= (coste-desperdicio) 0)
  )

  (:goal
    (and
      (forall (?r - reserva)
        (or (asignada ?r) (descartada ?r)))
    )

  (:metric minimize
  (+ (coste-descartar)
     (coste-orientacion)
     (* 0.5 (coste-desperdicio)))  
))
)
