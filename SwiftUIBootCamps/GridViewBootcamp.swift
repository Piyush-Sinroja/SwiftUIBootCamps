//
//  GridViewBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 29/02/24.
//

import SwiftUI

struct GridViewBootcamp1: View {
    var body: some View {

        Grid ( horizontalSpacing: 20, verticalSpacing: 20 ) {
            GridRow {
                Text("R1, C1")
                Text("R1, C2")
            }
            GridRow {
                Text("R2, C1")
                Text("R2, C2")
            }
        }
    }
}

struct GridViewBootcamp2: View {
    var body: some View {

        Grid {
            GridRow {
                Text("Row 1")
                ForEach(0..<3) { _ in Circle().foregroundColor(.red) }
            }
            GridRow {
                Text("Row 2")
                ForEach(0..<5) { _ in Circle().foregroundColor(.green) }
            }
            GridRow {
                Text("Row 3")
                ForEach(0..<4) { _ in Circle().foregroundColor(.mint) }
            }
        }
    }
}

struct GridViewBootcamp3: View {
    var body: some View {

        Grid ( horizontalSpacing: 20, verticalSpacing: 20 ) {
            GridRow {
                Text("R1, C1")
                Text("R1, C2")
            }
            Text("This will expand into full column").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            GridRow {
                Text("R2, C1")
                Text("R2, C2")
            }
        }

    }
}

struct GridViewBootcamp4: View {
    var body: some View {

        Grid {
            GridRow {
                ForEach(0..<3) { _ in
                    Circle().foregroundColor(.red)
                }
            }
            GridRow {
                Circle().foregroundColor(.green)
                Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                Circle().foregroundColor(.green)
            }
            GridRow {
                ForEach(0..<3) { _ in Circle().foregroundColor(.mint) }
            }
        }
    }
}

struct GridViewBootcamp5: View {
    var body: some View {

        Grid {
            GridRow {
                ForEach(0..<3) { _ in
                    Circle().foregroundColor(.red)
                }
            }
            GridRow {
                Circle().foregroundColor(.green)
                Text("This will take space of 2 cell")
                    .gridCellColumns(2)
                    .font(.title)
            }
            GridRow {
                ForEach(0..<3) { _ in
                    Circle().foregroundColor(.mint)
                }
            }
        }

    }
}
#Preview {
    VStack {
        GridViewBootcamp1()
        GridViewBootcamp2()
        GridViewBootcamp3()
        GridViewBootcamp4()
    }
}

#Preview {
    GridViewBootcamp5()
}
