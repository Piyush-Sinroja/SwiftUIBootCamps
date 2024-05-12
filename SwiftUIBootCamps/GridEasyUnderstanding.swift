//
//  GridNew.swift
//  Demo1
//
//  Created by Piyush Sinroja on 29/02/24.
//

import SwiftUI
// https://sarunw.com/posts/swiftui-lazyvgrid-lazyhgrid/
struct GridColumnUnderstand: View {

    private var data  = Array(1...20)

    let columns = [
        GridItem(.fixed(50)),
        GridItem(.fixed(100)),
        GridItem(.fixed(200)),
    ]

    var body: some View {
        ScrollView {
            // 3
            LazyVGrid(columns: columns) {
                ForEach(0..<100) { i in
                    Text("Item \(i)")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(.yellow)
                }
            }
        }
    }
}

struct GridRowUnderstand: View {

    let rows = [
        GridItem(.fixed(50)),
        GridItem(.fixed(100)),
        GridItem(.fixed(200))
    ]

    var body: some View {
        ScrollView(.horizontal) {
            // 3
            LazyHGrid(rows: rows) {
                ForEach(0..<100) { i in
                    Text("Item \(i)")
                        .frame(minWidth: 60, maxHeight: .infinity)
                        .background(.yellow)
                }
            }
        }
    }
}

#Preview {
    GridColumnUnderstand()
}

#Preview {
    GridRowUnderstand()
}


struct GridFlexibleColumnUnderstand1: View {

    private var data  = Array(1...20)

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            // 3
            LazyVGrid(columns: columns) {
                ForEach(0..<100) { i in
                    Text("Item \(i)")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(.yellow)
                }
            }
        }
    }
}

struct GridFlexibleColumnUnderstand2: View {

    private var data  = Array(1...20)

    let columns = [
        GridItem(.flexible(minimum: 10, maximum: 60)),
        GridItem(.flexible(minimum: 50, maximum: 200)),
        GridItem(.flexible(minimum: 10, maximum: 300))
    ]

    var body: some View {
        ScrollView {
            // 3
            LazyVGrid(columns: columns) {
                ForEach(0..<100) { i in
                    Text("Item \(i)")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(.yellow)
                }
            }
        }
    }
}


struct GridAdaptiveRowUnderstand1: View {

    let rows = [
        //GridItem(.fixed(100)),
        GridItem(.adaptive(minimum: 50))
    ]

    var body: some View {
        // 1
        ScrollView(.horizontal) {
            // 2
            LazyHGrid(rows: rows) {
                ForEach(0..<100) { i in
                    Text("Item \(i)")
                    // 3
                        .frame(minWidth: 100, maxHeight: .infinity)
                        .background(.yellow)
                }

            }
        }
    }
}

#Preview {
    GridAdaptiveRowUnderstand1()
}
