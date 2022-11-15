//
//  WebSafariView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 14/11/22.
//

import SwiftUI
import SafariServices

//Esta UIKit que utilizaremos extiende de UIController
struct WebSafariView: UIViewControllerRepresentable{
    let url: String
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: URL(string: url)!)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
    
}
