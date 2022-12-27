//
//  ReproduceView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 27/12/22.
//

import SwiftUI
import AVKit

struct ReproduceView: View {
    
    let url = URL(string: "https://media0.giphy.com/media/nZYasmPnlRT1oyHDlV/giphy480p.mp4")!
    
    var body: some View {
        VStack{
            VStack{
                Text("VideoPlayer")
                        .font(.largeTitle)
                        .padding(.bottom, 10)
                VideoPlayer(player: .init(url: url )){
                    Text("Te gustó el video?")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                    Spacer()
                }
                .frame(height: 250)
            }
            .padding()
            .border(.green)
            
        }
    }
}

struct ReproduceView_Previews: PreviewProvider {
    static var previews: some View {
        ReproduceView()
    }
}
