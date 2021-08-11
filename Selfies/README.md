#  Selfies App

## Propósito

Examen de desarrollo de iOS de Andrés Nadal.

## Arquitectura y Frameworks

### MVC

Se eligió esta arquitectura, ya que se adapta de manera sencilla a las tecnologías de Apple, principalmente UIKit, al poder dividir la funcionalidad en diferentes componentes
con propósitos diferentes. Cabe destacar que es fácil no seguir esta arquitectura, si se utilizan inapropiadamente los `ViewController`, debido a que ellos solo deben de manejar 
la respuesta a los eventos, y no deben de contener el *view layer*

#### Model

Contiene la estructura de los datos a utilizar, principalmente las del servicio para las gráficas,
al servicio de `NetworkingService` y `FirebaseService`, los cuales proveen información al *controller layer*, para que la vea el usuario.

#### View

Incluye las celdas y su layout, se maneja el que y cómo de la interface.

#### Controller:

Incluye a `MainTableViewController`, el cual responde a las acciones del usuario.

### Charts

[Github repo](https://github.com/danielgindi/Charts)

Es una third-party dependency, para poder visualizar gráficas, elegí esta librería porque es madura por lo que podemos esperar que cambie poco con el tiempo, 
y tiene muchos contribuidores, por lo que errores o bugs, podrían ser actualizados con rapidez.


### Firebase (Storage, Real-time Database)

#### Background Color

La pantalla principal cambia de color según el valor en tiempo real de la base de datos de firebase.

[Link Firebase Real-time Database](https://selfies-7e028-default-rtdb.firebaseio.com/)


#### Selfies

Los selfies se suben a Firebase Cloud Storage.

[LInk Firebase Storage](gs://selfies-7e028.appspot.com/selfies)


## Documentación

Escribí la documentación del código en inglés para ser consistente con la terminología de Swift, como por ejemplo `View`.

## Otras notas

Se utilizó SwiftLint en el proyecto.

El API tenia un error de ortografía en `percetnage`, no cambie en el objeto `decodable`, el nombre.



# Preguntas


## Explique el ciclo de vida de un `UIViewController`:

Un `UIViewController`, invoca diferentes métodos, dependiendo su estado, nosotros podemos sobre-escribir estos métodos para implementar nuestra funcionalidad.

Por poner un ejemplo cuando aparezca el *view controller*, queremos que se haga un *network call*, para descargar información, ó quizás preferimos hacerlo en otro momento,
el ciclo de vida del `UIViewController` nos ayuda a lograr este objetivo.

1. viewDidLoad()
2. viewWillAppearI()
3. viewWillLayoutSubviews()
4. viewDidLayoutSubviews()
5. viewDidAppear()

Para cuando se termina de usar:

6. viewWillDisappear()
7. viewDidDisappear()

## Explique el ciclo de vida de una Aplicación:

Al igual que un `UIViewController`, se invocan diferentes métodos en relación al estado del App, aquí es importante mencionar que el App tiene un `AppDelegate` que nos dice del estado general del app,
y un `SceneDelegate`, que nos dice el estado de la ventana, donde esta la aplicación, por ejemplo, cuando la ventana va a entrar en reposo, porque el usuario fue al home screen. 

## En que casos se usa `weak`, `strong`, `unowned`.

Cuando utilizamos objetivos de tipo *referencia*, solo se apunta al cuando lo asignamos a una variable nueva, este no es el caso con los objetos de tipo *valor*, como `Int`.

Cuando una referencia hace referencia a otra, y esa hace referencia a la original, por default estas son `strong`, podemos entrar a un loop infinito, y ocasionar un *memory leak*, para evitar eso, podemos anotar propiedades con
`weak`, es decir la referencia se elimina cuando el objeto desaparece, gracias al sistema ARC, `unowned`, tiene una funcionalidad similar, con la diferencia en el compilador garantiza que no habra un valor `nil`.

## ¿Qué es ARC?

Automatic Reference Counting es un sistema de Apple, el cual lleva registro de todos los objetos de tipo referencia, es decir `classes`, y de cuantas referencias de tipo `strong` tiene, es decir cuantos `pointers` hacen referencia a este objetivo, cuanto estas lleguen a zero, el objetivo se borra de la memoria.

## Punto Extra

La pantalla será de color rojo.
