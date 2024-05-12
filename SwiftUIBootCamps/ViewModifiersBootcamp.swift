//
//  ViewModifiersBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 17/04/23.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(bgColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    func withDefaultButtonFormatting(bgColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(bgColor: bgColor))
    }
}

struct ViewModifiersBootcamp: View {
    var body: some View {
        VStack {
            Text("Hello world")
                .font(.footnote)
                .withDefaultButtonFormatting(bgColor: .green)
            
            Text("Hello everyone")
                .font(.subheadline)
                .withDefaultButtonFormatting(bgColor: .pink)
            
            Text("Hello developers")
                .modifier(DefaultButtonViewModifier(bgColor: .blue))
        }
    }
}

struct ViewModifiersBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifiersBootcamp()
    }
}
