//
//  SlowListFix.swift
//  Demo1
//
//  Created by Piyush Sinroja on 01/12/22.
//

import SwiftUI

struct SlowListFix: View {
    
    @State var items = Array(1...5)
    
    var body: some View {
        VStack {
            Button("Shuffle") {
                self.items.shuffle()
            }
            List(items, id: \.self) {
                Text("Item \($0)")
            }
            .id(UUID()) // uuid given. otherwise taking time and high cpu.
        }
    }
}

struct SlowListFix_Previews: PreviewProvider {
    static var previews: some View {
        SlowListFix()
    }
}
