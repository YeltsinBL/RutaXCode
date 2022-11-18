//
//  StateView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 14/11/22.
//
//Property Wrappers (@'property'): envoltorio de propiedades que permite almacenar y actualizar los datos en las vistas

import SwiftUI

//Para hacer cambios usando el StateObject, la clase debe ser mutable para estar observando cambios (ObservableObject) y que sus propiedades deben estar publicando su valor para que la vista pueda leerla y modificarla
class UserData: ObservableObject{
    @Published var name = "Yeltsin"
    @Published var age = 24
}


struct StateView: View {
    //State: cuando el valor se va a actualizar solo en la vista que a sido definida 
    @State private var value=0
//    StateObject: tiene la misma funcionalidad que el State pero se utiliza con datos más complejos
    @StateObject private var user = UserData()
    
    var body: some View {
        
            NavigationView {
                VStack {
                    Text("El valor actual es \(value)")
                    Button("Sumar 1"){
                        value += 1
                    }
                    Text("Mi nombre es \(user.name) y mi edad es \(user.age)")
                    Button("Actualizar datos"){
                        user.name = "Chemo"
                        user.age = 25
                    }
                    NavigationLink("BindingView", destination: BindingView(value: $value, user: user))
                }.navigationTitle("StateView")
            }
        
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
//        Añadimos un EnvironmentObject
        StateView().environmentObject(UserData())
    }
}
