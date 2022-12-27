# Ruta Custom en XCode
## _Ejercicios Personalizados para aplicaciones móviles en XCode utilizando SwiftUI y UIKit._
Descripción de todo lo que se realizó en esta rama.

En `CustomLayoutView` utilicé:
- GeometryReader: para poder hacer layouts personalizados de acuerdo al tamaño  de la vista, para eso utilice `GeometryProxy` para obtener la posición y tamaño .

En `CustomNavigationView` utilicé:
- PreferenceKey: para poder cambiar el título del Navigation, en esta struct se crea una variable String y una función `reduce` que recibe el primer y ultimo valor a asignar dentro de la misma jerarquía de vistas
    - onPreferenceChange: en la vista custom creada se utilizaremos esta propiedad donde se agregara la struct del `PreferenceKey` que recibe el valor a asignar al titulo. 
    - Preference: en la vista principal se utilizaremos esta propiedad donde se recibe un key que será la struct del PreferenceKey y un valor que será  el texto del título 