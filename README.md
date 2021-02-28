# Practica CIU: Superficie de revolución

Asignatura: Creando interfaces de usuario

Curso: 4º

Autor: Eduardo Maldonado Fernández

## Introducción
Se ha realizado un programa en processing que crear un prototipo que recoja puntos de un perfil del sólido de revolución al hacer clic
con el ratón sobre la pantalla. Sus controles son: con el click derecho del mouse se va marcando los puntos en la pantalla derecha para hacer el sólido, el click izquierdo resetear todos los puntos recogidos para volver a empezar a hacer el prototipo, con la tecla 's' se hace el sólido de revolución con los puntos recogidos hasta ese momento y con la tecla 'ENTER' se puede ver todos los controles necesarios explicados anteriormente.

## Descripción
Se ha hecho una pantalla inicial explicando los controles de como se dibujar el perfil del sólido y su posterior creación. Después, en el proceso de hacer el perfil del sólido, se ha dividido la pantalla a la mitad para que se pueda dibujar correctamente en el lado derecho. A continuación, cuando se crear el sólido de revolucion se muestra la figura y se puede mover a la vez que se mueve el mouse.
![Ejemplo de sólido de revolución](/example.gif "Ejemplo de sólido de revolución")

## Organización del código

<p style=”text-align: justify;”>Primero establecemos unas variables globales: declaramos unas variables booleanas que nos indicaran cuando se ha hecho el primer click derecho del ratón para empezar a recoger los puntos del perfil, una segunda variable booleana que nos avisa cuando se deba mostrar el sólido de revolución y otra variable booleanada que nos indica cuando se esta mostrando el menu de los controles.</p>
Después, existe una variable que es un arraylist de <PVector> que se recogen todas las posiciones clickadas por el usuario para el perfil del sólido. Además de los PShape para mostrar el perfil del sólido de revolución y el propio solido.

En la función setup() establecemos el tamaño de la pantalla, y diversos valores de las variables globales explicados anteriormente.

A partir de la función draw() llamaremos a una serie de funciones que explicamos su utilidad:

- **drawControl():** Con este función, se mostrará el menú de controles e inicial donde se explica los controles de teclado para dibujar el sólido.

-	**mousePressed():** Cuando se clicke tanto el click derecho como el izquierdo, esta función se llamara, en caso de que sea click derecho se va guardando los puntos escogidos por el usuario en la pantalla. Por el contrario si es el click izquierdo, se limpia el arraylist de las posiciones recogidas y se reinicia la pantalla.

-	**keyPressed():** Cuando se pulsa las teclas para mostrar el sólido de revolución (tecla 's' o tecla 'S') o el 'ENTER' para mostrar los controles o empezar a dibujar el perfil. 

-	**drawPerfilSolido():** Se llama a los distintos métodos del Pshape del objPerfil y vamos dibujando el perfil con los puntos recogidos en el arraylist y lo mostramos por pantalla.

-	**drawSolidoRevolucion():** Con esta función creamos el sólido de revolución, para ellos creamos una figura que nos dibuje los triangulos con "beginShape(TRIANGLE_STRIP), ahora tenemos que calcular la rotación de los puntos del perfil que estan en 2D para que sea 3D, por lo que es necesario recorrer todos los vertices del perfil y para cada uno de ellos calcularemos su posición desde 0º hasta 360º.

-	**rotacionPoints():** Mediante esta función llamada anteriormente en la función drawSolidoRevolucion, recibe como parametros los puntos del perfil de un vertice y un angulo para desplazarse y calculamos para los puntos X e Z su valor correspondiente para ese angulo en 3D.

## Descarga e instalación
Para poder probar este programa es necesario descargar el fichero drawFigure.pde
