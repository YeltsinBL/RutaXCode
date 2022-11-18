# Ruta Básica en XCode
## _Ejercicios iniciales para aplicaciones móviles en XCode utilizando SwiftUI y UIKit._
Descripción de todo lo que se realizó en esta rama.

En `ContentView` utilice los Stack y Spacer:
- VStack: ordena los elementos en forma vertical.
- HStack: ordena los elementos en forma horizontal.
- ZStack: ordena los elementos uno encima del otro.
- Spacer: empuja los elementos para ocupar lo máximo posible de la pantalla y los separa uniformemente

> Nota: Cada Stack puede contener 10 elementos como máximo, si se requiere agregar más elementos, se debe agregar otro Stack al Stack principal y en él se puede seguir agregando más elementos.

En `ImageView` agregue una imagen a los assets y utilice Símbolos SF, las propiedades de imagen que utilice fueron:
- Resizable: para que entre la imagen en todos los márgenes de la vista pero se deforma
- ScaledToFill: para que crezca lo máximo a lo alto
- ScaledToFit: para que crezca lo máximo a lo ancho
- Frame: para dar un tamaño exacto
- ClipShape: delimitar el margen visible de la imagen
- Padding después del frame, limita el tamaño exterior de la imagen pero sí se utiliza antes, se aplica a la imagen y después la redimensión.
- Overlay: se puede agregar el borde del circulo de la imagen y demás propiedades, en este caso el grosor
- shadow: aplicar sombra, primero se agrega el color y luego el tamaño de expansión 

En `MapView` agregamos un mapa a la vista y esto es lo que se hizo:
- Importamos `MapKit` para agregar un mapa.
- Cambiamos el `View` por `UIViewRepresentable` para incorporar un objeto vista de UIKit dentro de un objeto vista de SwiftUI.
- Eliminamos el body que retorna una view de swiftUI porque debemos de retornar una vista de UIKit.
- Agregamos la función `makeUIView` porque retorna una vista de UIKit.
- Cambiamos el `"some View"` por un `MKMapView`.
- Retornamos el objeto `MKMapView` de UIKit.
- Agregamos la función `updateUIView` para actualizar/trabajar en este mapa.
- Fijamos las coordenadas (latitud y longitud) en `CLLocationCoordinate2D`.
- Delimita la región que se quiere mostrar en el mapa en forma de grados en `MKCoordinateSpan`.
- Fijamos la región en el mapa.

> Nota: Para agregar todas las vistas en una sola, los agrupamos en un `ScrollView` y luego en VStack para que se visualicen verticalmente.
Para que el mapa se visualice se debe de definir un tamaño.

En `ListView` agregue un listado en el que se puede navegar entre pantallas y a la vez actualizar como filtrar por estado.
* Fuera de la estructura de la vista:
    * Se creo una clase mutable `ObservableObject` para que se pueda actualizar su estado.
    * La propiedad de la clase debe estar publicando su valor para que se pueda interactuar con ella.
 
* Dentro de la `estructura` pero fuera del Body:
    * Creamos una variable booleana con estado falso para que sea la que se pueda filtrar, el tipo de `Property Wrapper` es `State` porque solo se utilizara en esta vista.
    * Instanciamos  a la clase para el listado y agregamos `EnvironmentObject` para que se pueda acceder a los datos de la lista, debemos de asegurarnos que deba de haber datos por eso lo instanciamos en el preview.
    * Creamos una nueva lista pero utilizando el estado (activo y/o todos) para filtrar y lo agregamos.

* Dentro del `body` de la estructura:
    * Agregamos la lista en un `NavigationView` para dar la funcionalidad de navegar haciendo clic en la lista.
    * Agregamos el Toggle para que sea quien filtre por el estado, el estado que recibe debe ser mutable para que acepte cambios, se le agrega al inicio el "$" para que acepte el valor.
    * A la lista le agregamos un array en la cual indicamos cual es la ruta clave (id) para que los agregue uno a uno cuantas veces sea necesario.
    * Agregamos el `RowView` dentro del `NavigationLink` donde se pone la vista a donde queremos ir.
    * Agregamos de la lista mutable y el estado para actualizar el valor

* En el `preview` agregamos:
    * Un `EnvironmentObject` para poder pasar los datos hacia la vista de `RowView`.

En `RowView`, diseñamos la vista de la lista:
* Dentro del body:
    * Agregamos un if para que interactúe con el el filtro por medio del estado.
* Dentro del previews:
    * Agregamos los datos que recibirá la vista.

En `ListDetailView` 
* Dentro de la estructura pero fuera del body:
    * Agregamos la estructura de la clase para que acepte datos de entrada al hacer clic en el listado anterior.
    * Agregamos una variable que será la modificada para el estado, la variable contiene una PropertyWrappers `Binding` que llega el valor desde otra vista y puede ser modificada.
* Dentro del previews:
    * Agregamos los datos que recibirá  la vista.

> Nota: Si no se agrega la información  que se va a pasar en el preview, mostrara error y no funcionara.

