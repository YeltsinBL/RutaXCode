//
//  ContentThreeView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 16/12/22.
//

import SwiftUI

struct ContentThreeView: View {
    private let url = URL(string: "https://i.pinimg.com/564x/f0/45/82/f04582962fdbc32271ac6581d55c3e2f.jpg")
    var body: some View {
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
            
        }
    }
}

struct ContentThreeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentThreeView()
    }
}
