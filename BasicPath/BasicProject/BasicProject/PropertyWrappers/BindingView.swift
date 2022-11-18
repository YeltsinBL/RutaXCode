//
//  BindingView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 14/11/22.
//

import SwiftUI

struct BindingView: View {
//  Binding: almacena y actualiza el valor de una variable que no a sido creada en la vista actual
    @Binding var value: Int
//ObservedObject: tiene la misma funcionalidad que el Binding pero se utiliza con datos más complejos
    @ObservedObject var user: UserData
    
    var body: some View {
        VStack {
            Text("El valor actual es \(value)")
            Button("Sumar 2"){
                value += 2
            }
            Button("Actualizar datos 2"){
                user.name = "Guillermo"
                user.age = 20
            }
            NavigationLink("EnvironmentView", destination: EnvironmentView())
        }
    }
}

struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView(value: .constant(5), user: UserData())
    }
}
