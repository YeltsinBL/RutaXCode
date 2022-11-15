//
//  WebView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 14/11/22.
//

import SwiftUI

struct WebView: View {
    
    @State private var showWKWebView = false
    @State private var showSafariWebView = false
    private let url = "https://google.com"
    var body: some View {
        VStack (spacing: 15){
//Link: abre el navegador web del movil fuera de la aplicacion
            Link(destination: URL(string: url)!) {
                Text("Visita Google")
            }
//WKWebView: es una vista dentro de la aplicacion con las capacidades de un explorador web
            Button("Abrir WKWebView"){
//Indicamos en que momento mostrar el WKWebView
                showWKWebView = true
                
            }
//Definimos el criterio para activar el sheet ($showWKWebView) y la vista que va a mostrar
            .sheet(isPresented: $showWKWebView){
                WebWKWebView(url: url)
            }
//Abre safari dentro de nuestra propia aplicacion
            Button("Abrir SFSafariViewController"){
                showSafariWebView = true
            }
            .sheet(isPresented: $showSafariWebView){
                WebSafariView(url: url)
            }
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
