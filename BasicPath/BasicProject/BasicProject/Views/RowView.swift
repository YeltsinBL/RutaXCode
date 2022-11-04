//
//  RowView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 4/11/22.
//

// Diseño de la fila para ver como quedara las listas
import SwiftUI

struct RowView: View {
    var programmer: Programmer
    var body: some View {
        
        HStack{
            programmer.avatar
                .resizable()
                .frame(width: 40, height: 40)
                .padding(10)
            VStack(alignment: .leading){
                Text(programmer.name)
                    .font(.title)
                Text(programmer.languages)
                    .font(.subheadline)
            }
            Spacer()
//          Hacemos el if para que aparezca la estrella solo cuando es favorito
            if programmer.favorite{
                Image(systemName: "star.fill").foregroundColor(.yellow).padding(.trailing)
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(programmer: Programmer(id: 1, name: "Yeltsin", languages: "Swift, Kotlin", avatar: Image(systemName: "person.fill"), favorite: true))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
