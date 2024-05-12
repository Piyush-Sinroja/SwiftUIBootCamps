//
//  ViewThatFitsBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 12/02/24.
//

import SwiftUI

struct ViewThatFitsBootcamp: View {
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()

//            Text("This is demo text that i would like to display to the user!")
//                .lineLimit(1)
//                .minimumScaleFactor(0.3)
            ViewThatFits {
                Text("This is some text that i would like to display to the user!")
                Text("This is some text that i would like to display!")
                Text("This is some text!")
            }
        }
        .frame(height: 300)
        .padding(50)
        .font(.headline)
    }
}

#Preview {
    ViewThatFitsBootcamp()
}
