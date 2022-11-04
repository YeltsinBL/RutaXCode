//
//  ListView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 4/11/22.
//

import SwiftUI

private let programmers = [Programmer(id: 1, name: "Yeltsin", languages: "Swift, Kotlin", avatar: Image(systemName: "person"), favorite: true),
                           Programmer(id: 2, name: "Juan", languages: "Java, C", avatar: Image(systemName: "person.fill"), favorite: false),
                           Programmer(id: 3, name: "Leo", languages: "C#", avatar: Image(systemName: "person.fill"), favorite: true),
                           Programmer(id: 4, name: "Balto", languages: "JavaScript", avatar: Image(systemName: "person.fill"), favorite: false),
                           Programmer(id: 5, name: "Ana", languages: "Python", avatar: Image(systemName: "person.fill"), favorite: false)]

struct ListView: View {
    
//    State
    @State private var showFavorite = false
    
//  creamos una nueva lista de programadores pero utilizando el estado de favorito para filtrar y lo agregamos a la lista
    private var filteredProgrammers: [Programmer]{
        return programmers.filter{
            programmer in
            return !showFavorite || programmer.favorite
        }
    }
    
    var body: some View {
        VStack{
//          Agregamos el Toggle para que sea quien muestra los favoritos o todos, el estado que recibe debe ser mutable para que acepte cambios, se le agrega al inicio el $ para que acepte el valor
            Toggle(isOn: $showFavorite){
                Text("Mostrar favoritos")
            }.padding()
            // Agregamos la lista en un NavigationView para dar la funcionalidad de navegar haciendo clic en la lista
            NavigationView {
                
                // A la lista le agregamos un array de programadores en la cual indicamos cual es la ruta clave (id) para que los agregue uno a uno cuantas veces sea necesario
                List(filteredProgrammers, id: \.id){ programmer in
                    //              Agregamos el RowView dentro del NavigationLink donde se pone la vista a donde queremos ir
                    NavigationLink(destination: ListDetailView(programmer: programmer)){
                        RowView(programmer: programmer)
                    }
                }
                .navigationTitle("Programmers")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
