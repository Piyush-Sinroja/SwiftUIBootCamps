//
//  ImproveListBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 05/04/23.
//

import SwiftUI

struct ImproveListBootcamp: View {
    
    @State var items = Array(1...10000)
    @Namespace private var namespace
    @State private var isFlipped = false

    var body: some View {
//        VStack {
//            Button("Shuffle") {
//                self.items.shuffle()
//            }
//            
//            List(items, id: \.self) {
//                Text("Item \($0)")
//            }
//            .id(UUID())
//        }
//        .onAppear {
//            check()
//        }

        VStack {
            if isFlipped {
                Rectangle()
                    .matchedGeometryEffect(id: "shape", in: namespace)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
            } else {
                Circle()
                    .matchedGeometryEffect(id: "shape", in: namespace)
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .foregroundColor(.red)
            }

            Button("Toggle") {
                withAnimation {
                    isFlipped.toggle()
                }
            }
        }
        .padding()
    }

    func check() {
        var arr: [String] = []
        let value = arr.removeLast()

        print(value)
    }
}

struct ImproveListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImproveListBootcamp()
    }
}
