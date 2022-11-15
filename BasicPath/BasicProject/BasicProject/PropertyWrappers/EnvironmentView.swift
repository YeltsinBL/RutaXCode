//
//  EnvironmentView.swift
//  BasicProject
//
//  Created by YeltsinMacPro13 on 14/11/22.
//

import SwiftUI

struct EnvironmentView: View {
    
//EnvironmentObject: tiene la misma funcionalidad que el ObservedObject pero se utiliza para enviar datos a mas de 2 vistas, podemos acceder desde cualquier parte de la aplicacion desde que se propaga
//    Tener en cuenta que el programa asume que se le a asignado el EnvironmentObject por lo cual aparecera error hasta que se asigne
    @EnvironmentObject var user: UserData
    
    var body: some View {
        Text(user.name)
    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView().environmentObject(UserData())
    }
}
