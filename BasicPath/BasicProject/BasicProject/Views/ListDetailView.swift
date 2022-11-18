//
//  ListDetailView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 4/11/22.
//

import SwiftUI

struct ListDetailView: View {
    
//  Agregamos la estructura Programmer para que acepte datos de entrada al hacer clic en el listado anterior
    var programmer: Programmer
    
//  Agregamos una variable que será la modificada para el estado favorito
//  Una variable binding llega desde otra vista y puede ser modificada
    @Binding var favorite: Bool
    
    var body: some View {
        VStack{
            programmer.avatar.resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 5))
                .shadow(color: .gray, radius: 5)
            HStack {
                Text(programmer.name).font(.largeTitle)
                Button{
                    favorite.toggle()
                } label: {
                    if favorite {
                        
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                    }else {
                        
                        Image(systemName: "star").foregroundColor(.black)
                    }
                }
            }
            Text(programmer.languages).font(.title)
            Spacer()
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(programmer: Programmer(id: 1, name: "Yeltsin", languages: "Swift, Kotlin", avatar: Image(systemName: "person.fill"), favorite: true), favorite: .constant(false))
    }
}
