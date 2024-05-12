//
//  CustomModifier.swift
//  Demo1
//
//  Created by Piyush Sinroja on 30/11/22.
//

import SwiftUI

struct CustomModifier: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).modifier(SubheadlineModifier())
    }
}

struct SubheadlineModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.secondary)
            .font(.title)
            .background(.ultraThinMaterial)
    }
}

struct CustomModifier_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifier()
    }
}
