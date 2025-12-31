(define (domain hotel)
  (:requirements :adl :typing :fluents)

  (:types
    reserva habitacion dia
  )


   (:predicates
      ;; la reserva ya ha sido asignada a alguna habitación
      (asignada ?r - reserva)

      ;; la reserva r está asignada a la habitación h
      (ocupa ?r - reserva ?h - habitacion)

      ;; la habitación h está ocupada el día d
      (ocupada ?h - habitacion ?d - dia)
      (dia-de-reserva ?r - reserva ?d - dia)
   )

   (:functions
      ;; número de personas de la reserva
      (num-personas ?r - reserva)

      ;; capacidad de la habitación
      (capacidad ?h - habitacion)

      ;; intervalo de la reserva
      (dia-inicio ?r - reserva)
      (dia-fin ?r - reserva)
   )

   (:action asignar-reserva
      :parameters (?r - reserva ?h - habitacion)
      :precondition (and
         (not (asignada ?r))
         (<= (num-personas ?r) (capacidad ?h))
         ;; comprueba que ningún día esté ocupado
         (forall (?d - dia)
            (not (and (dia-de-reserva ?r ?d)
                     (ocupada ?h ?d))))
      )
      :effect (and
         (asignada ?r)
         ;; marca los días como ocupados
         (forall (?d - dia)
            (when (dia-de-reserva ?r ?d)
                  (ocupada ?h ?d)))
      )
   )


)