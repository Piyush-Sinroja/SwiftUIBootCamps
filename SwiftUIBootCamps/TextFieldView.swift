//
//  TextFieldView.swift
//  Demo1
//
//  Created by Piyush Sinroja on 20/10/22.
//

import SwiftUI

struct TextFieldView: View {
    
    @State var textfieldText = ""
    @State var textEditorText = ""
        
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type here", text: $textfieldText)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.red)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Button {
                    if textIsProper() {
                        
                    }
                } label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsProper() ? .blue : .gray)
                        .foregroundColor(.white)
                        .font(.headline)
                }.disabled(!textIsProper())

                
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                    .colorMultiply(.gray)
                    .cornerRadius(10)
            }
        }
    }
    
    func textIsProper() -> Bool {
        if textfieldText.count >= 3 {
            return true
        }
        return false
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
