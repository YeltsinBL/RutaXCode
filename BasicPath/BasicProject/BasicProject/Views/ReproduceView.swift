//
//  ReproduceView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 27/12/22.
//

import SwiftUI
import AVKit

//Modelo de los sonidos donde recibe el nombre y devuelve la URL del sonido
struct SoundModel: Hashable{
    let name: String

//    si el nombre y la extensión no son iguales a los archivos agregados, la aplicación se crashea
    func getURL() -> URL {
        return URL(string: Bundle.main.path(forResource: name, ofType: "wav")!)!
    }
}
//Array de sonidos con los nombres
let arrayofSounds: [SoundModel] = [
    .init(name: "hero1"),
    .init(name: "hero2"),
    .init(name: "hero3")
]

//Clase va a ir la logica con la reporducción del sonido
class SoundPlayer{
    var audio: AVAudioPlayer?
    
    func play(withURL url:URL) {
        audio = try! AVAudioPlayer(contentsOf: url)
        audio?.prepareToPlay()
        audio?.play()
    }
}

struct ReproduceView: View {
    
    let url = URL(string: "https://media0.giphy.com/media/nZYasmPnlRT1oyHDlV/giphy480p.mp4")!
    
    private let soundPlayer = SoundPlayer()
    
    var body: some View {
        ScrollView {
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
                
                VStack{
                    Text("AVAudioPlayer")
                            .font(.largeTitle)
                            .padding(.bottom, 10)
                    List{
                        ForEach(arrayofSounds, id: \.self) { sound in
                            Button("Sonido: \(sound.name)"){
                                soundPlayer.play(withURL: sound.getURL())
                            }
                        }
                    }
                    .frame(height: 180)
                }
                .padding()
                .border(.green)
            }
        }
    }
}

struct ReproduceView_Previews: PreviewProvider {
    static var previews: some View {
        ReproduceView()
    }
}
