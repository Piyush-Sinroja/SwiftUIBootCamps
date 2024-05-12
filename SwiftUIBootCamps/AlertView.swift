//
//  AlertView.swift
//  Demo1
//
//  Created by Piyush Sinroja on 20/10/22.
//

import SwiftUI

struct AlertView: View {
    
    @State var showAlert = false
    @State var bgColor = Color.yellow
    
    @State var alertMessage: String = ""
    @State var alertTitle: String = ""
    
    var body: some View {
        ZStack {
            bgColor.edgesIgnoringSafeArea(.all)
            
            Button("Click") {
                alertTitle = "Title 1"
                alertMessage = "Message 1"
                showAlert.toggle()
            }
            
           
            .alert(isPresented: $showAlert) {
                getAlert()
            }
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle),
                     message: Text(alertMessage),
                     primaryButton: .destructive(Text("Delete"), action: {
            bgColor = .red
        }), secondaryButton: .cancel())
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
