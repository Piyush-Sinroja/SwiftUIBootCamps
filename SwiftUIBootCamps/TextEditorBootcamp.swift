//
//  TextEditorBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 10/04/23.
//

import SwiftUI

struct TextEditorBootcamp: View {
    
    @State var textEditor: String = "This is the starting text."
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditor)
                    .frame(height: 250)
                
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
            .background(Color.green)
            .navigationTitle("TextEditor Bootcamp!")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TextEditorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorBootcamp()
    }
}
