//
//  FormView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 7/12/22.
//

import SwiftUI

struct FormView: View {
    @State var deviceName = "iPhone 12 Pro"
    @State var date = Date()
    @State var color: Color = .blue
    
    @State var textFieldName = ""
    @State var textFieldPhone = ""
    @State var alert = false
    var body: some View {
        Form{
            Section(header: Text("Setting")){
                TextField("Device Name", text: $deviceName).disabled(true)
            }
            Section(header: Text("Account"),footer: HStack{
                Spacer()
                Label("version 1.0", systemImage: "iphone")
                Spacer()
            }){
                DatePicker("Date", selection: $date)
                ColorPicker("Color", selection: $color)
            }
            Section{
                TextField("form-name-key", text: $textFieldName)
                TextField("form-phone-user \(textFieldName)", text: $textFieldPhone)
                    .keyboardType(.namePhonePad)
                HStack{
                    Spacer()
                    Button("form-button-key") {
                        alert = true
                    }
                    .alert("form-alertmessage-key", isPresented: $alert, actions: {
//                        code
                    })
                    .buttonStyle(.bordered)
                    .tint(.blue)
                }
            }header: {
                Text("form-header-key")
            }footer: {
                Text("form-footer-key")
            }
            
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
