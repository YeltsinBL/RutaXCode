//
//  ContentView.swift
//  CustomProjects
//
//  Created by YeltsinMacPro13 on 18/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader{ proxy in
                VStack{
                    HStack(spacing: 0) {
                        Rectangle()
                            .foregroundColor(.blue)
                            .overlay(Text("Primer Layout"))
                            .frame(width: proxy.size.width/2, height: proxy.size.height/2)
//                            .padding()
                        Rectangle()
                            .foregroundColor(.yellow)
                            .overlay(Text("Segundo Layout"))
                            .frame(width: proxy.size.width/2, height: proxy.size.height/2)
                    }
                    Rectangle()
                        .foregroundColor(.red)
                        .overlay(Text("Tercer Layout"))
                        .frame(width: proxy.size.width, height: proxy.size.height * 0.33)
//                        .padding()
                }
                .background(.gray)
//                .padding()
            }
            Text("Fondo")
        }
        .background(.green)
//        .frame(width: 300, height: 758)
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
