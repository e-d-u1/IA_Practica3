import subprocess
import time
import matplotlib.pyplot as plt

# Configuración
dominio = "dominio.pddl"
generador = "gen_ext4.py"

reservas_fijas = 10
habitaciones_lista = list(range(2, 17))  # probar de 2 a 16 habitaciones
resultados = []

for habitaciones in habitaciones_lista:
    nombre_problema = f"problema_h{habitaciones}_r{reservas_fijas}"

    # Generar problema
    print(f"\nGenerando problema con {habitaciones} habitaciones y {reservas_fijas} reservas...")
    subprocess.run([
        "python", generador,
        "--habitaciones", str(habitaciones),
        "--reservas", str(reservas_fijas),
        "--nombre", nombre_problema
    ])

    fichero_problema = f"{nombre_problema}.pddl"

    # Ejecutar metric-FF
    print(f"Resolviendo {fichero_problema}...")
    start = time.time()
    try:
        subprocess.run(
            ["metricff.exe", "-O", "-o", dominio, "-f", fichero_problema],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            check=True
        )
        tiempo = time.time() - start
        print(f"Tiempo de resolución: {tiempo:.2f} s")
    except subprocess.CalledProcessError:
        tiempo = None
        print("Error al resolver el problema.")

    resultados.append((habitaciones, tiempo))

# Filtrar resultados válidos
habitaciones_vals = [x[0] for x in resultados if x[1] is not None]
tiempos = [x[1] for x in resultados if x[1] is not None]

# Gráfica
plt.figure(figsize=(8, 5))
plt.plot(habitaciones_vals, tiempos, marker='o')
plt.xlabel("Número de habitaciones")
plt.ylabel("Tiempo de ejecución (s)")
plt.title(f"Tiempo de ejecución vs número de habitaciones ({reservas_fijas} reservas)")
plt.grid(True)
plt.show()
