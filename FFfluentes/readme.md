En cada carpeta se encuentra el código usado para cada una de las extensiones junto a sus juegos de pruebas y salidas.

Para ejecutar en windows se ha usado: 
   % metricff.exe -O -o dominio.pddl -f problema.pddl 
Para ejecutar en linux: 
   ./Metric-FF/ff -o dominio.pddl -f problema.pddl 
En la carpeta correspondiente


El generador para cada una de las extensiones se encuentra dentro de la carpeta de JPGenerado que hay en cada una, es
también los juegos de prueba usados para la documentación. Para ejecutar el generador sólo hay que ejecutar el archivo python:
   % python generador_ext<n>.py
A continuación usar el comando de metric especificado anteriormente pero cambiando:
problema.pddl --> problema-generado-ext<n>.pddl 

Por último, recordar que tal y como se dice en la documentación, fijarse en la seed de los generados para los juegos de prueba.