## Importante
### Property Wrappers
Los property wrappers utilizados en el listado para pasar datos a otra vista, actualizar y filtrar; fueron los siguientes:
* @State: cuando el valor se va a actualizar solo en la vista que a sido definida.
* @Binding: almacena y actualiza el valor de una variable que no a sido creada en la vista actual.
* @StateObject: tiene la misma funcionalidad que el State pero se utiliza con datos más  complejos.
* @ObservedObject: tiene la misma funcionalidad que el Binding pero se utiliza con datos más  complejos.
* @EnvironmentObject: tiene la misma funcionalidad que el ObservedObject pero se utiliza para enviar datos a mas de 2 vistas, podemos acceder desde cualquier parte de la aplicación  desde que se propaga
    * Tener en cuenta que el programa asume que se le ha asignado el `EnvironmentObject` por lo cual aparecerá  error hasta que se asigne.
> Nota: La clase debe ser mutable para estar observando cambios `ObservableObject` y que sus propiedades deben estar publicando su valor `@Published` para que la vista pueda leerla y modificarla.
Agregar el `EnvironmentObject` en el previews de la vista principal y de la misma vista a utilizar para que obtenga los datos .

# Utilizar FaceID
Lo principal que se debe de agregar al proyecto es la opción de `Privacy - Face ID Usage Description`, para ellos hacemos lo siguiente:
- Seleccionamos el proyecto base/principal `.xcodeproj`.
- Seleccionamos el nombre del proyecto en el `Targets`.
- De todas las opciones, seleccionamos `Info` y en `Custom iOS Target Properties` agregamos una nueva `Key` en la cual se selecciona `Privacy - Face ID Usage Description` y agregamos una descripción para que se muestre en la aplicación cuando no se logra autenticar.

> Nota: Para agregar una nueva `Key` se pone el cursor encima de las llaves/claves agregadas y hacemos clic en el botón '+', aparecerá una nueva fila para seleccionar la que hace referencia al "Face Id".

Para empezar a utilizar el FaceId lo primero que se debe de hacer en la vista es importar el 'LocalAuthentication'.
En esta ocasión crearemos una función en donde estará toda la lógica para la autenticación y que se utilizara en el body de la vista.
Dentro de la función haremos lo siguiente:
- Crearemos una variable para controlar los errores utilizando el `NSError`.
- Creamos otra variable utilizando el `LAContext` donde pasaremos las políticas de autenticación, ya sean datos biométricos como Touch ID o Face ID, o proporcionando el código de acceso.
- Verificamos si el dispositivo aceptar una autenticación biométrica por Face ID utilizando el `canEvaluatePolicy` del `LAContext`.
- Una vez verificada, evaluamos sí nos podemos autenticar para obtener acceso utilizando el `evaluatePolicy` del `LAContext`.
- Al verificarnos y si no nos reconoce, la aplicación mostrara el mensaje que se puso al inicio cuando agregamos el `Key`.

> Nota: En este caso, la `LAPolicy` contiene dos métodos para poder autenticarnos: 
el deviceOwnerAuthentication: para autenticarnos biométricamente, por Apple Watch o código/contraseña del dispositivo y; 
el deviceOwnerAuthenticationWithBiometrics: solo hace referencia a los sensores biométricos (Touch ID o Face ID)

# Utilización del WebView
Para utilizar la WebView con la aplicación hay 3 formas de utilizarlo.
* La primera forma es utilizando el `Link` que nos sacara de la aplicación y abrirá el navegador del móvil.
* La segunda forma es utilizando el `WKWebView` que abrirá solo una vista dentro de la aplicación con las capacidades de un explorador web.
    * Creamos un nuevo archivo con una estructura de tipo `UIViewRepresentable` que será la forma en la que un componente visual de UIKit interactúe con uno de SwiftUI.
    * Dentro de este archivo, creamos una variable que será la URL que recibirá para mostrarlo.
    * Utilizamos la función de `makeUIView` para crear el componente de vista que queremos relacionar para retornar, en este caso retornaremos el `WKWebView` que es un componente de vista nativo para visualizar web.
    * Utilizamos la función `updateUIView` para actualizar el estado del componente de la vista, en este caso carga la URL en un visor web.
    * Regresamos a la vista principal y , en este caso se utilizó un botón, utilizaremos el `sheet` para activar criterio de visualización utilizando el `isPresented` y llamaremos al archivo creado para pasarle la URL.
* La tercera forma es utilizando el `SFSafariViewController` que abrirá Safari dentro de nuestra aplicación.
    * Al igual que la segunda forma, creamos un nuevo archivo de tipo `UIViewControllerRepresentable`, creando una variable para la URL.
    * Llamaremos a las dos funciones parecidas a la de la segunda forma, `makeUIViewController` y `updateUIViewController`, pero solo se utilizara la primera.
    * En `makeUIViewController` que es para crear la vista, retornaremos el `SFSafariViewController` junto con la URL que se enviara a la variable creada.
    * A la segunda función solo la llamamos y la dejamos.
    * Al igual que la segunda forma, se utilizó  un botón, utilizamos al `sheet` para activarlo y llamamos al nuevo archivo creado para pasarle la URL.