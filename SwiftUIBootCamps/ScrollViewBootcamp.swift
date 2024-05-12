//
//  ScrollViewBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 30/11/22.
//

import SwiftUI

struct ScrollViewBootcamp: View {
    
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow, .brown]
    
//    var body: some View {
//        GeometryReader { geometry in
//            ScrollView {
//                ForEach(0..<50) { index in
//                    GeometryReader { geo in
//                        Text("Row #\(index), \(geo.frame(in: .global).minY) \(geo.frame(in: .global).minY - geometry.size.height / 2), \((geo.frame(in: .global).minY - geometry.size.height / 2) / 5) ")
//                            .font(.headline)
//                            .frame(maxWidth: .infinity)
//                            .background(colors[index % 7])
//                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - geometry.size.height / 2) / 5,
//
//                                              axis: (x: 0, y: 0, z: 0))
//                    }
//                    .frame(height: 40)
//                }
//            }
//        }
//    }
    
 
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 0) {
//                ForEach(1..<20) { num in
//                    GeometryReader { geo in
//                        Text("Number #\(num)")
//                            .font(.title)
//                            .padding()
//                            .background(.red)
//                            .rotation3DEffect(.degrees(-geo.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
//                            .frame(width: 200, height: 200)
//                    }
//                    .frame(width: 200, height: 200)
//                }
//            }
//        }
//    }
    
    
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                Button("Jump to 8") {
                    value.scrollTo(8, anchor: .center)
                }

                ForEach(0..<10) { i in
                    Text("Example \(i)")
                        .frame(width: 300, height: 300)
                        .background(colors[i % colors.count])
                        .id(i)
                }
            }
        }
    }
    
    
//    var body: some View {
//        ScrollView {
//            VStack {
//                ForEach(0..<5) { index in
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(0..<5) {
//                                index in
//                                RoundedRectangle(cornerRadius: 25)
//                                    .fill(.white)
//                                    .frame(width: 200, height: 150)
//                                    .shadow(radius: 5)
//                                    .padding()
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
}

struct ScrollViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewBootcamp()
    }
}
