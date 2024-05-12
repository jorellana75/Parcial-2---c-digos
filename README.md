## Serie 2 - Segundo Parcial

Para esta serie, se debía realizar una máquina de estados finitos dependiendo de los estados que se presentan en esta imagen. 
![image](https://github.com/jorellana75/Parcial-2---c-digos/assets/162061174/4f5b320c-7d37-4536-957a-e6c6e32685a1)

Ahora, al tener que agregarle algo único por estudiante, se le agregó otro estado S4, el cual pone ambos semáforos en rojo al presionar la entrada R. El diagrama quedaría de esta manera ya con el nuevo estado S4 agregado:


![Diagrama de estados](https://github.com/jorellana75/Parcial-2---c-digos/assets/162061174/23dcff8b-8e3f-4a5a-9d4c-cfbd09c8e89e)


## Serie 3 - Segundo parcial

#### RTL code
En este paso, se realiza la programación en HDL describiendo la lógica que tiene nuestra FSM, indicando cómo es que se pasará a los siguientes estados y dependiendo de cómo se comporten las entradas. En este caso, se realizó un código en dónde se establecen distintos casos para determinar cada estado y cómo es que van a ir cambiando, los cuales se encuentran dentro de la función “always_comb” la cual describe como tal la lógica de la FSM.
![image](https://github.com/jorellana75/Parcial-2---c-digos/assets/162061174/c8633ce0-da02-4b2a-98d8-4f6dd4e0afd1)
![image](https://github.com/jorellana75/Parcial-2---c-digos/assets/162061174/6c6af898-64de-4940-96cd-2eb05cbd241d)
![image](https://github.com/jorellana75/Parcial-2---c-digos/assets/162061174/2448e096-6c3a-409e-aa0e-f907e2b614c9)

#### RTL Simulation
Para este paso, se realizó otro código distinto a los descritos anteriormente, en el que se relacionan las variables puestas en el código principal, con los valores que pueden tomar para observar su funcionamiento. A la hora de poder realizar la simulación, se puede observar también el esquemático de la FSM programada. En la simulación podemos observar como es que van cambiando los valores de las salidas (los colores de los semáforos de la avenida y del boulevard) dependiendo del valor que toman nuestras entradas (TA, TB y E).
![image](https://github.com/jorellana75/Parcial-2---c-digos/assets/162061174/5722dc12-0fab-4cd7-b869-ddfedc7f9fe7)
![image](https://github.com/jorellana75/Parcial-2---c-digos/assets/162061174/6fa0ea03-d8ab-4e72-b8d8-727fbb8fb044)
![image](https://github.com/jorellana75/Parcial-2---c-digos/assets/162061174/be40298b-2fa8-4472-8854-46770c0730f0)

#### Synthesis
En este paso, se muestran la conversión del código a nivel de compuertas y flip-flops, con lo que se puede ver también cuales están activadas y su conectividad. Se pueden ver todos los MUX y Flip-Flop usados para el funcionamiento de la FSM. Como se puede observar, las compuertas y demás componentes utilizados están marcados en color naranja.

![image](https://github.com/jorellana75/Parcial-2---c-digos/assets/162061174/d489fd56-d5cc-4a04-bfb6-0f21584084c8)
![image](https://github.com/jorellana75/Parcial-2---c-digos/assets/162061174/b8c1c2ab-191d-4255-8837-e731f52de23f)

#### Implementation
En este paso, se muestran como tal las conexiones y enrutamientos de todos los componentes con las entradas y salidas correspondientes, o bien, las conexiones entre las compuertas y los flip-flops utilizados. 
![image](https://github.com/jorellana75/Parcial-2---c-digos/assets/162061174/c1966023-f827-4221-a8c3-60403a2251a2)
![image](https://github.com/jorellana75/Parcial-2---c-digos/assets/162061174/caee2e6e-2ab9-42ea-bdad-1d1206f4d482)

#### Static Time Analysis
Este paso ayuda a analizar el comportamiento de la lógica de nuestra máquina de estados finitos y del comportamiento de nuestras salidas (luces del semáforo) con respecto a las entradas (TA, TB y E), en determinados períodos de tiempo. En la simulación se puede observar como cambian los valores tanto de las entradas como de las salidas, conforme los rangos de tiempo. 
![image](https://github.com/jorellana75/Parcial-2---c-digos/assets/162061174/41388b03-d719-4d4d-98d2-d877b65dbb79)
![image](https://github.com/jorellana75/Parcial-2---c-digos/assets/162061174/d607ba93-6218-4a66-9996-22bee76c55fa)

#### Device programming
En este paso, se conectó la placa Basys 3 a la computadora y se le cargó el código antes descrito, con el que se probó el correcto funcionamiento de la máquina de estados finitos. El funcionamiento se explicará en el video adjunto.


## Video y material adicional

Video: https://youtu.be/Q8Y9xtTbnmw
Material adicional: https://drive.google.com/drive/folders/1etB-zn321L3k2wnDE-NTn1UZH6quqibT?usp=sharing


