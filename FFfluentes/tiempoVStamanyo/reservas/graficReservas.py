import subprocess
import time
import matplotlib.pyplot as plt
import os

# Configuración
num_dias = 30
max_habitaciones = 6
max_reservas = 20
dominio = "dominio.pddl"   # tu dominio
generador = "gen_ext4.py"       # script generador
resultados = []

# Puedes variar habitaciones fijas y solo cambiar reservas para ver tendencia
habitaciones_fijas = 4
reservas_lista = list(range(5, max_reservas+1, 2))  # probar con 5, 8, 11, 14, 17, 20 reservas

for reservas in reservas_lista:
    nombre_problema = f"problema_h{habitaciones_fijas}_r{reservas}"
    
    # Generar fichero PDDL
    print(f"Generando problema con {habitaciones_fijas} habitaciones y {reservas} reservas...")
    subprocess.run(["python", generador, "--habitaciones", str(habitaciones_fijas),
                    "--reservas", str(reservas), "--nombre", nombre_problema])
    
    fichero_problema = f"{nombre_problema}.pddl"
    
    # Ejecutar   
    print(f"Resolviendo {fichero_problema}...")
    start = time.time()
    try:
        subprocess.run(["metricff.exe", "-O", "-o", dominio, "-f", fichero_problema],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=True)
        tiempo = time.time() - start
    except subprocess.CalledProcessError:
        tiempo = None
        print(f"Error al resolver {fichero_problema}")
    
    print(f"Tiempo de resolución: {tiempo:.2f} s" if tiempo else "No resuelto")
    resultados.append((reservas, tiempo))
    

reservas_vals = [x[0] for x in resultados if x[1] is not None]
tiempos = [x[1] for x in resultados if x[1] is not None]

plt.figure(figsize=(8,5))
plt.plot(reservas_vals, tiempos, marker='o')
plt.xlabel("Número de reservas")
plt.ylabel("Tiempo de resolución (s)")
plt.title(f"Tendencia de resolución con {habitaciones_fijas} habitaciones")
plt.grid(True)
plt.show()
