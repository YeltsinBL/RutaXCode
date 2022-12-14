//
//  DeleteView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 11/12/22.
//

import SwiftUI

struct DeleteView: View {
    
    @State private var isContextMenuAlert = false
    @State private var isContextMenu = false
    
    @State var isContextMenuPrueba = false
    @State var isContextMenuPresionado = false
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
            Text("ContextMenu")
                    .font(.largeTitle)
                    .padding(.bottom, 10)
            Label{
                Text("Manten Presionado")
                    .padding(.trailing,10)
            }icon: {
                Image(systemName: "figure.wave")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding(.leading,10)
                    .padding(.top,10)
                    .padding(.bottom,10)
            }
            .bold()
            .border(.blue)
            .contextMenu(
                ContextMenu(menuItems: {
                    Button("Primera Opcion") {
                        isContextMenuAlert = true
                    }.alert("Primera Opcion", isPresented: $isContextMenuAlert) {
                        Button("Aceptar") {
                            isContextMenuAlert = false
                        }
                    }
                    Button("Segunda Opcion") {
                        isContextMenuPresionado = true
                    }
//                    ExtractedView()
                    
                }))
            .confirmationDialog(Text("ContextMenu"), isPresented: $isContextMenuPresionado){
                Button("Aceptar"){
                    isContextMenuPresionado = false
                }
                Button("Cancelar", role: .cancel){
                    isContextMenuPresionado = false
                }
                Button("Eliminar", role: .destructive){
                    isContextMenuPresionado = false
                }
            } message: {
                Text("Context Menu Presionado:")
            }
            
            Menu{
                Button("Primera Opcion") {
                    isContextMenuAlert = true
                }.alert("Primera Opcion", isPresented: $isContextMenuAlert) {
                    Button("Aceptar") {
                        isContextMenuAlert = false
                    }
                }
                Button("Segunda Opcion"){
                    isContextMenu = true
                    print(isContextMenu)
                }
                Menu{
                    Button("Tercera Opcion"){
//
                    }
                    Button("Cuarta Opcion"){
//
                    }
                } label: {
                    Label("More", systemImage: "ellipsis")
                }
                
            } label: {
                Label{
                    Text("Presiona Menu")
                        .padding(.trailing,10)
                }icon: {
                    Image(systemName: "figure.wave")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .padding(.leading,10)
                        .padding(.top,10)
                        .padding(.bottom,10)
                }
                .bold()
                .border(.blue)
            }
            .confirmationDialog(Text("ContextMenu"), isPresented: $isContextMenu){
                Button("Aceptar"){
    //                isContextMenuPrueba = false
                }
                Button("Cancelar", role: .cancel){
    //                isContextMenuPrueba = false
                }
                Button("Eliminar", role: .destructive){
    //                isContextMenuPrueba = false
                }
            } message: {
                Text("Context Menu :")
            }

            Text("Verificar espacio")
        }
    }
}

struct DeleteView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteView()
    }
}


