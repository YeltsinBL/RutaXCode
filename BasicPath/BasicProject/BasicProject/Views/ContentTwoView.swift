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
    @State private var isChangeSlider:Float = 0.0
    @State private var isChange = false

    //Fixed: ancho fijo de las columnas/filas
    //Adaptive: fija un mínimo de ancho para la columna/fila, no se puede controlar el número de elementos que pueden estar dentro de ella
    //Flexible: solo se modifica el tamaño
    var elements = 1...100
    let gridItems = [GridItem(.fixed(100)), GridItem(.adaptive(minimum:20)), GridItem(.flexible(minimum: 20)), GridItem(.flexible(minimum: 50))]
//  Para pintar las opciones de los TabView cuando tiene un estilo
    init() {
           UIPageControl.appearance().pageIndicatorTintColor = .blue
           UIPageControl.appearance().currentPageIndicatorTintColor = .purple
       }
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
                    
                    Divider()
                    Slider(value: $isChangeSlider, in: 0...10, step: 1, onEditingChanged: { (editing) in isChange = editing}, minimumValueLabel: Text("Min"), maximumValueLabel: Text("Max")){
                        Text("Selecciona un numero")
                    }
                    Text("El valor del Slider es " + String(format:"%.0f", isChangeSlider))
                }
                .padding()
                .border(.green)
                VStack {
                    Text("LazyVGrid / LazyHGrid")
                        .font(.largeTitle)
//                  LazyGrid: Optimiza la carga de las vistas, mientras vas avanzando va cargando los elementos
//                  Las diferencias del LazyVGrid y LazyHGrid es que el LazyVGrid recibe columns y el LazyHGrid recibe rows
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: gridItems, content: {
                            ForEach(elements, id: \.self) { element in
                                VStack {
                                    Circle().frame(height: 15)
                                    Text("\(element)")
                                }
                            }
                        })
                    }.border(.black)
                        .frame(height: 350)
                }
                .padding()
                .border(.green)
                
                VStack {
                    Text("TabView Style Default")
                        .font(.largeTitle)
                    TabView{
                        FirstTabView()
                            .tabItem {
                            Image(systemName:"house.fill")
                            Text("First")
                        }
                        SecondTabView()
                            .tabItem {
                                Image(systemName:"person.crop.circle.fill")
                                Text("Second")
                            }
                    }
//                  utilicé el tint para cambiar el color al tabview seleccionado
                    .tint(.yellow)
                    .frame(height: 400)
                    .border(.black)
                    
                    Text("Another TabView Style")
                        .font(.largeTitle)
                    TabView{
                        FirstTabView()
                            .tabItem {
                            Image(systemName:"house.fill")
                            Text("First")
                        }
                        SecondTabView()
                            .tabItem {
                                Image(systemName:"person.crop.circle.fill")
                                Text("Second")
                            }
                    }
                    .frame(height: 250)
                    .border(.black)
                    .tabViewStyle(PageTabViewStyle())
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

struct FirstTabView: View {
    var body: some View {
        VStack {
            Image(systemName:"house.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            Text("First TabView")
                .padding(.top, 15)
            
        }
    }
}

struct SecondTabView: View {
    var body: some View {
        Text("Second TabView")
    }
}
