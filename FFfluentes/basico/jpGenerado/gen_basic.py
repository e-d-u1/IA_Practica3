import random

NUM_HABITACIONES = 3
NUM_RESERVAS = 5
NUM_DIAS = 30
MAX_DURACION = 7
SEED = 88

random.seed(SEED)

def gen_basic_problem(nombre="hotel-basic"):
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

    # Capacidades --> Hardcodeeado en todas las extensiones menos la 4.
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
    for r in reservas:
        out.append(f"      (asignada {r})")
    out.append("    )")
    out.append("  )")
    out.append(")")

    return "\n".join(out)


if __name__ == "__main__":
    with open("problema-basico-generado.pddl", "w") as f:
        f.write(gen_basic_problem())
    print("problema-basico-generado.pddl generado")
