ACA HAY GATO ENCERRADO

link a enunciado: https://sites.google.com/site/programacionui/material/tps/escape-del-laberinto

Contexto

-Un laberinto se compone de muchas habitaciones.
-Siempre hay una única habitación inicial y una única habitación final.
-En cada habitación se pueden realizar muchas acciones (las que la habitación admita).
-Las acciones permitidas las podemos categorizar en: 
  -moverse a una habitación permitida ==> Cuando nos movemos pasamos a esa habitación.
  -Agarrar un item (se agrega al inventario) ==> Cada jugador tiene un inventario asociado al laberinto que está queriendo resolver, cuando el juego inicia el inventario está vacío y se va llenando al agarrar items de las habitaciones. El inventario tiene un máximo de 15 items (cada unidad cuenta como un item, por ejemplo si tenemos 2 martillos ocupamos 2 lugares en el inventario) 
  -Usar item ==> Los items con los que cuenta el jugador en su inventario pueden ser usados, si la habitación admite el uso de un determinado item luego de producirse su uso se habilita otra acción y el item es destruido. Por ejemplo... si usamos la pala en una habitación que lo admitía ahora se habilitará la acción correspondiente (por ejemplo, poder moverse a otra habitación) y se pierde la pala usada (esto hace que se elimine del inventario).
  -Salir del laberinto ==> esta acción solo esta disponible en la habitación final, si salimos del laberinto entonces terminamos el nivel! (ganamos!)

-Aclaraciones: 
  -No pueden usarse items no permitidos por las habitaciones, por ejemplo si mi habitación permite usar item: pala (únicamente), seguro que no va a tener efecto alguno usar el item: llave.
  -No es necesario asegurar que el laberinto tenga solución -Un laberinto puede ser abandonado por el jugador si decide darse por vencido.
  -El inventario que posee el jugador está asociado al laberinto que está resolviendo, los items NO pueden compartirse entre laberintos.

-Ejemplo

-Configuraron el siguiente laberinto que se compone de 10 habitaciones:

0) Habitación inicial. Tiene como acciones
  -Ir a 1
  -Ir a 2

1) Tiene como acciones
  -ir a 0
  -Ir a 3
  -Agarrar item: llave mística

2) Tiene como acciones
  -Ir a 0
  -Agarrar item: piedra

3) Tiene como acciones
  -Ir a 1
  -Ir a 6
  -Usar item: llave mística =habilita=> Ir a 4

4) Tiene como acciones
  -Ir a 3
  -Ir a 7
  -Usar item: piedra =habilita=> Agarrar item punta de pala

5) Tiene como acciones
  -Ir a 5
  -Agarrar item: clavos

6) Tiene como acciones
  -Ir a 3
  -Usar item: punta de pala =habilita=> Ir a 9
  -Usar item: llave mística =habilita => Ir a 5

7) Tiene como acciones
  -Ir a 4
  -Agarrar item madera

8) Tiene como acciones
  -Ir a 9
  -Salir del laberinto
9) Tiene como acciones
  -Ir a 6
  -Usar item madera =habilita=> Ir a 8
-Para que un jugador supere este laberinto bien podría:

0)Ir a 2
1)Agarrar piedra
2)Ir a 0
3)Ir a 1
4)Agarrar llave mística
5)Ir a 3
6)Usar llave mítica
7)Ir a 4
8)Usar piedra
9)Agarrar punta de pala
10)Ir a 7
11)Agarrar madera
12)Ir a 4
13)Ir a 6
14)Usar punta de pala
15)Ir a 9
16)Usar madera
17)Ir a 8
18)Salir del laberinto
-Ayudas para encarar el problema

Para que sea mas simple de entender algunos computines nos regalaron algunas horas de su tiempo y nos ayudaron a masticar un poco el problema, el resultado de lo que estuvieron haciendo es un bosquejo con un poco de inspiración en historias de usuario que dejamos a continuación:

-Como administrador del sistema quiero:

0)crear, modificar y eliminar laberintos
1)crear (modificar y eliminar) habitaciones que admitan distintas acciones
2)marcar habitación como inicial
3)marcar habitación como final
4)crear acción de ir a otra habitación
5)crear acción de agarrar un item
6)crear acción de usar un item y definir que acción tiene como consecuencia
-Como participante quiero:

0)elegir un laberinto para poder jugarlo
1)realizar acciones disponibles dentro de las habitaciones:
2)moverme a la habitación permitida
3)agarrar un item disponible
4)usar un item permitido
5)salir del laberinto
6)conocer el inventario con el que cuento mientras estoy jugando
7)abandonar un laberinto
8)ver los laberintos que superé y los que abandoné
NOTAS: Es importante darnos cuenta que no es lo mismo un laberinto configurado (listo para que alguien lo juegue) que un laberinto que está siendo recorrido. Los laberintos se recorren por jugador pero el juego de uno no influye en el juego del otro.
