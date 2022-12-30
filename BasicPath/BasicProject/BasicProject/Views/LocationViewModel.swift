//
//  LocationViewModel.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 29/12/22.
//

import Foundation
import CoreLocation
import MapKit

final class LocationViewModel: NSObject, ObservableObject{
//  Ubicacion
    private struct DefaultRegion{
        static let latitud = -12.0431800
        static let longitud = -77.0282400
    }
    private struct Span {
        static let delta = 0.1
    }
//  Para saber si el usuario dio acceso
    @Published var userHasLocation: Bool = false
//  Importar MapKit para usar MKCoordinateRegion
    @Published var userLocation: MKCoordinateRegion = .init()
    private let locationManager: CLLocationManager = .init()
    
    override init() {
        super.init()
//        La mejor presicion
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        Pide la locaclizacion cuando la aplicacion esta en uso
        locationManager.requestWhenInUseAuthorization()
//        Empieza las actualizaciones de la localizacion del usuario
        locationManager.startUpdatingLocation()
//        recibe actualizaciones de la localizacion del usuario
        locationManager.delegate = self
//      cuando no se acepta el permiso, se asigna una localizacion por defecto
        userLocation = .init(center: .init(latitude: DefaultRegion.latitud, longitude: DefaultRegion.longitud), span: .init(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
    }
    
    func checkUserAuthorization() {
        let status = locationManager.authorizationStatus
        switch status{
        case .notDetermined, .restricted, .denied:
            userHasLocation = false
        case .authorizedAlways, .authorizedWhenInUse:
            userHasLocation = true
        @unknown default:
            print("Estado sin saber")
        }
    }
}

//Para recibir informacion de la localizacion del usuario
extension LocationViewModel: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//      obtenemos la localizacion del usuario:
        guard let location = locations.last else { return }
        userLocation = .init(center: location.coordinate, span: .init(latitudeDelta: Span.delta, longitudeDelta: Span.delta))
    }
//      para detectar algun cambio en la autorizacion
    func locationManagerDidChangeAuthorization (_ manager: CLLocationManager){
        checkUserAuthorization()
    }
}
