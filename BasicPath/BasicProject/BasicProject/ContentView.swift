//
//  ContentView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 26/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("First Project!")
            Text("Enviar desde XCode 2")
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
