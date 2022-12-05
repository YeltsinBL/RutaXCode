//
//  ContentTwoView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 4/12/22.
//

import SwiftUI

struct ContentTwoView: View {
    @State private var color:Color = .blue
    @State private var isLoading = false
    @State private var isDownloading:Float = 0.0
    @State private var nro = 1
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text("Cambiar color")
                        .font(.largeTitle)
                    Rectangle()
                        .foregroundColor(color)
                        .frame(width: 360, height: 150)
                        .border(.red)
                    ColorPicker("SELECCIONA UN COLOR", selection: $color)
                }
                .padding()
                .border(.green)
                VStack {
                    Text("Carga / Descarga")
                        .font(.largeTitle)
                    if isLoading {
                        ProgressView("Cargando")
                            .scaleEffect(2)
                    }
                    Button("Cargando") {
                        isLoading = !isLoading
                    }
                    .padding(.top, isLoading ? 40 : 5)
                    .padding(.bottom, 30)
                    ProgressView(value: isDownloading)
                    Button("Descargando") {
                        isDownloading += 0.2
                        if isDownloading == 1{
                            print("Carga completa")
                            isDownloading = 0.0
                        }
                    }
                    .padding(.top, 5)
                }
                .padding()
                .border(.green)
                VStack{
                    Text("Aumentar / Disminuir")
                        .font(.largeTitle)
//                  Se da un rango de números y una cantidad de aumento y disminución.
                    Stepper("Nro IPhone \(nro)", value: $nro,in:  1...14,
                        step: 2)
//                  En esta segunda opción, no se usa un rango de números y se puede aumentar y disminuir independientemente con acciones diferentes.
                    Stepper("Otra Opcion \(nro)") {
                        nro += 2
                    } onDecrement: {
                        nro -= 1
                    }

                }
                .padding()
                .border(.green)
            }
            .padding()
        }
        
        
    }
}

struct ContentTwoView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTwoView()
    }
}
