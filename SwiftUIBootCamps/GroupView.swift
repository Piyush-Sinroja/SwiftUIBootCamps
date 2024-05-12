//
//  GroupView.swift
//  Demo1
//
//  Created by Piyush Sinroja on 30/11/22.
//

import SwiftUI

struct GroupView: View {
    var body: some View {
        VStack {
            Group {
                Text("Hello")
                Text("World")
                Text("!!!")
            }
            .background(Color.yellow)
            .padding()
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
