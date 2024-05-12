//
//  GridView.swift
//  Demo1
//
//  Created by Piyush Sinroja on 30/11/22.
//

import SwiftUI

struct GridView: View {
    
//    let data = (1...50).map { "Item \($0)" }
    
//    let columns = [
//        GridItem(.adaptive(minimum: 80))
//    ]
    
//        let columns = [
//            GridItem(.flexible()),
//            GridItem(.flexible()),
//            GridItem(.flexible()),
//            GridItem(.flexible()),
//            GridItem(.flexible())
//        ]
//
//
//
//    var body: some View {
//        ScrollView {
//            LazyVGrid(columns: columns, spacing: 20) {
//                ForEach(data, id: \.self) { item in
//                    Text(item)
//                }
//            }
//            .padding(.horizontal)
//        }
//        .frame(maxHeight: 300)
//    }
    
    //--------Horizontal----------
    
//    let items = 1...10
//
//    let rows = [
//        GridItem(.fixed(50)),
//        GridItem(.fixed(50))
//    ]
//
//    var body: some View {
//        ScrollView(.horizontal) {
//            LazyHGrid(rows: rows, alignment: .center) {
//                ForEach(items, id: \.self) { item in
//                    Image(systemName: "\(item).circle.fill")
//                        .font(.largeTitle)
//                }
//            }
//            .frame(height: 150)
//        }
//        .background(.red)
//    }
    
    //-------custom grid---------
    
//    var body: some View {
//        GridStack(rows: 4, columns: 4) { row, col in
//            Image(systemName: "\(row * 4 + col).circle")
//            Text("R\(row) C\(col)")
//        }
//    }
    
    //----------------
    
    /*
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 50, maximum: 300), spacing: nil, alignment: nil),
        GridItem(.adaptive(minimum: 150, maximum: 300), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<50) { index in
                Rectangle()
                    .frame(height: 50)
            }
        }
    }
     */
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20, alignment: nil),
        GridItem(.flexible(), spacing: 20, alignment: nil),
        GridItem(.flexible(), spacing: 20, alignment: nil)
    ]
    
    let colors: [Color] = [.red, .green, .blue, .yellow]
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(.orange)
                .frame(height: 400)
            
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 20,
                pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .frame(height: 150)
                                .foregroundColor(colors[index%4])
                                .cornerRadius(30)
                        }
                    } header: {
                        Text("Section 1")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.blue)
                            .padding()
                    }

                    Section {
                        ForEach(0..<20) { index in
                            Rectangle()
                                .frame(height: 150)
                                .foregroundColor(colors[index%4])
                                .cornerRadius(30)
                        }
                    } header: {
                        Text("Section 2")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.blue)
                            .padding()
                    }
                }.padding(.horizontal, 5)
        }
        
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}


struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}
