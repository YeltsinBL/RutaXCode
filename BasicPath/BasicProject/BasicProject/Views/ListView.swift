//
//  ListView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 4/11/22.
//

import SwiftUI

private let programmers = [Programmer(id: 1, name: "Yeltsin", languages: "Swift, Kotlin", avatar: Image(systemName: "person.fill")),
                           Programmer(id: 2, name: "Juan", languages: "Java, C", avatar: Image(systemName: "person.fill")),
                           Programmer(id: 3, name: "Leo", languages: "C#", avatar: Image(systemName: "person.fill")),
                           Programmer(id: 4, name: "Balto", languages: "JavaScript", avatar: Image(systemName: "person.fill")),
                           Programmer(id: 5, name: "Ana", languages: "Python", avatar: Image(systemName: "person.fill"))]

struct ListView: View {
    var body: some View {
// A la lista le agregamos un array de programadores en la cual indicamos cual es la ruta clave (id) para que los agregue uno a uno cuantas veces sea necesario
        List(programmers, id: \.id){ programmer in
            RowView(programmer: programmer)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
