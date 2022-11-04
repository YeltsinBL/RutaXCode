//
//  MapView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 3/11/22.
//

import SwiftUI

//Utilizar UIKit en SwiftUI
//Agregar un Mapa
import MapKit
//Cambiamos el View por UIViewRepresentable para incorporar un objeto vista de UIKit dentro de un objeto vista de SwiftUI
struct MapView: UIViewRepresentable {
//  Eliminamos el body que retorna una view de swiftUI porque debemos de retornar una vista de UIKit
    /*var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }*/
//  Agregamos la función makeUIView porque retorna una vista de UIKit
    func makeUIView(context: Context) ->
//  Cambiamos el "some View" por un MKMapView
//    some UIView {
    MKMapView{
//      Retornamos el objeto MKMapView de UIKit
        MKMapView(frame: .zero)
    }
//  Agregamos la función updateUIView para actualizar/trabajar en este mapa
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordenadas =
        CLLocationCoordinate2D(latitude: -12.0431800, longitude: -77.0282400)
//      Delimita la región que se quiere mostrar en el mapa en forma de grados
        let span =
        MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
        let region =
        MKCoordinateRegion(center: coordenadas, span: span)
//      Fijamos la región en el mapa
        uiView.setRegion(region, animated: true)
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
