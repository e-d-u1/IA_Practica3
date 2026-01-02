import random
import argparse

MAX_DURACION = 7
NUM_DIAS = 30
direcciones = ["n", "s", "e", "o"]
SEED = 5

random.seed(SEED)

def gen_ext4_problem(nombre="hotel-ext4", num_habitaciones=4, num_reservas=10, capacidades=None):
    habitaciones = [f"h{i+1}" for i in range(num_habitaciones)]
    reservas = [f"r{i+1}" for i in range(num_reservas)]
    dias = [f"d{i+1}" for i in range(NUM_DIAS)]

    # Si no se pasan capacidades, se asignan aleatorias entre 1 y 4
    if capacidades is None:
        capacidades = [random.randint(1, 4) for _ in range(num_habitaciones)]
    elif len(capacidades) < num_habitaciones:
        # completar con aleatorias si no se especifican todas
        capacidades += [random.randint(1, 4) for _ in range(num_habitaciones - len(capacidades))]

    out = []

    out.append(f"(define (problem {nombre})")
    out.append("  (:domain hotel)\n")

    # OBJETOS
    out.append("  (:objects")
    out.append("    " + " ".join(habitaciones) + " - habitacion")
    out.append("    " + " ".join(reservas) + " - reserva")
    out.append("    " + " ".join(dias) + " - dia")
    out.append("    " + " ".join(direcciones) + " - direccion")
    out.append("  )\n")

    # INIT
    out.append("  (:init")
    out.append("    (= (coste-descartar) 0)")
    out.append("    (= (coste-orientacion) 0)")
    out.append("    (= (coste-desperdicio) 0)")
    out.append("    (= (coste-habitaciones) 0)")

    # Capacidades
    for h, cap in zip(habitaciones, capacidades):
        out.append(f"    (= (capacidad {h}) {cap})")

    # Orientaciones de habitaciones
    for h in habitaciones:
        orient = random.choice(direcciones)
        out.append(f"    (orientacion {h} {orient})")

    # Reservas
    for r in reservas:
        personas = random.randint(1, 3)
        inicio = random.randint(1, NUM_DIAS)
        duracion = random.randint(1, MAX_DURACION)
        fin = min(inicio + duracion - 1, NUM_DIAS)

        out.append(f"\n    (= (num-personas {r}) {personas})")
        out.append(f"    (= (dia-inicio {r}) {inicio})")
        out.append(f"    (= (dia-fin {r}) {fin})")

        for d in range(inicio, fin + 1):
            out.append(f"    (dia-de-reserva {r} d{d})")

        pref = random.choice(direcciones)
        out.append(f"    (preferencia {r} {pref})")

    out.append("  )\n")

    # GOAL
    out.append("  (:goal")
    out.append("    (and")
    out.append("      (forall (?r - reserva)")
    out.append("        (or (asignada ?r) (descartada ?r))")
    out.append("      )")
    out.append("    )")
    out.append("  )")

    # METRIC
    out.append(
        "(:metric minimize "
        "(+ (coste-descartar) "
        "   (+ (coste-orientacion) "
        "      (+ (* 0.25 (coste-habitaciones)) "
        "         (* 0.5 (coste-desperdicio))))))"
    )

    out.append(")")

    return "\n".join(out)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generador de problemas hotel-ext4 PDDL.")
    parser.add_argument("--habitaciones", type=int, default=4, help="Número de habitaciones")
    parser.add_argument("--reservas", type=int, default=10, help="Número de reservas")
    parser.add_argument("--nombre", type=str, default="hotel-ext4", help="Nombre del fichero problema")
    args = parser.parse_args()

    contenido = gen_ext4_problem(nombre=args.nombre, num_habitaciones=args.habitaciones, num_reservas=args.reservas)

    archivo_salida = f"{args.nombre}.pddl"
    with open(archivo_salida, "w") as f:
        f.write(contenido)

    print(f"{archivo_salida} generado con {args.habitaciones} habitaciones y {args.reservas} reservas")
