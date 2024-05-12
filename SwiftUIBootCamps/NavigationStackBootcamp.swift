//
//  NavigationStackBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 01/12/22.
//

import SwiftUI
import StoreKit

enum Route: Hashable {
    case product
    case category
}

struct NavigationStackBootcamp: View {
    @State var data: [Int: String] = [
            1: "One",
            2: "Two",
            3: "Three",
            4: "Four"
        ]

        var body: some View {
            NavigationStack {
                List {
                    ForEach(Array(data.keys).sorted(), id: \.self) { key in
                        NavigationLink("\(key)", value: key)
                    }
                }
                .navigationDestination(for: Int.self) { key in
                    SubContentView(key: key, data: $data)
                }
            }
            
//            NavigationStack {
//                   NavigationLink {
//                        Text("Destination Screen")
//                   } label: {
//                        Text("Goto Next Screen")
//                   }
//            }
        }
}

struct SubContentView: View {
    let key: Int
    @Binding var data: [Int: String]
    var body: some View {
        if let value = data[key] {
            VStack {
                Text("This is \(value)").padding()
                Button("Modify It") {
                    data[key] = "X"
                }
            }
        }
    }
}

struct NavigationStackBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackBootcamp()
    }
}
