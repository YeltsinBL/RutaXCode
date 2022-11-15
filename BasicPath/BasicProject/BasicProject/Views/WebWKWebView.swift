//
//  WebWKWebView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 14/11/22.
//

import SwiftUI
import WebKit
//UIViewRepresentable: es la forma en la que un componente visual de UIKit interactue con uno de SwiftUI
struct WebWKWebView: UIViewRepresentable {
    
    let url : String
//    Indicamos el componente de vista que queremos relacionar para retornar
    func makeUIView(context: Context) -> WKWebView {
//        WKWebView: Componene de vista nativo para visualizar webs
        return WKWebView()
    }
//    Interactua con el componente de UIKit, en este caso carga la URL en un visor web
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: url)!))
    }
    
}
