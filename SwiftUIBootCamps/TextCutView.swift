//
//  MyTestView.swift
//  Demo1
//
//  Created by Piyush Sinroja on 05/03/24.
//

import SwiftUI

extension String {
    var padded: String { self + "           " }
}

struct MyText: View {
    let value: String
    var body: some View {
        Text(value.padded)
    }
}

struct TextCutView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {

                Image(systemName: "person")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .background(.yellow)

                Spacer()

                MyText(value: "Improve absorption of skincare proff")
                    .background(Color.red)

                Spacer()

                Image(systemName: "person")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .background(.yellow)
            }
        }

        .padding(.horizontal, 8)
        .background(.green)
    }
}

#Preview {
    TextCutView()
}
