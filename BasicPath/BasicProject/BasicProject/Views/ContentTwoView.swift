//
//  ContentTwoView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 4/12/22.
//

import SwiftUI

struct ContentTwoView: View {
    @State private var color:Color = .blue
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
