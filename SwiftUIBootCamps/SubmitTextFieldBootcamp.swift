//
//  SubmitTextFieldBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 13/04/23.
//

import SwiftUI

struct SubmitTextFieldBootcamp: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextField("placeholder...", text: $text)
                .submitLabel(.route)
                .onSubmit {
                    print("Something to the console!")
                }
            
            TextField("placeholder...", text: $text)
                .submitLabel(.next)
                .onSubmit {
                    print("Something to the next!")
                }
            
            TextField("placeholder...", text: $text)
                .submitLabel(.search)
                .onSubmit {
                    print("Something to the search!")
                }
        }
    }
}

struct SubmitTextFieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SubmitTextFieldBootcamp()
    }
}
