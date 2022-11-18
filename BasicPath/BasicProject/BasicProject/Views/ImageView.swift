//
//  ImageView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 3/11/22.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
//      Resizable: para que entre la imagen en todos los márgenes de la vista pero se deforma
//      ScaledToFill: para que crezca lo máximo a lo alto
//      ScaledToFit: para que crezca lo máximo a lo ancho
//      Frame: para dar un tamaño exacto
//      ClipShape: delimitar el margen visible de la imagen
//      Padding después del frame, limita el tamaño exterior de la imagen pero si se utiliza antes, se aplica a la imagen y después la redimensión
//      Overlay: se puede agregar el borde del circulo de la imagen y demas propiedades, en este caso el grosor
//      shadow: aplicar sombra, primero se agrega el color y luego el tamaño de expansión 
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
