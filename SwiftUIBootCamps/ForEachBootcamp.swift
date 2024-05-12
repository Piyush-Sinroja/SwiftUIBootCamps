//
//  ForEachBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 07/04/23.
//

import SwiftUI

struct ForEachBootcamp: View {
    
//    var body: some View {
//        VStack {
//            ForEach(0..<10) { index in
//                Text("Hi: \(index)")
//            }
//        }
//    }
    
    let data: [String] = ["a", "b", "c", "d", "e"]
    let myString: String = "Good"
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(data.indices) { index in
                    Text("\(data[index]) \(index)")
                }

                ForEach(0..<100) { index in
                    Circle()
                        .frame(height: 50)
                }
            }

        }
    }
}

struct ForEachBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ForEachBootcamp()
    }
}
