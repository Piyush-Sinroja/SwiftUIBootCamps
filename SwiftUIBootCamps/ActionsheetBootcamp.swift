//
//  ActionsheetBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 10/04/23.
//

import SwiftUI

struct ActionsheetBootcamp: View {
    
    @State var showActionsheet: Bool = false
        
    @State private var selection = "None"
    
    var body: some View {
        VStack {
         
            Text(selection)
            
            Button("Click me") {
                showActionsheet.toggle()
            }
            //.actionSheet(isPresented: $showActionsheet, content: getActionSheet)
            
            .confirmationDialog("Select a color", isPresented: $showActionsheet, titleVisibility: .visible) {
                
                Button("Red") {
                    selection = "Red"
                }
                
                Button("Green") {
                    selection = "Green"
                }
                
                Button("Blue") {
                    selection = "Blue"
                }
            }
        }
    }
    
    
    func getActionSheet() -> ActionSheet {

        let btn1: ActionSheet.Button = .default(Text("Default"))
        let btn2: ActionSheet.Button = .destructive(Text("Destructive"))
        let btn3: ActionSheet.Button = .cancel()
        
        return ActionSheet(
            title: Text("This is the title"),
            message: Text("This is the message"),
            buttons: [btn1, btn2, btn3])
    }
   
}

struct ActionsheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionsheetBootcamp()
    }
}
