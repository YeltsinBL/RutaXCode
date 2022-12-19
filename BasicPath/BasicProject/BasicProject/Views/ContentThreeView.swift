//
//  ContentThreeView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 16/12/22.
//

import SwiftUI

let arrayOfName = [ "GeometryReader", "Primera", "Animación"]

struct NewButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .cornerRadius(30)
    }
}

extension View{
    func newButtonModifierOptimizar() -> some View{
        self.modifier(NewButtonModifier())
    }
}

struct ContentThreeView: View {
    private let url = URL(string: "https://i.pinimg.com/564x/f0/45/82/f04582962fdbc32271ac6581d55c3e2f.jpg")
    var body: some View {
        ScrollView (showsIndicators: false){
            VStack{
                VStack{
                    Text("AsyncImage")
                            .font(.largeTitle)
                            .padding(.bottom, 10)
                    AsyncImage(url: url!) { image in
                        image
                            .resizable()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue, lineWidth: 5))
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }

                }
                .padding()
                .border(.green)
                VStack{
                    Text("GeometryReader Animación 3D")
                        .font(.largeTitle)
                        .padding(.bottom, 10)
                    VStack{
                        ForEach(arrayOfName, id: \.self) { name in
                            GeometryReader { proxy in
                                VStack{
                                    Text("Posición en Y: \(proxy.frame(in: .global).minY)")
                                    Spacer()
                                    Text("\(name)")
                                        .frame(width: 370, height: 200)
                                        .background(.green)
                                        .cornerRadius(20)
                                    Spacer()
                                }
                                .shadow(color: .gray, radius: 10, x: 0, y: 0)
                                .rotation3DEffect(Angle(degrees: Double(proxy.frame(in: .global).minY) - 675), axis: (x: 0.0, y: 10.0, z: 0.0))
                            }
                        }
                        .frame(width: 370, height: 300)
                    }
                    .padding(.top, 30)
                }
                .padding()
                .border(.green)
                VStack{
                    Text("ViewModifier")
                            .font(.largeTitle)
                            .padding(.bottom, 10)
                    Button("Prueba de ViewModifier"){
//
                    }
                    .modifier(NewButtonModifier())
                    Button("Prueba de ViewModifier Codigo Optimizado"){
//
                    }
                    .newButtonModifierOptimizar()
                }
                .padding()
                .border(.green)
            }
        }
    }
}

struct ContentThreeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentThreeView()
    }
}
