(define (domain hotel)
  (:requirements :strips :typing :fluents)
  (:types
    reserva habitacion dia direccion
  )

  (:predicates
    (asignada ?r - reserva)
    (descartada ?r - reserva)

    (orientacion ?h - habitacion ?dir - direccion)
    (preferencia ?r - reserva ?dir - direccion)

    (ocupada ?h - habitacion ?d - dia)
    (dia-de-reserva ?r - reserva ?d - dia)
  )

  (:functions
    (num-personas ?r - reserva)
    (capacidad ?h - habitacion)
    (dia-inicio ?r - reserva)
    (dia-fin ?r - reserva)

    (coste-descartar)
    (coste-orientacion)
    (coste-desperdicio)
  )

  (:action asignar-reserva
    :parameters (?r - reserva ?h - habitacion)
    :precondition (and
      (not (asignada ?r))
      (<= (num-personas ?r) (capacidad ?h))
      (forall (?d - dia)
        (not (and (dia-de-reserva ?r ?d)
                  (ocupada ?h ?d))))
    )
    :effect (and
      (asignada ?r)
      (forall (?d - dia)
        (when (dia-de-reserva ?r ?d)
              (ocupada ?h ?d)))

      ;; orientación incorrecta
      (when (not (exists (?dir - direccion)
                 (and (preferencia ?r ?dir)
                      (orientacion ?h ?dir))))
        (increase (coste-orientacion) 1))

      ;; Extensión 3: desperdicio de plazas
      (increase (coste-desperdicio)
        (- (capacidad ?h) (num-personas ?r)))
    )
  )

  (:action descartar-reserva
    :parameters (?r - reserva)
    :precondition (and
      (not (asignada ?r))
      (not (descartada ?r))
    )
    :effect (and
      (descartada ?r)
      (increase (coste-descartar) 10)
    )
  )
)
