//
//  MapTwoView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 29/12/22.
//

import SwiftUI
import MapKit

struct MapTwoView: View {

    @StateObject var locationViewModel = LocationViewModel()

    var body: some View {
        VStack {
            Map(coordinateRegion: $locationViewModel.userLocation, showsUserLocation: true)
                .ignoresSafeArea()
            
            if locationViewModel.userHasLocation {
                Text("Locacion Aceptada")
                    .bold()
                    .padding(.top, 15)
                Link("Pulsa para denegar la localizacion", destination: URL(string: UIApplication.openSettingsURLString)!)
                    .padding(35)
            } else {
                Text("Localizacion No aceptada")
                    .bold()
                    .padding(.top, 15)
                Link("Pulsa para autorizar la localizacion", destination: URL(string: UIApplication.openSettingsURLString)!)
                    .padding(35)
            }
        }
    }
}

struct MapTwoView_Previews: PreviewProvider {
    static var previews: some View {
        MapTwoView()
    }
}
