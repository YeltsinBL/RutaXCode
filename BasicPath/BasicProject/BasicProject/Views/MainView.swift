//
//  MainView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 3/11/22.
//
// Agregaremos todas las vistas creadas en una sola
import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView {
            VStack{
//              Agregamos algunas propiedades a las vistas
                MapView().frame(height: 400)
//              Offset: deplazamos desde su eje al elemento visual
                ImageView().offset(y: -100)
//              Divider: linea para separar diferentes bloques
                Divider().padding()
                ContentView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
