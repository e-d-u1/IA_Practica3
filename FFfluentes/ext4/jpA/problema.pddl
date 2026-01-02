(define (problem hotel-basic)
  (:domain hotel)

  (:objects
    ;; habitaciones
    hBig hSmall1 hSmall2 hSmall3 - habitacion

    ;; reservas
    r1 r2 r3 - reserva

    ;; días
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - dia

    ;; orientación (no influye)
    n - direccion
  )

  (:init
    ;; capacidades
    (= (capacidad hBig) 4)
    (= (capacidad hSmall1) 2)
    (= (capacidad hSmall2) 2)
    (= (capacidad hSmall3) 2)

    ;; reservas de 2 personas
    (= (num-personas r1) 2)
    (= (num-personas r2) 2)
    (= (num-personas r3) 2)

    ;; intervalos y días de cada reserva, sin solaparse entre ellas
    ;; r1: días 1-3
    (= (dia-inicio r1) 1)
    (= (dia-fin    r1) 3)
    (dia-de-reserva r1 d1)
    (dia-de-reserva r1 d2)
    (dia-de-reserva r1 d3)

    ;; r2: días 4-6
    (= (dia-inicio r2) 4)
    (= (dia-fin    r2) 6)
    (dia-de-reserva r2 d4)
    (dia-de-reserva r2 d5)
    (dia-de-reserva r2 d6)

    ;; r3: días 7-9
    (= (dia-inicio r3) 7)
    (= (dia-fin    r3) 9)
    (dia-de-reserva r3 d7)
    (dia-de-reserva r3 d8)
    (dia-de-reserva r3 d9)

    ;; orientación: todas compatibles para que no influya Ext. 2
    (orientacion hBig n)
    (orientacion hSmall1 n)
    (orientacion hSmall2 n)
    (orientacion hSmall3 n)
    (preferencia r1 n)
    (preferencia r2 n)
    (preferencia r3 n)

    ;; costes iniciales
    (= (coste-descartar) 0)
    (= (coste-orientacion) 0)
    (= (coste-desperdicio) 0)
    (= (coste-habitaciones) 0)
  )

  (:goal
    (and
      (asignada r1)
      (asignada r2)
      (asignada r3)
    )
  )

  ;; descartar muy caro; abrir habitaciones más caro que desperdiciar
  (:metric minimize
    (+ (coste-descartar)
       (+ (coste-orientacion)
          (+ (* 2 (coste-habitaciones))
             (coste-desperdicio))))
  )
)
