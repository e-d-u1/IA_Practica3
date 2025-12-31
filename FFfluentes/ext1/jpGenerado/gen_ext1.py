import random

NUM_HABITACIONES = 3
NUM_RESERVAS = 10
NUM_DIAS = 30
MAX_DURACION = 7
SEED = 44

random.seed(SEED)

def gen_ext1_problem(nombre="hotel-ext1"):
    habitaciones = [f"h{i+1}" for i in range(NUM_HABITACIONES)]
    reservas = [f"r{i+1}" for i in range(NUM_RESERVAS)]
    dias = [f"d{i+1}" for i in range(NUM_DIAS)]

    out = []

    out.append(f"(define (problem {nombre})")
    out.append("  (:domain hotel)\n")

    # OBJETOS
    out.append("  (:objects")
    out.append("    " + " ".join(habitaciones) + " - habitacion")
    out.append("    " + " ".join(reservas) + " - reserva")
    out.append("    " + " ".join(dias) + " - dia")
    out.append("  )\n")

    out.append("  (:init")
    out.append("    (= (coste) 0)")

    # Capacidades
    out.append("    (= (capacidad h1) 2)")
    out.append("    (= (capacidad h2) 4)")
    out.append("    (= (capacidad h3) 3)")

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

    out.append("  )\n")

    # GOAL
    out.append("  (:goal")
    out.append("    (and")
    out.append("      (forall (?r - reserva)")
    out.append("        (or (asignada ?r) (descartada ?r))")
    out.append("      )")
    out.append("    )")
    out.append("  )")

    out.append("  (:metric minimize (coste))")
    out.append(")")
    
    return "\n".join(out)


if __name__ == "__main__":
    with open("problema-ext1-generado.pddl", "w") as f:
        f.write(gen_ext1_problem())
    print("problema-ext1-generado.pddl generado")
