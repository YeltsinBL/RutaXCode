//
//  ContentView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 26/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var myDate = Date()
    var body: some View {
//        Ordena los elementos en forma vertical
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!").font(.title)
            Text("First Project!")
//          Dos formas de utilizar el Label:
//            La predefinida que une el texto con imagen.
//            La custom que se puede crear por separado y cambiar su color a ambas independientemente.
            Label("Label junto", systemImage: "figure.wave")
                .labelStyle(.automatic)
                .foregroundColor(.green)
            Label{
                Text("Uso")
                    .font(.body)
                    .foregroundColor(.primary)
                Text("Label separado")
                        .font(.subheadline)
                        .foregroundColor(.red)
            }icon: {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.green)
            }
//          Empuja los elementos para ocupar lo máximo posible de la pantalla y los separa uniformemente
            Spacer()
//          Ordena los elementos de forma Horizontal
            HStack(alignment: .firstTextBaseline, spacing: 0){
                
                Text("Enviar desde XCode 2")
                    .background(Color.red)
                Spacer()
                Text("Agregar texto mas grande")
                    .background(Color.red)
                
            }
            .background(Color.yellow)
            Spacer()
//          Ordena los elementos uno encima del otro
            ZStack{
                Text("")
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
                    .background(Color.green)
                    .padding()
                Text("")
                    .frame(maxWidth: .infinity,
                               maxHeight: .infinity)
                        .background(Color.blue)
                        .padding(35)
                Text("")
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
                    .background(Color.yellow)
                    .padding(60)
                Text("")
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
                    .background(Color.red)
                    .padding(90)
            }
//            Text("8")
//            Text("9")
//          Total máximo para crear elementos en un Stack es de 10, si se requiere agregar más, se deberá agregar un Stack adicional y en él agregar los demás elementos necesarios
            VStack(alignment: .leading){
                Text("10")
//              Agregar la fecha dentro de un Text, se puede hacer directo o por una variable para diferentes formatos
                Text(Date(), style: .date)
                Text(myDate, format: Date.FormatStyle(date: .numeric, time: .shortened))
                Text("13")
                Text("14")
                Text("15")
                VStack{
                    Text("16")
                    Text("17")
                    Text("18")
                    Text("19")
                    Text("20")
                    
                }
            }
        }
        .border(Color.red)
        .padding()
        .border(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
