//
//  CustomNavigationView.swift
//  CustomProjects
//
//  Created by YeltsinMacPro13 on 26/12/22.
//

import SwiftUI

struct CustomTitleKey: PreferenceKey{
//    Recibe el primer y ultimo valor que se encuentran en el mismo nivel de jerarquia y para que cambie el titulo
    static func reduce(value: inout String, nextValue: () -> String) {
//      Asigna el primera valor al titulo
//        if !value.isEmpty{
//           return
//        }
//      Asigna el ultimo valor al titulo
        value = nextValue()
    }
    
    static var defaultValue: String = ""
    
}

struct CustomNavigationViewContainer<Content: View> :View{
    @State private var title: String = "Navigation View"
    let content: Content
    
//    Recibe un cloasure para inyectar varias vistas que se mostraran dentro de ella
    init(@ViewBuilder content:() -> Content){
        self.content = content()
    }
//    Estructura del CustomNavigationViewContainer: el titulo y el contenido dentro de un scroll
    var body: some View{
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .bold()
            GeometryReader{
                proxy in
                ScrollView{
                    content
                }
            }
        }
        .padding()
//      Escucha cuando queremos cambiar el titulo del CustonNavigationViewContainer
        .onPreferenceChange(CustomTitleKey.self){
            value in
            title = value
        }
    }
    
}

struct CustomNavigationView: View {
    var body: some View {
        CustomNavigationViewContainer {
            VStack(alignment: .leading) {
                Text("Prueba Preference 1")
                    .padding()
//                    .navigationTitle("Primera Prueba Basica")
                    .preference(key: CustomTitleKey.self, value: "Prueba Preference 1")
                
                Text("Prueba Preference 2")
                    .padding()
//                    .navigationTitle("Primera Prueba Basica")
                    .preference(key: CustomTitleKey.self, value: "Prueba Preference 2")
                
                VStack{
                    
                    Text("Prueba Preference ViewModifier")
                        .padding()
    //                    .navigationTitle("Primera Prueba Basica")
//                        .preference(key: CustomTitleKey.self, value: "Prueba Preference 3")
                        .customNavigationTitle(title: "Prueba Preference ViewModifier")
                }
            }
        }
    }
}

extension View{
    func customNavigationTitle(title: String) -> some View {
        modifier(CustomNavigationTitle(title: title))
    }
}

//Creamos nuestro propio Modificador
struct CustomNavigationTitle: ViewModifier{
    private var title : String
//    Acepta un parametro de entrada
    init(title: String) {
        self.title = title
    }
    
    func body(content: Content) -> some View {
        content
            .preference(key: CustomTitleKey.self, value: title)
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView()
    }
}
