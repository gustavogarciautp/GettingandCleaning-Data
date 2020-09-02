El script run_analysis.R realiza la preparación y limpieza de los datos siguiendo los 5 pasos descritos en la definición del proyecto del curso.

Descarga de datos
En primer lugar descargué el conjunto de datos y extraje el archivo ZIP resultante en la carpeta llamada UCI HAR Dataset.

Lectura de datos
A continuación, realice la lectura de los archivos incluidos en el dataset, los cuales fueron almacenados en variables distintas:

La variable features almacena features.txt formado por 561 filas y 2 columnas. Esta variable provee a 561-feature vector with time and frequency domain variables.

La variable activities almacena activity_labels.txt formado por 6 filas y 2 columnas. This file links the class labels with their activity name.

La variable x_train almacena X_train.txt formado por 7352 filas y 561 columnas. Corresponde a los datos de entrenamiento. 

La variable y_train almacena y_train.txt formado por 7352 filas y 1 columna. Contiene las etiquetas de los datos de entrenamiento (código de actividades). 

La variable subject_train almacena subject_train.txt formado por 7352 filas y 1 columna. Este archivo contiene los identificadores de 21/30 voluntarios que realizaron el experimento.

La variable x_test almacena X_test.txt formado por 2947 filas y 561 columnas. Corresponde a los datos de prueba. 

La variable y_test almacena y_test.txt formado por 2947 filas y 1 columna. Contiene las etiquetas de los datos de prueba (código de actividades). 

La variable subject_test almacena subject_test.txt formado por 2947 filas y 1 columna. Este archivo contiene los identificadores de 9/30 voluntarios que realizaron el experimento.

Combinando los datos
El siguiente paso fue combinar el conjuntos de datos de entrenamiento y sus etiquetas para crear un conjunto de datos train (7352 filas, 564 columnas) mediante la funcion cbind(). El conjunto de datos de prueba y sus etiquetas se unen para crear un conjunto de datos test (2947 filas, 564 columnas) mediante la funcion cbind(). Finalmente, data (10299 filas, 564 columnas) se crea combinando train y test usando la función rbind().

Extracts only the measurements on the mean and standard deviation for each measurement
En este paso se actualiza la variable data (datos fusionados) seleccionando solo las columnas: IdSubject, Label y las medidas de la media y la desviación estándar (std) para cada medición. Esto genera un nuevo conjunto de datos con 
10299 filas y 88 columnas.

Uses descriptive activity names to name the activities in the data set
Aqui se reemplazan todos los valores numericos de la columna Label de data por los nombres de las actividades correspondientes tomadas de la segunda columna de la variable activities.

Appropriately labels the data set with descriptive variable names
En este paso se llevan a cabo los siguientes cambios en los nombres de las columnas de data:

- La columna Label en data se renombra a Activity 
- Todos los Acc son reemplazados por Accelerometer 
- Todos los Gyro son reemplazados por Gyroscope 
- Todos los nombres que comiencen con el caracter t son reeemplazados por Time.
- Todos los nombres que comiencen con el caracter f son reeemplazados por Frequency.
- Todos los puntos son eliminados.
- Todos los Mag son reemplazados por Magnitude
- angle es reeemplazo por Angle
- gravity es reemplazo por Gravity
- Todo BodyBody es reemplazado por Body
- mean es reeemplazo por Mean
- std es reeemplazado por STD

Creates a second, independent tidy data set with the average of each variable for each activity and each subject
data2 (180 filas, 88 columnas) se crea agrupando data por las columnas IdSubject y Activity y finalmente tomando the average of each variable for each activity and each subject. El conjunto de datos obtenido se exporta al archivo Data.txt.