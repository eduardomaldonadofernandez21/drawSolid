# Practica CIU: Superficie de revolución

Asignatura: Creando interfaces de usuario

Curso: 4º

Autor: Eduardo Maldonado Fernández

## Introducción
Se ha realizado un programa en processing que crear un prototipo que recoja puntos de un perfil del sólido de revolución al hacer clic
con el ratón sobre la pantalla. Sus controles son: con el click derecho del mouse se va marcando los puntos en la pantalla derecha para hacer el sólido, el click izquierdo resetear todos los puntos recogidos para volver a empezar a hacer el prototipo, con la tecla 's' se hace el sólido de revolución con los puntos recogidos hasta ese momento y con la tecla 'ENTER' se puede ver todos los controles necesarios explicados anteriormente.

## Descripción


## Organización del código

<p style=”text-align: justify;”>Primero establecemos unas variables globales: para la posición de la bola y su movimiento en el ejeX y ejeY, así como las posiciones de las paletas y su tamaño, necesitaremos obtener sus coordenadas. También, establecemos como globales los valores de los marcadores, así como dos variables booleanas que se activará cuando se pausa la partida o se marca un gol para que haya un nuevo saque inicial.</p>


En la función setup() establecemos el tamaño de la pantalla, y diversos valores de las variables globales como son coordenadas de los jugadores y la bola, como cargamos los sonidos correspondientes.

A partir de la función draw() llamaremos a una serie de funciones que explicamos su utilidad:

- **pantallaInicio():** Con este función, se mostrará el menú de pausa e inicial donde se explica los controles de teclado para jugar.

-	**posicionesSaquePlayer():** En caso de gol, las paletas de los jugadores vuelven a su posición inicial en el medio del ejeY para que no tenga ningún tipo de dificultad al procederse con el saque de partida.

-	**keyPressed():** Cuando se pulsa las teclas de los jugadores (teclas UP-DOWN o teclas ‘s’-‘w’) se cambian las coordenadas del ejeY de las paletas. Sin embargo, con la tecla ‘P’ se procede a empezar una partida cambiando la variable booleana ‘pausaGame’ o a pausar una partida. 

-	**keyReleased():** Al dejar de presionar una tecla, se queda en la posición actual las paletas correspondientes.

-	**controlPlayers():** Para que las paletas de los jugadores no se sobresalgan de la pantalla, existe una serie de controles tanto por la zona superior e inferior para que se visualice por pantalla.

-	**controlBall():** Comprobamos si la bola colisiona con algunas de las paredes. En caso de que colisione con la pared superior o inferior, simplemente cambia las coordenadas invirtiendo el símbolo de la coordenada del movimiento de la pelota. Si choca contra la pared de la derecha o izquierda, significa que se ha producido un gol, por lo que habrá que empezar un nuevo saque inicial.

-	**detectBallByPlayer():** Cuando la pelota choca contra una de las paletas de los jugadores, el movimiento de la pelota cambia su dirección dirigiéndose hacia el otro campo del rival.

-	**marcador():** Sitúa un marcador en la zona superior de la pantalla indicando cuantos goles lleva cada jugador.

-	**mitadCampo():** Dibuja la línea discontinua en la mitad de la pantalla que hacer una separación entre ambos campos de cada jugador.

## Descarga e instalación
Para poder probar MyPong es necesario descargar todos los archivos del repositorio debido a que la carpeta Data contiene las fuentes de las letras utilizadas y los archivos *.wav son los sonidos correspondientes del juego.
