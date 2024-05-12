//
//  MenuBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 12/02/24.
//

import SwiftUI

struct MenuBootcamp: View {
    var body: some View {
        Menu {
            Button("Menu Item 1") {
                print("Menu Item 1")
            }
            Button("Menu Item 2") {
                print("Menu Item 2")
            }
            Button("Menu Item 3") {
                print("Menu Item 3")
            }
        } label: {
            Text("Click Me")
        }
    }
}

#Preview {
    MenuBootcamp()
}

