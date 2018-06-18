# human-activity-recongnition

El objetivo es preparar datos ordenados que puedan usarse para análisis posteriores. 
EL proceso es realizado por el script run_analysis.R:

## Leer archivos con conjuntos de datos

Leer los datos X_train.txt y X_test.txt y juntarlos en un data set.

## Seleccionar subconunto de columnas.

Las medidas que fueron representantes para este análisis fueron todos los promedios y StdDev. 

## Etiquetar el conjunto de datos 

Etiqueta columnas con nombres de los archivos features.txt, subjects_train.txt y subjects_test.txt. 

## Calcula promedio 

Por medio del paquete dplyr calcula el promedio de cada variable para cada actividad y cada tema. 

## Generación de archivo 
Finalmente guarda el resultado en un archivo txt.


