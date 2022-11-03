//
//  ImageView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 3/11/22.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//      Resizable: para que entre la imagen en todos los margenes del iphone pero se deforma
//      ScaledToFill: para que crezca lo maximo a lo alto
//      ScaledToFit: para que crezca lo maximo a lo ancho
//      Frame: para dar un tamano exacto
//      ClipShape: delimitar el margin visible de la imagen
//      Padding despues del frame, limita el tamano exterior de la imagen pero si se utiliza antes, se aplica a la imagen y despues la redimencion
//      Overlay: se puede agregar el borde del circulo de la imagen y demas propiedades, en este caso el grosor
//      shadow: aplicar sombra, primero se agrega el color y luego el tamano
        VStack {
            Image("pantheon").resizable().frame(width: 300, height: 250)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 5))
                .shadow(color: Color.green, radius: 10)
            Image(systemName: "person.fill").resizable().padding(55)
                .frame(width: 300, height: 250)
                .background(.gray)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 5))
                .shadow(color: .green, radius: 10)
                .foregroundColor(.blue)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}