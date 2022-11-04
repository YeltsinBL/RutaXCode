//
//  ListView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 4/11/22.
//

import SwiftUI

//Hacemos que el valor de favorite sea mutable
final class ProgrammersModelData: ObservableObject{
//Publicamos el listado para que pueda cambiar sus datos
@Published var programmers = [Programmer(id: 0, name: "Yeltsin", languages: "Swift, Kotlin", avatar: Image(systemName: "person"), favorite: true),
                           Programmer(id: 1, name: "Juan", languages: "Java, C", avatar: Image(systemName: "person.fill"), favorite: false),
                           Programmer(id: 2, name: "Leo", languages: "C#", avatar: Image(systemName: "person.fill"), favorite: true),
                           Programmer(id: 3, name: "Balto", languages: "JavaScript", avatar: Image(systemName: "person.fill"), favorite: false),
                           Programmer(id: 4, name: "Ana", languages: "Python", avatar: Image(systemName: "person.fill"), favorite: false)]
}

struct ListView: View {
    
//  State
    @State private var showFavorite = false
    
//  Agregamos EnvironmentObject para que se pueda acceder a los datos de la lista, debemos de asegurarnos que deba de haber datos por eso lo instanciamos en el preview
    @EnvironmentObject var programmersModelData: ProgrammersModelData
//  creamos una nueva lista de programadores pero utilizando el estado de favorito para filtrar y lo agregamos a la lista
    private var filteredProgrammers: [Programmer]{
        return programmersModelData.programmers.filter{
            programmer in
            return !showFavorite || programmer.favorite
        }
    }
    
    var body: some View {
        
    //Agregamos la lista en un NavigationView para dar la funcionalidad de navegar haciendo clic en la lista
        NavigationView {
            VStack{
            //Agregamos el Toggle para que sea quien muestra los favoritos o todos, el estado que recibe debe ser mutable para que acepte cambios, se le agrega al inicio el $ para que acepte el valor
                Toggle(isOn: $showFavorite){
                    Text("Mostrar favoritos")
                }.padding()
                
                // A la lista le agregamos un array de programadores en la cual indicamos cual es la ruta clave (id) para que los agregue uno a uno cuantas veces sea necesario
                List(filteredProgrammers, id: \.id){ programmer in
                    //Agregamos el RowView dentro del NavigationLink donde se pone la vista a donde queremos ir
                    //Agregamos de la lista mutable programmersModelData, el estado favorite para actualizar el valor
                    NavigationLink(destination: ListDetailView(programmer: programmer, favorite: $programmersModelData.programmers[programmer.id].favorite)){
                        RowView(programmer: programmer)
                    }
                }
            }
            .navigationTitle("Programmers")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(ProgrammersModelData())
    }
}
