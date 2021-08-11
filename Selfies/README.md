#  Selfies App

## Propósito

Examen de desarrollo de iOS de Andrés Nadal.

## Arquitectura y Frameworks

### UIKit

Para tomar selfies

Para mostrar los datos adquiridos del servicio:
[Link del servicio](https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld)

Se construyó un `DiffableDataSource`, el cual permite a `UITableViewController`, animar los cambios en la base de datos.


### Charts

[Github repo](https://github.com/danielgindi/Charts)

Es una third-party dependency, para poder visualizar gráficas, elegí esta librería porque es madura por lo que podemos esperar que cambie poco con el tiempo, y tiene muchos contribuidores, por lo que errores o bugs, podrían ser actualizados con rapidez.


### Firebase (Storage, Real-time Database)

#### Background Color

La pantalla principal cambia de color según el valor en tiempo real de la base de datos de firebase.

[Link Firebase Real-time Database](https://selfies-7e028-default-rtdb.firebaseio.com/)


#### Selfies

Los selfies se suben a Firebase Cloud Storage, 


## Documentación

Escribí la documentación del código en inglés para ser consistente con la terminología de Swift, como por ejemplo `View`.

## Otras notas

Se utilizó SwiftLint en el proyecto.

El API tenia un error de ortografía en `percetnage`, no cambie en el objeto `decodable`, el nombre.



# Preguntas


## Explique el ciclo de vida de un `UIViewController`:

Un `UIViewController`, invoca diferentes métodos, dependiendo su estado, nosotros podemos sobre-escribir estos métodos para implementar nuestra funcionalidad.

1. viewDidLoad()
2. viewWillAppearI()
3. 

## Explique el ciclo de vida de una Aplicación:

eraer

## En que casos se usa `weak`, `strong`, `unowned`.

reare 

## ¿Qué es ARC?

Automatic Reference Counting es un sistema de Apple, el cual lleva registro de todos los objetos de tipo referencia, es decir `classes`, y de cuantas referencias de tipo `strong` tiene, es decir cuantos `pointers` hacen referencia a este objetivo, cuanto estas lleguen a zero, el objetivo se borra de la memoria.

## Punto Extra
