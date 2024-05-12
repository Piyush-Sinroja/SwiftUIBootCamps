//
//  LazyStackBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 04/04/23.
//

import SwiftUI

struct SampleRow: View {
    let id: Int
    
    var body: some View {
        Text("Row \(id)")
    }
    
    init(id: Int) {
        print("Loading row \(id)")
        self.id = id
    }
}

struct LazyStackBootcamp: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                 ForEach(1...1000, id: \.self, content: SampleRow.init)
            }
        }
    }
}

struct LazyStackBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LazyStackBootcamp()
    }
}
