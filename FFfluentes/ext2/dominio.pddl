(define (domain hotel)
  (:requirements :adl :typing :fluents)

  (:types
    reserva habitacion dia direccion
  )

  (:predicates
      ;; la reserva ya ha sido asignada a alguna habitación
      (asignada ?r - reserva)
      (descartada ?r - reserva)

      ;; Ext2: orientación de habitación y preferencia de reserva
      (orientacion ?h - habitacion ?dir - direccion)
      (preferencia ?r - reserva ?dir - direccion)

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

      (coste-descartar)  ;; coste por descartar
      (coste-orientacion) ;; coste por asignar con orientación incorrecta
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
         ;; penalización si orientación no coincide
         (when (not (exists (?dir - direccion)
                    (and (preferencia ?r ?dir) (orientacion ?h ?dir))))
            (increase (coste-orientacion) 1))
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
