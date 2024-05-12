//
//  SwitchView.swift
//  Demo1
//
//  Created by Piyush Sinroja on 20/10/22.
//

import SwiftUI

struct SwitchView: View {
    
    @State var isOn = false
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Status:")
                Text(isOn ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle(isOn: $isOn) {
                Text("Label")
            }
            .toggleStyle(SwitchToggleStyle(tint: Color.red))
            
            Spacer()
        }
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView()
    }
}
