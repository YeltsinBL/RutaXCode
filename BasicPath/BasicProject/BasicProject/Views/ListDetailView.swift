//
//  ListDetailView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 4/11/22.
//

import SwiftUI

struct ListDetailView: View {
    
//  Agregamos la estructura Programmer para que acepte datos de entra al hacer clic en el listado anterior
    var programmer: Programmer
    
    var body: some View {
        VStack{
            programmer.avatar.resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 5))
                .shadow(color: .gray, radius: 5)
            Text(programmer.name).font(.largeTitle)
            Text(programmer.languages).font(.title)
            Spacer()
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(programmer: Programmer(id: 1, name: "Yeltsin", languages: "Swift, Kotlin", avatar: Image(systemName: "person.fill")))
    }
}
