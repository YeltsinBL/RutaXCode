//
//  BiometricAuthView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 14/11/22.
//

import SwiftUI
import LocalAuthentication

struct BiometricAuthView: View {
    
    @State private var auth = false

    var body: some View {
        VStack {
            Text(auth ? "Estas autenticado" : "Necesitas Autenticarte")
                .font(.title).bold()
            Button(auth ? "Salir" : "Autenticar"){
                if auth{
                    auth = false
                }else{
                    autentication()
                }
            }.buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
            .accentColor(.black)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(auth ? .green : .red)
        
    }
    private func autentication(){
//      Para controlar errores
        var error: NSError?
//        verificar si el dispositivo soporta autenticacion biometrica
//        Instanciamos el LAContxt
        let laContext = LAContext()
//        pasamos las politicas
//        deviceOwnerAuthentication: para autenticarnos biometricamente por applewatch y/o codigo
//deviceOwnerAuthenticationWithBiometrics: solo hace referencia a los sensores biometricos
        if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
//           una vez verificado que utiliza sensor biometrico evaluamos
            laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Autenticate con un sensor biometrico"){ autenticated, error in
//                verificamos si se a autenticado
                if autenticated {
                    auth = true
                }
            }
        }else{
            auth = true
        }
        
    }
}

struct BiometricAuthView_Previews: PreviewProvider {
    static var previews: some View {
        BiometricAuthView()
    }
}
